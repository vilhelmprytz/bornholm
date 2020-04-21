--- Operation Bornholm
---
--- Copyright (C) 2020, Vilhelm Prytz <vilhelm@prytznet.se>, Pontus Liedgren <pop2strong4u@gmail.com>, et. al.
--- This game is licensed under the terms of the GNU GPL v3.0 license, see LICENSE
---
--- https://github.com/VilhelmPrytz/bornholm

-- see all settings here https://love2d.org/wiki/Config_Files

require "src/version"

function love.conf(t)
    t.version = "11.3"
    t.window.title = "Operation Bornholm " .. version
    t.window.fullscreen = true
    t.window.vsync = false
end
