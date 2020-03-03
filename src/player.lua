--- Operation Bornholm
----
--- Copyright (C) 2020, Vilhelm Prytz <vilhelm@prytznet.se>, Pontus Liedgren <pop2strong4u@gmail.com>, et. al.
--- This game is licensed under the terms of the GNU GPL v3.0 license, see LICENSE
---
--- https://github.com/operation-bornholm/bornholm

player = {}

function player:load()
    player.x = 0
    player.y = 0
    player.height = 32
    player.width = 16
end

function player:draw()
    love.graphics.setColor(255, 0, 0)

    -- love.graphics.rectangle("fill", x, y, width, height)
    love.graphics.rectangle("fill", ((love.graphics.getWidth()/2) - (player.width/2)), ((love.graphics.getHeight()/2) - (player.height/2)), player.width, player.height)

    love.graphics.setColor(255, 255, 255)
end
