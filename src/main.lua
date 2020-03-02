--- Operation Bornholm
--- https://github.com/operation-bornholm/bornholm
--- (C) Copyright Vilhelm Prytz & Pontus Liedgren 2020

require "src/graphics/draw_fps"
require "src/graphics/draw_version"

require "src/version"

game = {}
game.state = "menu"

function love.load()
    print("Running Bornholm version " .. version)
end

-- draw
function love.draw()
    -- always display FPS and version
    draw_fps()
    draw_version()

    if game.state == "menu" then
        -- draw_menu()
    end

    if game.state == "ingame" then
        -- draw_map()
        -- draw_player()
        -- draw_bullets()
    end

    love.graphics.print("Hello World", 400, 300)
end

dtotal = 0   -- this keeps track of how much time has passed
function love.update(dt)
    dtotal = dtotal + dt   -- we add the time passed since the last update, probably a very small number like 0.01
    if dtotal >= 1 then
        dtotal = dtotal - 1   -- reduce our timer by a second, but don't discard the change... what if our framerate is 2/3 of a second?
        -- yeet
    end
end

-- keypressed
function love.keypressed(key, scancode, isrepeat)
    if key == "escape" then
       love.event.quit()
    end
end
