--- Operation Bornholm
----
--- Copyright (C) 2020, Vilhelm Prytz <vilhelm@prytznet.se>, Pontus Liedgren <pop2strong4u@gmail.com>, et. al.
--- This game is licensed under the terms of the GNU GPL v3.0 license, see LICENSE
---
--- https://github.com/operation-bornholm/bornholm


local block_size = 64

map = {}

function map:load()
    -- initiate background
    backgroundImage = love.graphics.newImage("src/background/bg1.png")

    for row, value in pairs(game.map.raw) do
        for cell, value in pairs(value) do
            -- special case for id 0
            if value ~= 0 then
                object = {}
                object.x = block_size*(cell-1)
                object.y = block_size*(row-1)

                -- object.shape = love.physics.newRectangleShape( block_size, block_size )
                -- object.body = love.physics.newBody( world, object.static_x, object.static_y, "static")
                -- object.fixture = love.physics.newFixture( object.body, object.shape, 1 )

                object.id = value

                table.insert(map, object)
            end
        end
    end
end

function map:update()
    -- for i,tile in ipairs(map) do
    --     tile.body:setPosition(tile.static_x - player.body:getX(), tile.static_y - player.body:getY())
    -- end
end


function map:draw()
    local sx = love.graphics.getWidth() / backgroundImage:getWidth()
    local sy = love.graphics.getHeight() / backgroundImage:getHeight()
    love.graphics.draw(backgroundImage, 0, 0, 0, sx, sy ) -- x:0, y:0, rot: 0, scale x and scale y

    -- love.graphics.translate(player.x, player.y)
    for i,object in ipairs(map) do
        -- love.graphics.draw(tiles[object.id], object.body:getX()-player.body:getX(), object.body:getY()-player.body:getY())
        -- love.graphics.translate(dx, dy)
        love.graphics.draw(tiles[object.id], object.x+player.x, object.y+player.y)
    end
    -- love.graphics.translate(0, 0)
end
