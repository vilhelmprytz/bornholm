--- Operation Bornholm
----
--- Copyright (C) 2020, Vilhelm Prytz <vilhelm@prytznet.se>, Pontus Liedgren <pop2strong4u@gmail.com>, et. al.
--- This game is licensed under the terms of the GNU GPL v3.0 license, see LICENSE
---
--- https://github.com/operation-bornholm/bornholm

local block_size = 64

function draw_map()
    for row, value in pairs(game.map.raw) do
        for cell, value in pairs(value) do
            -- special case for id 0
            if value ~= 0 then
                love.graphics.draw(tiles[value], block_size*(cell-1)-player.x, block_size*(row-1)-player.y)
            end
        end
    end
end
