--- Operation Bornholm
----
--- Copyright (C) 2020, Vilhelm Prytz <vilhelm@prytznet.se>, Pontus Liedgren <pop2strong4u@gmail.com>, et. al.
--- This game is licensed under the terms of the GNU GPL v3.0 license, see LICENSE
---
--- https://github.com/operation-bornholm/bornholm


local block_size = 64

map = {}

function map:load()
    for row, value in pairs(game.map.raw) do
        for cell, value in pairs(value) do
            -- special case for id 0
            if value ~= 0 then
                object = {}

                object.shape = love.physics.newRectangleShape( block_size, block_size )
                object.body = love.physics.newBody( world, block_size*(cell-1), block_size*(row-1), "static")
                object.fixture = love.physics.newFixture( object.body, object.shape, 1 )

                object.static_x = block_size*(cell-1)
                object.static_y = block_size*(row-1)
                object.id = value

                table.insert(map, object)
            end
        end
    end
end

function map:update()
    for i,tile in ipairs(map) do
        tile.body:setPosition(tile.static_x - player.body:getX(), tile.static_y - player.body:getY())
    end
end


function map:draw()
    for i,object in ipairs(map) do
         -- love.graphics.draw(tiles[object.id], object.body:getX()-player.body:getX(), object.body:getY()-player.body:getY())
         -- Love.graphics.translate(dx, dy)
        love.graphics.draw(tiles[object.id], object.body:getX(), object.body:getY())
    end
end
