local once = require "once"
local callable = require "callable"
local sqlite3 = require "lsqlite3complete"
local sql_variant_spec = require 'sql_variant.spec'

local SQLVariant = {}

SQLVariant.database_file = "database.sqlite3"

local db = once(function()
  sqlite3.open(SQLVariant.database_file)
end)

local function createVariant(tag, spec)
  sql_variant_spec.validate(spec)
  local v = { tag = tag, spec = spec }

  local function create(o)
    o = o or {}
    setmetatable(o, { __index = v })
    if o.init then
      o:init(o)
    end
    return o
  end

  callable(v, create)
  return v
end

SQLVariant.types = sql_variant_spec.types

callable(SQLVariant, createVariant)

return SQLVariant
