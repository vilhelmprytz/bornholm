--- Operation Bornholm
--- https://github.com/operation-bornholm/bornholm
--- (C) Copyright Vilhelm Prytz & Pontus Liedgren 2020

require "lib/fps"

-- draw
function love.draw()
    draw_fps()
    love.graphics.print("Hello World", 400, 300)
end

-- keypressed
function love.keypressed(key, scancode, isrepeat)
    if key == "escape" then
       love.event.quit()
    end
end
