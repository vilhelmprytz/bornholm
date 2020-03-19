--- Operation Bornholm
----
--- Copyright (C) 2020, Vilhelm Prytz <vilhelm@prytznet.se>, Pontus Liedgren <pop2strong4u@gmail.com>, et. al.
--- This game is licensed under the terms of the GNU GPL v3.0 license, see LICENSE
---
--- https://github.com/operation-bornholm/bornholm


map = {}
map.block_size = 64

function map:load()
    -- initiate background
    backgroundImage = love.graphics.newImage("src/background/bg1.png")

    for row, value in pairs(game.map.raw) do
        for cell, value in pairs(value) do
            -- special case for id 0
            if value ~= 0 then
                object = {}
                object.x = map.block_size*(cell-1)
                object.y = map.block_size*(row-1)

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
    local screen_width = love.graphics.getWidth()
    local screen_height = love.graphics.getHeight()
    local sx = screen_width / backgroundImage:getWidth()
    local sy = screen_height / backgroundImage:getHeight()
    love.graphics.draw(backgroundImage, 0, 0, 0, sx, sy ) -- x:0, y:0, rot: 0, scale x and scale y

    -- love.graphics.translate(player.x, player.y)
    for i,tile in ipairs(map) do
        local x = tile.x - (player.x - screen_width/2 + player.width/2)
        local y = tile.y - (player.y - screen_height/2 + player.height/2)
        love.graphics.draw(tiles[tile.id], x, y)
    end
    
    -- for i, tiles in ipairs(map) do
    --     love.graphics.rectangle("line", tiles.x, tiles.y, map.block_size, map.block_size)
    -- end
end
