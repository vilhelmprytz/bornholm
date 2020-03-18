--- Operation Bornholm
----
--- Copyright (C) 2020, Vilhelm Prytz <vilhelm@prytznet.se>, Pontus Liedgren <pop2strong4u@gmail.com>, et. al.
--- This game is licensed under the terms of the GNU GPL v3.0 license, see LICENSE
---
--- https://github.com/operation-bornholm/bornholm

player = {}

function player:load()
    player.width = 32
    player.height = 48

    player.running_speed = 100
    player.horizontal_velocity = 0   
    player.vertical_velocity = 0
    player.acceleration = 5

    player.x = 0
    player.y = 0
end

function player:update(dt)
    player.x = player.x+player.horizontal_velocity*dt
    player.y = player.y+player.vertical_velocity*dt

    -- player steer right
    if love.keyboard.isDown('d') then
        if (player.horizontal_velocity < player.running_speed) then
            player.horizontal_velocity = player.horizontal_velocity-player.acceleration 
        end
    end
    -- player steer left
    if love.keyboard.isDown('a') then
        if (player.horizontal_velocity < player.running_speed) then
            player.horizontal_velocity = player.horizontal_velocity+player.acceleration
        end
    end
end

function player:draw()
    love.graphics.setColor(255, 0, 0)

    love.graphics.rectangle("fill", ((love.graphics.getWidth()/2) - (player.width/2)), ((love.graphics.getHeight()/2) - (player.height/2)), player.width, player.height)

    love.graphics.setColor(255, 255, 255)
end
