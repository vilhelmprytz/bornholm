--- Operation Bornholm
----
--- Copyright (C) 2020, Vilhelm Prytz <vilhelm@prytznet.se>, Pontus Liedgren <pop2strong4u@gmail.com>, et. al.
--- This game is licensed under the terms of the GNU GPL v3.0 license, see LICENSE
---
--- https://github.com/operation-bornholm/bornholm

function CheckCollision(x1,y1,w1,h1, x2,y2,w2,h2)
    return x1 < x2+w2 and
           x2 < x1+w1 and
           y1 < y2+h2 and
           y2 < y1+h1
end

function AvailableDirections(x1,y1,w1,h1, x2,y2,w2,h2)
    local directions = {}

    -- left
    if (CheckCollision(x1-1,y1,w1,h1, x2,y2,w2,h2)) then
        table.insert(directions, "left")
    end

    -- right
    if (CheckCollision(x1+1,y1,w1,h1, x2,y2,w2,h2)) then
        table.insert(directions, "right")
    end

    -- up
    if (CheckCollision(x1,y1-1,w1,h1, x2,y2,w2,h2)) then
        table.insert(directions, "up")
    end

    -- down
    if(CheckCollision(x1,y1+1,w1,h1, x2,y2,w2,h2)) then
        table.insert(directions, "down")
    end

    return directions
end


-- -- left
-- if (CheckCollision(x1, y1+1, 1, h1-2, x2,y2,w2,h2)) then
--     table.insert(directions, "left")
-- end

-- -- right
-- if (CheckCollision(x1+(w1-1), y1+1, 1, h1-2, x2,y2,w2,h2)) then
--     table.insert(directions, "right")
-- end

-- -- up
-- if (CheckCollision(x1+1, y1, w1-2, 1, x2,y2,w2,h2)) then
--     table.insert(directions, "up")
-- end

-- -- down
-- if(CheckCollision(x1+1, y1+(h1-1), w1-2, 1, x2,y2,w2,h2)) then
--     table.insert(directions, "down")
-- end
