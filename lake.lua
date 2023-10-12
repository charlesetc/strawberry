require 'init'
local expect = require 'expect'
local main = require 'main'

local task = {}

task.test = expect.run_tests
task.accept = expect.accept
task.run = main.run

function task.main()
  print("main")
end

task[arg[1] or 'main'](select(2, ...))
