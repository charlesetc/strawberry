local SQLVariant = require "sql_variant"
local sql_variant_spec = require 'sql_variant.spec'
local expect = require "expect"
local types = SQLVariant.types

expect.test("test simple sql variant", [[
{"spec" = {"age" = "number", "name" = "number"}, "tag" = "Animal"}
{"age" = 3, "name" = "Dog"}
"Animal"
]], function()
  local Animal = SQLVariant("Animal", {
    name = types.number,
    age = types.number,
  })

  local v = Animal { name = "Dog", age = 3 }

  pp(Animal)
  pp(v)
  pp(v.tag)
end)


expect.test("test valid spec validation", [[

]], function()
  local spec = {
    name = types.number,
    age = types.number,
    foo = {
      bar = types.number,
    }
  }

  sql_variant_spec.validate(spec)

end)

local spec1 = {
  name = types.string,
  age = types.number,
  foo = {
    bar = types.number,
  }
}


expect.test("test valid spec validation", [[

]], function()
  sql_variant_spec.validate(spec1)
end)

expect.test("invalid test validation", [[
./core/sql_variant/spec.lua:18: invalid type: invalid
stack traceback:
	[C]: in function 'error'
	./core/sql_variant/spec.lua:18: in function 'sql_variant.spec.validate'
	test/sql_variant.lua:71: in function <test/sql_variant.lua:66>
	[C]: in function 'xpcall'
	./core/expect.lua:65: in method 'run'
	./core/expect.lua:152: in function 'expect.run_tests'
	./core/lake.lua:37: in function 'core.lake'
	lake.lua:14: in main chunk
	[C]: in ?
]], function()
  local spec = {
    wow = "invalid",
  }

  sql_variant_spec.validate(spec)
end)

expect.test("test spec check", [[
{"age" = 4, "foo" = {"bar" = 5}, "name" = "Dog"}
]], function()
  local object = {
    name = "Dog",
    age = 4,
    foo = {
      bar = 5,
    }
  }

  sql_variant_spec.check(spec1, object)

  pp(object)
end)


expect.test("test invalid spec check", [[
./core/sql_variant/spec.lua:37: failed spec check: age must be a number but is a string: "age should not be a string"
stack traceback:
	[C]: in function 'error'
	./core/sql_variant/spec.lua:37: in function 'sql_variant.spec.check'
	test/sql_variant.lua:112: in function <test/sql_variant.lua:103>
	[C]: in function 'xpcall'
	./core/expect.lua:65: in method 'run'
	./core/expect.lua:152: in function 'expect.run_tests'
	./core/lake.lua:37: in function 'core.lake'
	lake.lua:14: in main chunk
	[C]: in ?
]], function()
  local object = {
    name = "Dog",
    age = "age should not be a string",
    foo = {
      bar = 5,
    }
  }

  sql_variant_spec.check(spec1, object)
end)

