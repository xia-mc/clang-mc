//===-- McasmInstrFoldTables.cpp - Mcasm Instruction Folding Tables -----------===//
//
// Part of the LLVM Project, under the Apache License v2.0 with LLVM Exceptions.
// See https://llvm.org/LICENSE.txt for license information.
// SPDX-License-Identifier: Apache-2.0 WITH LLVM-exception
//
//===----------------------------------------------------------------------===//
//
// This file contains the Mcasm memory folding tables.
//
//===----------------------------------------------------------------------===//

#include "McasmInstrFoldTables.h"
#include "McasmInstrInfo.h"
#include "llvm/ADT/STLExtras.h"
#include <atomic>
#include <vector>

using namespace llvm;

// These tables are sorted by their RegOp value allowing them to be binary
// searched at runtime without the need for additional storage. The enum values
// are currently emitted in McasmGenInstrInfo.inc in alphabetical order. Which
// makes sorting these tables a simple matter of alphabetizing the table.
#include "McasmGenFoldTables.inc"

// Table to map instructions safe to broadcast using a different width from the
// element width.
static const McasmFoldTableEntry BroadcastSizeTable2[] = {
  { Mcasm::VANDNPDZ128rr,        Mcasm::VANDNPSZ128rmb,       TB_BCAST_SS },
  { Mcasm::VANDNPDZ256rr,        Mcasm::VANDNPSZ256rmb,       TB_BCAST_SS },
  { Mcasm::VANDNPDZrr,           Mcasm::VANDNPSZrmb,          TB_BCAST_SS },
  { Mcasm::VANDNPSZ128rr,        Mcasm::VANDNPDZ128rmb,       TB_BCAST_SD },
  { Mcasm::VANDNPSZ256rr,        Mcasm::VANDNPDZ256rmb,       TB_BCAST_SD },
  { Mcasm::VANDNPSZrr,           Mcasm::VANDNPDZrmb,          TB_BCAST_SD },
  { Mcasm::VANDPDZ128rr,         Mcasm::VANDPSZ128rmb,        TB_BCAST_SS },
  { Mcasm::VANDPDZ256rr,         Mcasm::VANDPSZ256rmb,        TB_BCAST_SS },
  { Mcasm::VANDPDZrr,            Mcasm::VANDPSZrmb,           TB_BCAST_SS },
  { Mcasm::VANDPSZ128rr,         Mcasm::VANDPDZ128rmb,        TB_BCAST_SD },
  { Mcasm::VANDPSZ256rr,         Mcasm::VANDPDZ256rmb,        TB_BCAST_SD },
  { Mcasm::VANDPSZrr,            Mcasm::VANDPDZrmb,           TB_BCAST_SD },
  { Mcasm::VORPDZ128rr,          Mcasm::VORPSZ128rmb,         TB_BCAST_SS },
  { Mcasm::VORPDZ256rr,          Mcasm::VORPSZ256rmb,         TB_BCAST_SS },
  { Mcasm::VORPDZrr,             Mcasm::VORPSZrmb,            TB_BCAST_SS },
  { Mcasm::VORPSZ128rr,          Mcasm::VORPDZ128rmb,         TB_BCAST_SD },
  { Mcasm::VORPSZ256rr,          Mcasm::VORPDZ256rmb,         TB_BCAST_SD },
  { Mcasm::VORPSZrr,             Mcasm::VORPDZrmb,            TB_BCAST_SD },
  { Mcasm::VPANDDZ128rr,         Mcasm::VPANDQZ128rmb,        TB_BCAST_Q },
  { Mcasm::VPANDDZ256rr,         Mcasm::VPANDQZ256rmb,        TB_BCAST_Q },
  { Mcasm::VPANDDZrr,            Mcasm::VPANDQZrmb,           TB_BCAST_Q },
  { Mcasm::VPANDNDZ128rr,        Mcasm::VPANDNQZ128rmb,       TB_BCAST_Q },
  { Mcasm::VPANDNDZ256rr,        Mcasm::VPANDNQZ256rmb,       TB_BCAST_Q },
  { Mcasm::VPANDNDZrr,           Mcasm::VPANDNQZrmb,          TB_BCAST_Q },
  { Mcasm::VPANDNQZ128rr,        Mcasm::VPANDNDZ128rmb,       TB_BCAST_D },
  { Mcasm::VPANDNQZ256rr,        Mcasm::VPANDNDZ256rmb,       TB_BCAST_D },
  { Mcasm::VPANDNQZrr,           Mcasm::VPANDNDZrmb,          TB_BCAST_D },
  { Mcasm::VPANDQZ128rr,         Mcasm::VPANDDZ128rmb,        TB_BCAST_D },
  { Mcasm::VPANDQZ256rr,         Mcasm::VPANDDZ256rmb,        TB_BCAST_D },
  { Mcasm::VPANDQZrr,            Mcasm::VPANDDZrmb,           TB_BCAST_D },
  { Mcasm::VPORDZ128rr,          Mcasm::VPORQZ128rmb,         TB_BCAST_Q },
  { Mcasm::VPORDZ256rr,          Mcasm::VPORQZ256rmb,         TB_BCAST_Q },
  { Mcasm::VPORDZrr,             Mcasm::VPORQZrmb,            TB_BCAST_Q },
  { Mcasm::VPORQZ128rr,          Mcasm::VPORDZ128rmb,         TB_BCAST_D },
  { Mcasm::VPORQZ256rr,          Mcasm::VPORDZ256rmb,         TB_BCAST_D },
  { Mcasm::VPORQZrr,             Mcasm::VPORDZrmb,            TB_BCAST_D },
  { Mcasm::VPXORDZ128rr,         Mcasm::VPXORQZ128rmb,        TB_BCAST_Q },
  { Mcasm::VPXORDZ256rr,         Mcasm::VPXORQZ256rmb,        TB_BCAST_Q },
  { Mcasm::VPXORDZrr,            Mcasm::VPXORQZrmb,           TB_BCAST_Q },
  { Mcasm::VPXORQZ128rr,         Mcasm::VPXORDZ128rmb,        TB_BCAST_D },
  { Mcasm::VPXORQZ256rr,         Mcasm::VPXORDZ256rmb,        TB_BCAST_D },
  { Mcasm::VPXORQZrr,            Mcasm::VPXORDZrmb,           TB_BCAST_D },
  { Mcasm::VXORPDZ128rr,         Mcasm::VXORPSZ128rmb,        TB_BCAST_SS },
  { Mcasm::VXORPDZ256rr,         Mcasm::VXORPSZ256rmb,        TB_BCAST_SS },
  { Mcasm::VXORPDZrr,            Mcasm::VXORPSZrmb,           TB_BCAST_SS },
  { Mcasm::VXORPSZ128rr,         Mcasm::VXORPDZ128rmb,        TB_BCAST_SD },
  { Mcasm::VXORPSZ256rr,         Mcasm::VXORPDZ256rmb,        TB_BCAST_SD },
  { Mcasm::VXORPSZrr,            Mcasm::VXORPDZrmb,           TB_BCAST_SD },
};

