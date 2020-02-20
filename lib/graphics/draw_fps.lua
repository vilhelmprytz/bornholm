--- Operation Bornholm
--- https://github.com/operation-bornholm/bornholm
--- (C) Copyright Vilhelm Prytz & Pontus Liedgren 2020

function draw_fps()
    love.graphics.print("FPS: "..tostring(love.timer.getFPS( )), 10, 10)
end
