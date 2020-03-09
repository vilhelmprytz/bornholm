--- Operation Bornholm
----
--- Copyright (C) 2020, Vilhelm Prytz <vilhelm@prytznet.se>, Pontus Liedgren <pop2strong4u@gmail.com>, et. al.
--- This game is licensed under the terms of the GNU GPL v3.0 license, see LICENSE
---
--- https://github.com/operation-bornholm/bornholm

player = {}
player.width = 32
player.height = 48
player.force_speed = 2

function player:load()
    player.shape = love.physics.newRectangleShape(player.width, player.height)
    player.body = love.physics.newBody( world, 500, 100, "dynamic")
    player.fixture = love.physics.newFixture( player.body, player.shape, 1 )
end

function player:draw()
    love.graphics.setColor(255, 0, 0)

    -- love.graphics.rectangle("fill", x, y, width, height)
    love.graphics.rectangle("fill", ((love.graphics.getWidth()/2) - (player.width/2)), ((love.graphics.getHeight()/2) - (player.height/2)), player.width, player.height)

    love.graphics.setColor(255, 255, 255)
end
