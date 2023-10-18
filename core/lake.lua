local ARG = arg

local function builtins(tasks)
  local b = {}

  function b.targets()
    for target, _ in pairs(tasks) do
      if target ~= "targets" and target ~= "help" then
        print(target)
      end
    end
  end

  function b.help()
    print("Lake is a simple task-runner for lua functions.")
    print()
    for target, _ in pairs(tasks) do
      if target ~= "targets" and target ~= "help" then
        print("  " .. target)
      end
    end
  end

  return b
end

return function (tasks, default)
  local action = table.remove(ARG, 1) or default

  local cmd = (tasks[action] or builtins(tasks)[action])

  if cmd == nil then
    print("invalid command: " .. action)
    return
  end

  cmd(table.unpack(ARG))
end
