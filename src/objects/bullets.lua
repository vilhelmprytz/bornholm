--- Operation Bornholm
---
--- Copyright (C) 2020, Vilhelm Prytz <vilhelm@prytznet.se>, Pontus Liedgren <pop2strong4u@gmail.com>, et. al.
--- This game is licensed under the terms of the GNU GPL v3.0 license, see LICENSE
---
--- https://github.com/VilhelmPrytz/bornholm

require "src/lib/physics"

bullets = {}

function bullets:load()
    bullets.default_velocity = 500
    bullets.default_cooldown = 0.5
    bullets.width = 8
    bullets.height = 8

    bullets.cooldown = 0

    bullet_objects = {}
end

local function signum(number)
    if number > 0 then
       return 1
    elseif number < 0 then
       return -1
    else
       return 0
    end
end

function bullets:update(dt)
    for i,bullet in ipairs(bullet_objects) do
        -- check for collision with each tile in map
        for n,tile in ipairs(map) do
            -- fixme: should merge into one constant!
            if tile.id ~= 0 and tile.id ~= 3 then
                if CheckCollision(bullet.x,bullet.y,bullets.width,bullets.height, tile.x,tile.y,map.block_size,map.block_size) then
                    table.remove(bullet_objects, i)
                end
            end
        end

        -- fixme: this is hard coded to check if bullets travel outside (bad)
        if bullet.y < -800 or bullet.y > 2000 or bullet.x < -800 or bullet.x > 8000 then
            table.remove(bullet_objects, i)
        end

        -- update x and y using the velocity
        bullet.x = bullet.x+bullet.horizontal_velocity*dt
        bullet.y = bullet.y+bullet.vertical_velocity*dt
    end

    if bullets.cooldown <= 0 then
        if love.mouse.isDown(1) then
            local x, y = love.mouse.getPosition()

            local sx = ((love.graphics.getWidth()/2) - (player.width/2))
            local sy = ((love.graphics.getHeight()/2) - (player.height/2))

            local k = math.abs((y - sy)/(x - sx))

            bullet = {}

            local size = 1/(math.pow(1 + math.pow(k, 2), 0.5)) * bullets.default_velocity
            bullet.horizontal_velocity = size * signum(x - sx)
            bullet.vertical_velocity = k * size * signum(y - sy)

            bullet.x = player.x
            bullet.y = player.y

            table.insert(bullet_objects, bullet)

            bullets.cooldown = bullets.default_cooldown
        end
    else
        bullets.cooldown = bullets.cooldown-dt
    end
end

function bullets:draw()
    local screen_width = love.graphics.getWidth()
    local screen_height = love.graphics.getHeight()

    for i,bullet in ipairs(bullet_objects) do
        local x = bullet.x - (player.x - screen_width/2 + player.width/2)
        local y = bullet.y - (player.y - screen_height/2 + player.height/2)

        love.graphics.rectangle("fill", x, y, bullets.width, bullets.height)
    end
end
