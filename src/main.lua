--- Operation Bornholm
----
--- Copyright (C) 2020, Vilhelm Prytz <vilhelm@prytznet.se>, Pontus Liedgren <pop2strong4u@gmail.com>, et. al.
--- This game is licensed under the terms of the GNU GPL v3.0 license, see LICENSE
---
--- https://github.com/operation-bornholm/bornholm

require "src/graphics/draw_fps"
require "src/graphics/draw_version"
require "src/graphics/draw_map"
require "src/graphics/draw_coordinates"

require "src/load_tiles"

require "src/version"

--- load map
require "src/maps/bornholm"

-- objects
require "src/player"

game = {}
game.state = "ingame"

game.map = {}
game.map.name = "Bornholm"
game.map.raw = MAP


function love.load()
    print("Running Bornholm version " .. version)

    tiles = load_tiles()

    -- initiate
    player:load()

    -- physics
    world = love.physics.newWorld(0, 9.82, true)
end

-- draw
function love.draw()
    if game.state == "menu" then
        -- draw_menu()
    end

    if game.state == "ingame" then
        draw_map()
        player:draw()
        -- draw_player()
        -- draw_bullets()
    end

    -- always display FPS and version
    draw_fps()
    draw_version()
    draw_coordinates()
end

dtotal = 0   -- this keeps track of how much time has passed
function love.update(dt)
    dtotal = dtotal + dt   -- we add the time passed since the last update, probably a very small number like 0.01
    if dtotal >= 1 then
        dtotal = dtotal - 1   -- reduce our timer by a second, but don't discard the change... what if our framerate is 2/3 of a second?
        -- yeet
    end

    if love.keyboard.isDown('d') then
        player.x = player.x + (100 * dt)
    end
    if love.keyboard.isDown('a') then
        player.x = player.x - (100 * dt)
    end

    if love.keyboard.isDown('w') then
        player.y = player.y - (100 * dt)
    end
    if love.keyboard.isDown('s') then
        player.y = player.y + (100 * dt)
    end

    print(player.x)
    print(player.y)
end

-- keypressed
function love.keypressed(key, scancode, isrepeat)
    if key == "escape" then
       love.event.quit()
    end
end
