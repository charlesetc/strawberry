local callable = require "callable"
local expect = require "expect"

local function foo(...)
  local args = table.pack(...)
  return { x = 2 , y = 3, args = args } 
end

expect.test("test callable", [[
{"hi" = 2}
2
{"args" = {1 = 2, 2 = 3, 3 = 4, 4 = 5, "n" = 4}, "x" = 2, "y" = 3}
]], function()

  local a = {hi = 2}
  callable(a, foo)

  pp(a)
  pp(a.hi)
  pp(a(2,3,4,5))
end)
