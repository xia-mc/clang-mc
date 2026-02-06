; Simple test for MOV and ADD instructions
define i32 @test_mov_imm() {
entry:
  ret i32 42
}

define i32 @test_mov_reg(i32 %a) {
entry:
  ret i32 %a
}

define i32 @test_add(i32 %a, i32 %b) {
entry:
  %sum = add i32 %a, %b
  ret i32 %sum
}

define i32 @test_add_imm(i32 %a) {
entry:
  %sum = add i32 %a, 10
  ret i32 %sum
}
