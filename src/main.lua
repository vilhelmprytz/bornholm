--- Operation Bornholm
----
--- Copyright (C) 2020, Vilhelm Prytz <vilhelm@prytznet.se>, Pontus Liedgren <pop2strong4u@gmail.com>, et. al.
--- This game is licensed under the terms of the GNU GPL v3.0 license, see LICENSE
---
--- https://github.com/operation-bornholm/bornholm

-- basic
require "src/load_tiles"
require "src/version"

--- load map
require "src/maps/bornholm"

-- objects
require "src/objects/player"
-- require "src/objects/bullets"
-- map
require "src/map"

-- ui
require "src/ui/hud"

game = {}
game.state = "ingame"

game.map = {}
game.map.name = "Bornholm"
game.map.raw = MAP


function love.load()
    print("Running Bornholm version " .. version)

    -- load the PNG files
    tiles = load_tiles()

    -- initiate player
    player:load()

    -- initiate bullets
    -- initiate map
    map:load()
    -- cursor
    --bullets:load()
    cursor = love.mouse.newCursor("src/cursor/crosshairbornholm.png", 0, 0)
    love.mouse.setCursor(cursor)
end

-- draw
function love.draw()
    if game.state == "menu" then
        -- menu:draw()
    end

    if game.state == "ingame" then
        map:draw()
        player:draw()
        --bullets:draw()
    end

    -- always display FPS and version
    hud:draw()
end

-- dtotal = 0   -- this keeps track of how much time has passed
function love.update(dt)
    map:update()
    player:update(dt)
    -- dtotal = dtotal + dt   -- we add the time passed since the last update, probably a very small number like 0.01
    -- if dtotal >= 1 then
    --     dtotal = dtotal - 1   -- reduce our timer by a second, but don't discard the change... what if our framerate is 2/3 of a second?
    --     -- yeet
    -- end


end

-- keypressed
function love.keypressed(key, scancode, isrepeat)
    if key == "escape" then
       love.event.quit()
    end
end
