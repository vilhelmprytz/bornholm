--- Operation Bornholm
----
--- Copyright (C) 2020, Vilhelm Prytz <vilhelm@prytznet.se>, Pontus Liedgren <pop2strong4u@gmail.com>, et. al.
--- This game is licensed under the terms of the GNU GPL v3.0 license, see LICENSE
---
--- https://github.com/operation-bornholm/bornholm

require "src/lib/physics"

player = {}

function player:load()
    player.width = 32
    player.height = 48

    player.running_speed = 250
    player.horizontal_velocity = 0  
    player.vertical_velocity = 0
    player.acceleration = 5

    player.x = 200
    player.y = 200

    player.collision_direction = nil
end

function player:update(dt)
    local has_collided = false

    for i,tile in ipairs(map) do
        if tile.id ~= 0 then
            if CheckCollision(player.x,player.y,player.width,player.height, tile.x,tile.y,map.block_size,map.block_size) then
                _direction = AvailableDirections(player.x,player.y,player.width,player.height, tile.x,tile.y,map.block_size,map.block_size)
                if (_direction) then
                    has_collided = true
                    player.collision_direction = _direction
                end
            end
        end
    end

    if (has_collided == false) then
        player.collision_direction = nil
    end

    -- if not player.has_collided then
    player.x = player.x+player.horizontal_velocity*dt
    player.y = player.y+player.vertical_velocity*dt
    -- end

    -- player steering
    if love.keyboard.isDown('a') then
        if (player.collision_direction ~= "left") then
            player.horizontal_velocity = -player.running_speed
        else
            player.horizontal_velocity = 0
        end
    elseif love.keyboard.isDown('d') then
        if (player.collision_direction ~= "right") then
            player.horizontal_velocity = player.running_speed
        else
            player.horizontal_velocity = 0
        end 
    else
        player.horizontal_velocity = 0
    end

    if love.keyboard.isDown('w') then
        if (player.collision_direction ~= "up") then
            player.vertical_velocity = -player.running_speed
        else
            player.horizontal_velocity = 0
        end
    elseif love.keyboard.isDown('s') then
        if (player.collision_direction ~= "down") then
            player.vertical_velocity = player.running_speed
        else
            player.vertical_velocity = 0
        end
    else
        player.vertical_velocity = 0
    end    
end

function player:draw()
    love.graphics.setColor(255, 0, 0)
    love.graphics.rectangle("fill", ((love.graphics.getWidth()/2) - (player.width/2)), ((love.graphics.getHeight()/2) - (player.height/2)), player.width, player.height)
    -- love.graphics.rectangle("line", player.x, player.y, player.width, player.height)
    love.graphics.setColor(255, 255, 255)
end
