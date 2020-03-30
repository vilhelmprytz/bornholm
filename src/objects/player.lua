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
    player.acceleration = 50

    player.x = 200
    player.y = 200

    player.collision_direction = {}
end

function player:update(dt)
    for i,tile in ipairs(map) do
        if tile.id ~= 0 then
            if CheckCollision(player.x,player.y,player.width,player.height, tile.x,tile.y,map.block_size,map.block_size) then
                _direction = AvailableDirections(player.x,player.y,player.width,player.height, tile.x,tile.y,map.block_size,map.block_size)
                if (_direction) then
                    table.insert(player.collision_direction, _direction)
                    -- player.collision_direction = _direction
                end
            end
        end
    end

    -- if not player.has_collided then
    player.x = player.x+player.horizontal_velocity*dt
    player.y = player.y+player.vertical_velocity*dt
    -- end

    local function has_value (tab, val)
        for index, value in ipairs(tab) do
            if value == val then
                return true
            end
        end
    
        return false
    end

    -- player steering
    if love.keyboard.isDown('a') then
        if not (has_value(player.collision_direction, "left")) then
            player.horizontal_velocity = -player.running_speed
        else
            player.horizontal_velocity = 0
        end
    elseif love.keyboard.isDown('d') then
        if not (has_value(player.collision_direction, "right")) then
            player.horizontal_velocity = player.running_speed
        else
            player.horizontal_velocity = 0
        end
    else
        player.horizontal_velocity = 0
    end

    -- if love.keyboard.isDown('w') then
    --     if not (has_value(player.collision_direction, "up")) then
    --         player.vertical_velocity = -player.running_speed
    --     else
    --         player.vertical_velocity = 0
    --     end
    -- elseif love.keyboard.isDown('s') then
    --     if not (has_value(player.collision_direction, "down")) then
    --         player.vertical_velocity = player.running_speed
    --     else
    --         player.vertical_velocity = 0
    --     end
    -- else
    --     player.vertical_velocity = 0
    -- end 

    -- gravitation
    if not (has_value(player.collision_direction, "down")) then
        player.vertical_velocity = player.vertical_velocity+player.acceleration*dt
    else
        player.vertical_velocity = 0
    end

    -- jump
    if love.keyboard.isDown('space') then 
        if not(has_value(player.collision_direction, "up")) then
            player.vertical_velocity = 0
            player.vertical_velocity = player.vertical_velocity-player.acceleration*dt 
            if (player.y - object.y == 300) then
                player.vertical_velocity = player.vertical_velocity+player.acceleration*dt
            end
        end
    end

    for k in pairs (player.collision_direction) do
        player.collision_direction [k] = nil
    end
end

function player:draw()
    love.graphics.setColor(255, 0, 0)
    love.graphics.rectangle("fill", ((love.graphics.getWidth()/2) - (player.width/2)), ((love.graphics.getHeight()/2) - (player.height/2)), player.width, player.height)
    -- love.graphics.rectangle("line", player.x, player.y, player.width, player.height)
    love.graphics.setColor(255, 255, 255)

    -- local w1 = player.width
    -- local h1 = player.height
    -- local temp_x = ((love.graphics.getWidth()/2) - (player.width/2))
    -- local temp_y = ((love.graphics.getHeight()/2) - (player.height/2))

    -- love.graphics.rectangle("line", temp_x+(w1-1), temp_y+1, 1, h1-2)
    -- love.graphics.rectangle("line", temp_x+1, temp_y, w1-2, 1)
end
