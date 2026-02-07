@g = global i32 0

define void @test() {
  store i32 42, i32* @g
  ret void
}
