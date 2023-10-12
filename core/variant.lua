
-- TODO: 
--
-- 1. Write match
-- 2. Write a TYPED database ORM for lua that writes to sqlite
-- 4. Write an html templating engine that uses these variants
-- 5. Write a web server and platform for develpoing web apps in lua,
--    making use of these variants.
-- 6. Write inreal.space in lua

variant_mt = {}

function variant_mt:__call(o)
  o = o or {} -- create object if user does not provide one
  setmetatable(o, v)
  self.__index = self
  if o.init then
    o:init(o)
  end
  return o
end

function Variant(tag)
  local v = {}
  local mt = {}

  function mt:__call(o)
    o = o or {} -- create object if user does not provide one
    setmetatable(o, { __index = v })
    if o.init then
      o:init(o)
    end
    return o
  end

  setmetatable(v, mt)

  -- v.metatable.__call = function(self, o)
  --   o = o or {} -- create object if user does not provide one
  --   setmetatable(o, v)
  --   o.__index = v
  --   if o.init then
  --     o:init(o)
  --   end
  --   return o
  --
  -- end

  return v
end

return Variant
