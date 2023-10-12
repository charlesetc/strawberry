Variant = require("variant")
expect = require("expect")

Ball = Variant("Ball")

function Ball:area()
  return self.height * self.width
end

expect.test("create a variant", [[
8
]], function()
  local b = Ball { height = 4, width = 2 }
  print(b:area())
end)
