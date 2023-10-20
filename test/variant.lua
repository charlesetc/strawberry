Variant = require("variant")
expect = require("expect")

Ball = Variant("Ball")
Crow = Variant("Crow")

function Ball:area()
  return self.height * self.width
end

expect.test("create a variant", [[
8
]], function()
  local b = Ball { height = 4, width = 2 }
  print(b:area())
end)

function ball_or_crow(b) 
  b:match({
    Ball = function()
      print("It's a ball")
    end,
    Crow = function()
      print("It's a crow")
    end
  })
end

expect.test("match a variant", [[
It's a ball
It's a crow
]], function() 
  local b = Ball { height = 4, width = 2 }
  local c = Crow { name = 'Barry' }

  ball_or_crow(b)
  ball_or_crow(c)
end)
