//
// Created by xia__mc on 2025/2/13.
//

#include "ClangMc.h"
#include "llvm/Support/raw_ostream.h"
#include "llvm/Config/llvm-config.h"

ClangMc *ClangMc::INSTANCE;

ClangMc::ClangMc(const Config &config) {
    INSTANCE = this;
    this->config = config;
}

void ClangMc::start() {

}
