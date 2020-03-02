--- Operation Bornholm
--- https://github.com/operation-bornholm/bornholm
--- (C) Copyright Vilhelm Prytz & Pontus Liedgren 2020

require "src/version"

function draw_version()
    love.graphics.print("Bornholm " .. version, 10, 25)
end
