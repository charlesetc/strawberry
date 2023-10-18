-- test the expect test library itself
local expect = require("expect")

expect.test("my first test", [[
2 plus 2 is
4
]], function()
  print("2 plus 2 is")
  print(2 + 2)
end)

expect.test("test that 2 + 2  =4 ", [[
4
]], function()
  print(2 + 2)
end)
