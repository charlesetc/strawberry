local SQLVariant = require "sql_variant"
local expect = require "expect"

expect.test("test simple sql variant", [[
{"spec" = "spec", "tag" = "tag"}
]], function()
  local Variant = SQLVariant("tag", "spec")

  pp(Variant)
end)
