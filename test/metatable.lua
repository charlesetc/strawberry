local metatable = require "metatable"
local expect = require "expect"

expect.test("test metatable", [[
a
b
]], function()
  local o = { foo = "a"}
  local mt = metatable(o)
  mt.__index = { bar = "b" }

  print(o.foo)
  print(o.bar)
end)
