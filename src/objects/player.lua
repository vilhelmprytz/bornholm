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
    player.acceleration = 200
    player.jump_velocity = -350

    player.x = 500
    player.y = 500

    player.collision_direction = {}
end

function player:physics_check()
    for i,tile in ipairs(map) do
        if tile.id ~= 0 then
            if CheckCollision(player.x,player.y,player.width,player.height, tile.x,tile.y,map.block_size,map.block_size) then
                return AvailableDirections(player.x,player.y,player.width,player.height, tile.x,tile.y,map.block_size,map.block_size)
            end
        end
    end

    return nil
end

function has_value (tab, val)
    for index, value in ipairs(tab) do
        if value == val then
            return true
        end
    end

    return false
end

function player:update(dt)
    local direction = player.physics_check()
    if direction ~= nil then
        player.collision_direction = direction
    end

    -- what we want to move the player to
    new_x = player.x+player.horizontal_velocity*dt
    new_y = player.y+player.vertical_velocity*dt

    -- check that no blocks exist between the player and the new coords
    if player.vertical_velocity < 0 then
        while player.y > new_y do
            local direction = player.physics_check()
            if direction == nil then
                player.y = player.y - 1
            elseif has_value(direction, "up") then
                new_y = player.y
            else
                player.y = player.y - 1
            end
        end
    elseif player.vertical_velocity > 0 then
        while player.y < new_y do
            local direction = player.physics_check()
            if direction == nil then
                player.y = player.y + 1
            elseif has_value(direction, "down") then
                new_y = player.y
            else
                player.y = player.y + 1
            end
        end 
    end
    if player.horizontal_velocity < 0 then
        while player.x > new_x do
            local direction = player.physics_check()
            if direction == nil then
                player.x = player.x - 1
            elseif has_value(direction, "left") then
                new_x = player.x
            else
                player.x = player.x - 1
            end
        end
    elseif player.horizontal_velocity > 0 then
        while player.x < new_x do
            local direction = player.physics_check()
            if direction == nil then
                player.x = player.x + 1
            elseif has_value(direction, "right") then
                new_x = player.x
            else
                player.x = player.x + 1
            end
        end 
    end

    -- if not player.has_collided then
    player.x = new_x
    player.y = new_y
    -- end

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

    if not (has_value(player.collision_direction, "down")) then
        player.vertical_velocity = player.vertical_velocity+player.acceleration*dt
    end

    -- gravitation & jump
    if love.keyboard.isDown('space') then
        if not(has_value(player.collision_direction, "up")) and has_value(player.collision_direction, "down") then
            player.vertical_velocity = player.jump_velocity
        end
    end

    -- stop player movement if colliding up or down
    if has_value(player.collision_direction, "up") and player.vertical_velocity < 0 then
        player.vertical_velocity = 0
    end

    if has_value(player.collision_direction, "down") and player.vertical_velocity > 0 then
        player.vertical_velocity = 0
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
