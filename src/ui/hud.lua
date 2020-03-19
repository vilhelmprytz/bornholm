--- Operation Bornholm
----
--- Copyright (C) 2020, Vilhelm Prytz <vilhelm@prytznet.se>, Pontus Liedgren <pop2strong4u@gmail.com>, et. al.
--- This game is licensed under the terms of the GNU GPL v3.0 license, see LICENSE
---
--- https://github.com/operation-bornholm/bornholm

require "src/version"

hud = {}

function hud:draw()
    love.graphics.print("Bornholm " .. version, 10, 25)
    love.graphics.print("FPS: "..tostring(love.timer.getFPS( )), 10, 10)

    love.graphics.print("player.x " .. player.x, 10, 40)
    love.graphics.print("player.y " .. player.y, 10, 55)
    love.graphics.print("player.horizontal_velocity " .. player.horizontal_velocity, 10, 70)
    love.graphics.print("player.vertical_velocity " .. player.vertical_velocity, 10, 85)
    love.graphics.print("player.has_collided " .. tostring(player.has_collided), 10, 100)
end
