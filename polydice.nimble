# Package

version       = "0.2.0"
author        = "Christopher J Stehno"
description   = "A polyhedral dice roller and reusable module."
license       = "Apache-2.0"
srcDir        = "src"
installExt    = @["nim"]
bin           = @["polydice"]



# Dependencies

requires "nim >= 1.2.6"
requires "docopt >= 0.6.7"
