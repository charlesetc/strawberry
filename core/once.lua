local function once(callback)
  local called = false
  local result = nil

  return function()
    if not called then
      called = true
      result = callback()
    end
    return result
  end
end

return once
