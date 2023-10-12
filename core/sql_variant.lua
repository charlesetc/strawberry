local once = require "once"
local callable = require "callable"
local sqlite3 = require "lsqlite3complete"

local SQLVariant = {}

SQLVariant.database_file = "database.sqlite3"

local db = once(function()
  sqlite3.open(SQLVariant.database_file)
end)

local function create(tag, spec)
  return {tag = tag, spec = spec}
end

callable(SQLVariant, create)

return SQLVariant
