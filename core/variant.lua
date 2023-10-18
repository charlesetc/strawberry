
local callable = require "callable"
local metatable = require "metatable"
local ml = require "ml"

-- TODO: 
--
-- 1. Write match
-- 2. Write a TYPED database ORM for lua that writes to sqlite
-- 4. Write an html templating engine that uses these variants
-- 5. Write a web server and platform for develpoing web apps in lua,
--    making use of these variants.
-- 6. Write inreal.space in lua

local Variant = {}

local function create_new_variant_type(tag)
  local v = { tag = tag }

  local function create(o)
    o = o or {}
    if o.init then
      o:init(o)
    end

    local m = metatable(o)
    m.__index = v

    function m:__tostring()
      local fields = ml.keys(o)
      local result = o.tag .. " {"

      for _, k in ipairs(fields) do
        if k ~= "tag" then
          result = result .. k .. " = " .. tostring(o[k]) .. ", "
        end
      end

      return result:sub(1, -3) .. "}"
    end


    return o
  end

  function v:match(cases)
    return {"matching", self.tag, cases}
  end

  callable(v, create)
  return v
end

callable(Variant, create_new_variant_type)

return Variant
