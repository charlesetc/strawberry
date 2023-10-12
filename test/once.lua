local once = require "once"
local expect = require "expect"

local function foo()
  print("foo")
  return 2
end

expect.test("test once", [[
foo
2
2
2
]], function()
  local f = once(foo)
  print(f())
  print(f())
  print(f())
end)
