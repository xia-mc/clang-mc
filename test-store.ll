define void @test() {
  %ptr = alloca i32
  store i32 42, i32* %ptr
  ret void
}
