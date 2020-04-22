--- Operation Bornholm
---
--- Copyright (C) 2020, Vilhelm Prytz <vilhelm@prytznet.se>, Pontus Liedgren <pop2strong4u@gmail.com>, et. al.
--- This game is licensed under the terms of the GNU GPL v3.0 license, see LICENSE
---
--- https://github.com/VilhelmPrytz/bornholm

require "src/lib/physics"

enemies = {}

function enemies:load()
    enemies.width = 32
    enemies.height = 32
    enemies.movement_speed = 150

    enemies.amount = 1

    enemy_objects = {}
end

function enemies:spawn()
    new_enemy = {}

    -- velocity for enemies always start on 0
    new_enemy.horizontal_velocity = 0
    new_enemy.vertical_velocity = 0

    -- 1 is up, 2 is down, 3 is left and 4 is right
    local orientation = math.random(4)

    local safety_height = love.graphics.getHeight()/2 + 20
    local safety_width = love.graphics.getWidth()/2 + 20

    -- fixme: this is hardcoded, boundaries of where enemies are allowed to spawn
    local max_x = 5500
    local max_y = 1500
    local min_x = -800
    local min_y = -800

    -- up
    if orientation == 1 then
        new_enemy.x = math.random(min_x, max_x)
        new_enemy.y = math.random(min_y, player.y-safety_height)
    end

    -- down
    if orientation == 2 then
        new_enemy.x = math.random(min_x, max_x)
        new_enemy.y = math.random(player.y+safety_height, max_y)
    end

    -- left
    if orientation == 3 then
        new_enemy.x = math.random(min_x, player.x-safety_width)
        new_enemy.y = math.random(min_y, max_y)
    end

    -- right
    if orientation == 4 then
        new_enemy.x = math.random(player.x+safety_width, max_x)
        new_enemy.y = math.random(min_y, max_y)
    end

    table.insert( enemy_objects, new_enemy )
end

local function tablelength(T)
    local count = 0
    for _ in pairs(T) do count = count + 1 end
    return count
end

function enemies:update(dt)
    enemies.amount = math.floor(score.score/10) + 3

    -- if the amount of enemies present are less than the amount supposed to be present, spawn new
    while tablelength(enemy_objects) < enemies.amount do
        enemies:spawn()
    end

    for i,enemy in ipairs(enemy_objects) do
        -- decide direction of velocity
        if enemy.x - player.x > 0 then
            enemy.horizontal_velocity = -enemies.movement_speed
        end
        if enemy.x - player.x < 0 then
            enemy.horizontal_velocity = enemies.movement_speed
        end

        if enemy.y - player.y > 0 then
            enemy.vertical_velocity = -enemies.movement_speed
        end
        if enemy.y - player.y < 0 then
            enemy.vertical_velocity = enemies.movement_speed
        end

        -- if player has collided with enemy then the player has died
        if CheckCollision(enemy.x,enemy.y,enemies.width,enemies.height, player.x,player.y,player.width,player.height) then
            player.dead = true
            game.state = "dead"
        end

        -- fixme: this is hard coded to check if bullets travel outside (bad)
        if enemy.y < -800 or enemy.y > 2000 or enemy.x < -800 or enemy.x > 8000 then
            table.remove(enemy_objects, i)
        end

        -- check if bullets
        for n,bullet in ipairs(bullet_objects) do
            if CheckCollision(bullet.x,bullet.y,bullets.width,bullets.height, enemy.x,enemy.y,enemies.width,enemies.height) then
                table.remove(bullet_objects, n)
                table.remove(enemy_objects, i)
                score.score = score.score + 1
            end
        end


        -- update x and y using the velocity
        enemy.x = enemy.x+enemy.horizontal_velocity*dt
        enemy.y = enemy.y+enemy.vertical_velocity*dt
    end 
end

function enemies:draw()
    local screen_width = love.graphics.getWidth()
    local screen_height = love.graphics.getHeight()

    for i,enemy in ipairs(enemy_objects) do
        local x = enemy.x - (player.x - screen_width/2 + player.width/2)
        local y = enemy.y - (player.y - screen_height/2 + player.height/2)

        love.graphics.rectangle("fill", x, y, enemies.width, enemies.height)
    end
end
