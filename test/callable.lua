local callable = require "callable"
local expect = require "expect"

local function foo(...)
  local args = table.pack(...)
  return { y = 2 ,  args = args } 
end

expect.test("test callable", [[
{"hi" = 2}
2
{"args" = {1 = 2, 2 = 3, 3 = 4, 4 = 5, "n" = 4}, "y" = 2}
]], function()

  local a = {hi = 2}
  callable(a, foo)

  pp(a)
  pp(a.hi)
  pp(a(2,3,4,5))
end)
