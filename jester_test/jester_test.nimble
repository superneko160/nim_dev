# Package

version       = "0.1.0"
author        = "sneko"
description   = "test jester"
license       = "MIT"
srcDir        = "src"
installExt    = @["nim"]
bin           = @["jester_test"]


# Dependencies

requires "nim >= 1.6.6"
requires "jester >= 0.5.0"