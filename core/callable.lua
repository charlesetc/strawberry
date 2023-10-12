
local function callable(object, f)
  local mt = getmetatable(object) or {}
  function mt:__call(...)
    return f(...)
  end
  setmetatable(object, mt)
end

return callable
