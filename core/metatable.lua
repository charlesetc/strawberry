return function (o)
  local mt = getmetatable(o) or {}
  setmetatable(o, mt)
  return mt
end