static const McasmFoldTableEntry BroadcastSizeTable3[] = {
  { Mcasm::VPTERNLOGDZ128rri,    Mcasm::VPTERNLOGQZ128rmbi,   TB_BCAST_Q },
  { Mcasm::VPTERNLOGDZ256rri,    Mcasm::VPTERNLOGQZ256rmbi,   TB_BCAST_Q },
  { Mcasm::VPTERNLOGDZrri,       Mcasm::VPTERNLOGQZrmbi,      TB_BCAST_Q },
  { Mcasm::VPTERNLOGQZ128rri,    Mcasm::VPTERNLOGDZ128rmbi,   TB_BCAST_D },
  { Mcasm::VPTERNLOGQZ256rri,    Mcasm::VPTERNLOGDZ256rmbi,   TB_BCAST_D },
  { Mcasm::VPTERNLOGQZrri,       Mcasm::VPTERNLOGDZrmbi,      TB_BCAST_D },
};

static const McasmFoldTableEntry *
lookupFoldTableImpl(ArrayRef<McasmFoldTableEntry> Table, unsigned RegOp) {
#ifndef NDEBUG
#define CHECK_SORTED_UNIQUE(TABLE)                                             \
  assert(llvm::is_sorted(TABLE) && #TABLE " is not sorted");                   \
  assert(std::adjacent_find(std::begin(Table), std::end(Table)) ==             \
             std::end(Table) &&                                                \
         #TABLE " is not unique");

  // Make sure the tables are sorted.
  static std::atomic<bool> FoldTablesChecked(false);
  if (!FoldTablesChecked.load(std::memory_order_relaxed)) {
    CHECK_SORTED_UNIQUE(Table2Addr)
    CHECK_SORTED_UNIQUE(Table0)
    CHECK_SORTED_UNIQUE(Table1)
    CHECK_SORTED_UNIQUE(Table2)
    CHECK_SORTED_UNIQUE(Table3)
    CHECK_SORTED_UNIQUE(Table4)
    CHECK_SORTED_UNIQUE(BroadcastTable1)
    CHECK_SORTED_UNIQUE(BroadcastTable2)
    CHECK_SORTED_UNIQUE(BroadcastTable3)
    CHECK_SORTED_UNIQUE(BroadcastTable4)
    CHECK_SORTED_UNIQUE(BroadcastSizeTable2)
    CHECK_SORTED_UNIQUE(BroadcastSizeTable3)
    FoldTablesChecked.store(true, std::memory_order_relaxed);
  }
#endif

  const McasmFoldTableEntry *Data = llvm::lower_bound(Table, RegOp);
  if (Data != Table.end() && Data->KeyOp == RegOp &&
      !(Data->Flags & TB_NO_FORWARD))
    return Data;
  return nullptr;
}

const McasmFoldTableEntry *llvm::lookupTwoAddrFoldTable(unsigned RegOp) {
  return lookupFoldTableImpl(Table2Addr, RegOp);
}

const McasmFoldTableEntry *llvm::lookupFoldTable(unsigned RegOp, unsigned OpNum) {
  ArrayRef<McasmFoldTableEntry> FoldTable;
  if (OpNum == 0)
    FoldTable = ArrayRef(Table0);
  else if (OpNum == 1)
    FoldTable = ArrayRef(Table1);
  else if (OpNum == 2)
    FoldTable = ArrayRef(Table2);
  else if (OpNum == 3)
    FoldTable = ArrayRef(Table3);
  else if (OpNum == 4)
    FoldTable = ArrayRef(Table4);
  else
    return nullptr;

  return lookupFoldTableImpl(FoldTable, RegOp);
}

const McasmFoldTableEntry *llvm::lookupBroadcastFoldTable(unsigned RegOp,
                                                        unsigned OpNum) {
  ArrayRef<McasmFoldTableEntry> FoldTable;
  if (OpNum == 1)
    FoldTable = ArrayRef(BroadcastTable1);
  else if (OpNum == 2)
    FoldTable = ArrayRef(BroadcastTable2);
  else if (OpNum == 3)
    FoldTable = ArrayRef(BroadcastTable3);
  else if (OpNum == 4)
    FoldTable = ArrayRef(BroadcastTable4);
  else
    return nullptr;

  return lookupFoldTableImpl(FoldTable, RegOp);
}

namespace {

// This class stores the memory unfolding tables. It is instantiated as a
// function scope static variable to lazily init the unfolding table.
struct McasmMemUnfoldTable {
  // Stores memory unfolding tables entries sorted by opcode.
  std::vector<McasmFoldTableEntry> Table;

  McasmMemUnfoldTable() {
    for (const McasmFoldTableEntry &Entry : Table2Addr)
      // Index 0, folded load and store, no alignment requirement.
      addTableEntry(Entry, TB_INDEX_0 | TB_FOLDED_LOAD | TB_FOLDED_STORE);

    for (const McasmFoldTableEntry &Entry : Table0)
      // Index 0, mix of loads and stores.
      addTableEntry(Entry, TB_INDEX_0);

    for (const McasmFoldTableEntry &Entry : Table1)
      // Index 1, folded load
      addTableEntry(Entry, TB_INDEX_1 | TB_FOLDED_LOAD);

    for (const McasmFoldTableEntry &Entry : Table2)
      // Index 2, folded load
      addTableEntry(Entry, TB_INDEX_2 | TB_FOLDED_LOAD);

    for (const McasmFoldTableEntry &Entry : Table3)
      // Index 3, folded load
      addTableEntry(Entry, TB_INDEX_3 | TB_FOLDED_LOAD);

    for (const McasmFoldTableEntry &Entry : Table4)
      // Index 4, folded load
      addTableEntry(Entry, TB_INDEX_4 | TB_FOLDED_LOAD);

    // Broadcast tables.
    for (const McasmFoldTableEntry &Entry : BroadcastTable1)
      // Index 1, folded broadcast
      addTableEntry(Entry, TB_INDEX_1 | TB_FOLDED_LOAD);

    for (const McasmFoldTableEntry &Entry : BroadcastTable2)
      // Index 2, folded broadcast
      addTableEntry(Entry, TB_INDEX_2 | TB_FOLDED_LOAD);

    for (const McasmFoldTableEntry &Entry : BroadcastTable3)
      // Index 3, folded broadcast
      addTableEntry(Entry, TB_INDEX_3 | TB_FOLDED_LOAD);

    for (const McasmFoldTableEntry &Entry : BroadcastTable4)
      // Index 4, folded broadcast
      addTableEntry(Entry, TB_INDEX_4 | TB_FOLDED_LOAD);

    // Sort the memory->reg unfold table.
    array_pod_sort(Table.begin(), Table.end());

    // Now that it's sorted, ensure its unique.
    assert(std::adjacent_find(Table.begin(), Table.end()) == Table.end() &&
           "Memory unfolding table is not unique!");
  }

  void addTableEntry(const McasmFoldTableEntry &Entry, uint16_t ExtraFlags) {
    // NOTE: This swaps the KeyOp and DstOp in the table so we can sort it.
    if ((Entry.Flags & TB_NO_REVERSE) == 0)
      Table.push_back({Entry.DstOp, Entry.KeyOp,
                       static_cast<uint16_t>(Entry.Flags | ExtraFlags)});
  }
};
} // namespace

const McasmFoldTableEntry *llvm::lookupUnfoldTable(unsigned MemOp) {
  static McasmMemUnfoldTable MemUnfoldTable;
  auto &Table = MemUnfoldTable.Table;
  auto I = llvm::lower_bound(Table, MemOp);
  if (I != Table.end() && I->KeyOp == MemOp)
    return &*I;
  return nullptr;
}

namespace {

// This class stores the memory -> broadcast folding tables. It is instantiated
// as a function scope static variable to lazily init the folding table.
struct McasmBroadcastFoldTable {
  // Stores memory broadcast folding tables entries sorted by opcode.
  std::vector<McasmFoldTableEntry> Table;

  McasmBroadcastFoldTable() {
    // Broadcast tables.
    for (const McasmFoldTableEntry &Reg2Bcst : BroadcastTable2) {
      unsigned RegOp = Reg2Bcst.KeyOp;
      unsigned BcstOp = Reg2Bcst.DstOp;
      if (const McasmFoldTableEntry *Reg2Mem = lookupFoldTable(RegOp, 2)) {
        unsigned MemOp = Reg2Mem->DstOp;
        uint16_t Flags =
            Reg2Mem->Flags | Reg2Bcst.Flags | TB_INDEX_2 | TB_FOLDED_LOAD;
        Table.push_back({MemOp, BcstOp, Flags});
      }
    }
    for (const McasmFoldTableEntry &Reg2Bcst : BroadcastSizeTable2) {
      unsigned RegOp = Reg2Bcst.KeyOp;
      unsigned BcstOp = Reg2Bcst.DstOp;
      if (const McasmFoldTableEntry *Reg2Mem = lookupFoldTable(RegOp, 2)) {
        unsigned MemOp = Reg2Mem->DstOp;
        uint16_t Flags =
            Reg2Mem->Flags | Reg2Bcst.Flags | TB_INDEX_2 | TB_FOLDED_LOAD;
        Table.push_back({MemOp, BcstOp, Flags});
      }
    }

    for (const McasmFoldTableEntry &Reg2Bcst : BroadcastTable3) {
      unsigned RegOp = Reg2Bcst.KeyOp;
      unsigned BcstOp = Reg2Bcst.DstOp;
      if (const McasmFoldTableEntry *Reg2Mem = lookupFoldTable(RegOp, 3)) {
        unsigned MemOp = Reg2Mem->DstOp;
        uint16_t Flags =
            Reg2Mem->Flags | Reg2Bcst.Flags | TB_INDEX_3 | TB_FOLDED_LOAD;
        Table.push_back({MemOp, BcstOp, Flags});
      }
    }
    for (const McasmFoldTableEntry &Reg2Bcst : BroadcastSizeTable3) {
      unsigned RegOp = Reg2Bcst.KeyOp;
      unsigned BcstOp = Reg2Bcst.DstOp;
      if (const McasmFoldTableEntry *Reg2Mem = lookupFoldTable(RegOp, 3)) {
        unsigned MemOp = Reg2Mem->DstOp;
        uint16_t Flags =
            Reg2Mem->Flags | Reg2Bcst.Flags | TB_INDEX_3 | TB_FOLDED_LOAD;
        Table.push_back({MemOp, BcstOp, Flags});
      }
    }

    for (const McasmFoldTableEntry &Reg2Bcst : BroadcastTable4) {
      unsigned RegOp = Reg2Bcst.KeyOp;
      unsigned BcstOp = Reg2Bcst.DstOp;
      if (const McasmFoldTableEntry *Reg2Mem = lookupFoldTable(RegOp, 4)) {
        unsigned MemOp = Reg2Mem->DstOp;
        uint16_t Flags =
            Reg2Mem->Flags | Reg2Bcst.Flags | TB_INDEX_4 | TB_FOLDED_LOAD;
        Table.push_back({MemOp, BcstOp, Flags});
      }
    }

    // Sort the memory->broadcast fold table.
    array_pod_sort(Table.begin(), Table.end());
  }
};
} // namespace

bool llvm::matchBroadcastSize(const McasmFoldTableEntry &Entry,
                              unsigned BroadcastBits) {
  switch (Entry.Flags & TB_BCAST_MASK) {
  case TB_BCAST_W:
  case TB_BCAST_SH:
    return BroadcastBits == 16;
  case TB_BCAST_D:
  case TB_BCAST_SS:
    return BroadcastBits == 32;
  case TB_BCAST_Q:
  case TB_BCAST_SD:
    return BroadcastBits == 64;
  }
  return false;
}

const McasmFoldTableEntry *
llvm::lookupBroadcastFoldTableBySize(unsigned MemOp, unsigned BroadcastBits) {
  static McasmBroadcastFoldTable BroadcastFoldTable;
  auto &Table = BroadcastFoldTable.Table;
  for (auto I = llvm::lower_bound(Table, MemOp);
       I != Table.end() && I->KeyOp == MemOp; ++I) {
    if (matchBroadcastSize(*I, BroadcastBits))
      return &*I;
  }
  return nullptr;
}
