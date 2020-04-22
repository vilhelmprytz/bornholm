--- Operation Bornholm
---
--- Copyright (C) 2020, Vilhelm Prytz <vilhelm@prytznet.se>, Pontus Liedgren <pop2strong4u@gmail.com>, et. al.
--- This game is licensed under the terms of the GNU GPL v3.0 license, see LICENSE
---
--- https://github.com/VilhelmPrytz/bornholm

-- basic
require "src/load_tiles"
require "src/version"

--- load map
require "src/maps/bornholm"

-- objects
require "src/objects/player"
require "src/objects/bullets"
require "src/objects/enemies"

-- map
require "src/map"

-- ui
require "src/ui/hud"
require "src/ui/score"

game = {}
game.state = "ingame"

game.map = {}
game.map.name = "Bornholm"
game.map.raw = MAP


function love.load()
    print("Running Bornholm version " .. version)

    -- seed math random
    math.randomseed(os.time())

    -- load the PNG files
    tiles = load_tiles()

    -- initiate player
    player:load()

    -- initiate map
    map:load()

    -- initiate bullets
    bullets:load()

    -- initiate enemies
    enemies:load()

    -- initiate score
    score:load()

    -- set special cursor
    cursor = love.mouse.newCursor("src/cursor/crosshair.png", 12, 12)
    love.mouse.setCursor(cursor)
end

-- draw
function love.draw()
    if game.state == "menu" then
        -- fixme: no menu yet!
    end

    if game.state == "ingame" or game.state == "dead" then
        map:draw()
        player:draw()
        bullets:draw()
        enemies:draw()
    end

    -- always display HUD
    hud:draw()
    score:draw()
end

function love.update(dt)
    if game.state == "ingame" then
        map:update()
        player:update(dt)
        bullets:update(dt)
        enemies:update(dt)
    end
    if game.state == "dead" then
        if score.new_highscore == false then
            -- save and submit new highscore
            score:save_high_score(score.score, score.current_highscore)
            -- read new highscore
            score.current_highscore = score:read_high_score()
        end
        -- restart
        if love.keyboard.isDown('return') then
            -- reset
            player.dead = false
            game.state = "ingame"
            score.score = 0
            player.x = 500
            player.y = 500
            player.horizontal_velocity = 0
            player.vertical_velocity = 0 
            bullet_objects = {}
            enemy_objects = {}
        end
    end
end

-- keypressed
function love.keypressed(key, scancode, isrepeat)
    -- only Escape is catched here right now
    if key == "escape" then
        -- shortcut to quit is escape right now
        love.event.quit()
    end
end
