--- Operation Bornholm
----
--- Copyright (C) 2020, Vilhelm Prytz <vilhelm@prytznet.se>, Pontus Liedgren <pop2strong4u@gmail.com>, et. al.
--- This game is licensed under the terms of the GNU GPL v3.0 license, see LICENSE
---
--- https://github.com/operation-bornholm/bornholm
bullets = {}

function bullets:load()
    bullet_objects = {}

end

function bullets:update(dt)
    if love.mouse.isDown(1) then
        local x, y = love.mouse.getPosition()

        print(x .. " " .. y)
    end

end

function bullets:draw()
    
    --[[ love.graphics.setColor(255,255,0)
        -- love.graphics.rectangle("line", player.x, player.y, player.width, player.height)
    local x, y = bullets.position
    love.graphics.draw("fill", x, y) ]]

end
