--- Operation Bornholm
----
--- Copyright (C) 2020, Vilhelm Prytz <vilhelm@prytznet.se>, Pontus Liedgren <pop2strong4u@gmail.com>, et. al.
--- This game is licensed under the terms of the GNU GPL v3.0 license, see LICENSE
---
--- https://github.com/operation-bornholm/bornholm


function draw_coordinates()
    love.graphics.print("player.x " .. player.x, 10, 40)
    love.graphics.print("player.y " .. player.y, 10, 55)
end
