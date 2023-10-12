package = "strawberry"
version = "dev-1"
source = {
   url = "*** please add URL for source tarball, zip or repository here ***"
}
description = {
   homepage = "*** please enter a project homepage ***",
   license = "*** please specify a license ***"
}
build = {
   type = "builtin",
   modules = {
      ["core.basics"] = "core/basics.lua",
      ["core.class"] = "core/class.lua",
      ["core.expect"] = "core/expect.lua",
      init = "init.lua",
      lake = "lake.lua",
      main = "main.lua",
      server = "server.lua",
      ["test.basics"] = "test/basics.lua",
      ["test.class"] = "test/class.lua",
      ["test.expect"] = "test/expect.lua"
   }
}
