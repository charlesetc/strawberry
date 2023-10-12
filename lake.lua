require 'init'
local expect = require 'expect'

local task = {}

task.test = expect.run_tests
task.accept = expect.accept

function task.main()
  print("main")
end

task[arg[1] or 'test'](select(2, ...))
