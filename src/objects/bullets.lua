--- Operation Bornholm
----
--- Copyright (C) 2020, Vilhelm Prytz <vilhelm@prytznet.se>, Pontus Liedgren <pop2strong4u@gmail.com>, et. al.
--- This game is licensed under the terms of the GNU GPL v3.0 license, see LICENSE
---
--- https://github.com/operation-bornholm/bornholm
bullets = {}

function bullets:load()
    love.mouse.setVisible(false) -- make default mouse invisible
    cursor = love.mouse.getCursor()
    bullets.position = love.mouse.getPosition()
    -- bullet_img = love.graphics.newImage("mouse.png") -- fix mouse picture
end

function bullets:update(dt)

end

function bullets:draw()
    
    love.graphics.setColor(255,255,0)
        -- love.graphics.rectangle("line", player.x, player.y, player.width, player.height)
    local x, y = bullets.position
    love.graphics.draw("fill", x, y)
end