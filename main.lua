--- Operation Bornholm
--- https://github.com/operation-bornholm/bornholm
--- (C) Copyright Vilhelm Prytz & Pontus Liedgren 2020

require "lib/graphics/draw_fps"
require "lib/graphics/draw_version"

require "version"

function love.load()
    print("Running Bornholm version " .. version)
end

-- draw
function love.draw()
    -- always display FPS and version
    draw_fps()
    draw_version()

    love.graphics.print("Hello World", 400, 300)
end

-- keypressed
function love.keypressed(key, scancode, isrepeat)
    if key == "escape" then
       love.event.quit()
    end
end
