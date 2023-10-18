local pretty = require 'pl.pretty'

local types = {
  bool = 'bool',
  string = 'string',
  number = 'number',
}

local function validate(spec)
  if type(spec) ~= 'table' then
    error("spec must be a table")
  end

  for _, v in pairs(spec) do
    if type(v) == 'table' then
      validate(v)
    elseif types[v] == nil then
      error("invalid type: " .. v)
    end
  end
end

local function check(spec, object)
  if type(spec) ~= 'table' then
    error("spec must be a table")
  end

  if type(object) ~= 'table' then
    error("failed spec check: object must be a table")
  end

  for key, value_spec in pairs(spec) do
    if type(value_spec) == 'table' then
      check(value_spec, object[key])
    elseif type(object[key]) ~= value_spec then
      local result = pretty.write(object[key])
      error("failed spec check: " .. key .. " must be a " .. value_spec .." but is a " .. type(object[key]) .. ": " .. result)
    end
  end
end

return {
  validate = validate,
  check = check,
  types = types
}
