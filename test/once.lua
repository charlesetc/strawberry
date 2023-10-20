local once = require "once"
local expect = require "expect"

local function foo()
  print("foo")
  return 3
end

expect.test("test once", [[
foo
3
3
3
]], function()
  local f = once(foo)
  print(f())
  print(f())
  print(f())
end)
