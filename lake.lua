require 'init'
local lake = require 'core.lake'
local expect = require 'expect'

local task = {}

task.test = expect.run_tests
task.accept = expect.accept

function task.main(a, b, c)
  print("main", a, b, c)
end

lake(task, 'test')
