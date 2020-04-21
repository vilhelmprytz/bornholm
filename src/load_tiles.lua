--- Operation Bornholm
----
--- Copyright (C) 2020, Vilhelm Prytz <vilhelm@prytznet.se>, Pontus Liedgren <pop2strong4u@gmail.com>, et. al.
--- This game is licensed under the terms of the GNU GPL v3.0 license, see LICENSE
---
--- https://github.com/operation-bornholm/bornholm

number_of_tiles = 3

function load_tiles()
    tiles = {}
    for i=1, number_of_tiles, 1 do
        tiles[i] = love.graphics.newImage("src/tiles/" .. tostring(i) .. ".png")
    end

    return tiles
end
