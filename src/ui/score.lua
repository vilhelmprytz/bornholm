--- Operation Bornholm
---
--- Copyright (C) 2020, Vilhelm Prytz <vilhelm@prytznet.se>, Pontus Liedgren <pop2strong4u@gmail.com>, et. al.
--- This game is licensed under the terms of the GNU GPL v3.0 license, see LICENSE
---
--- https://github.com/VilhelmPrytz/bornholm

require "src/version"

score = {}
highscore_filename = ".bornholm_highscore.txt"

-- check if highscore file exists
function file_exists(name)
  local f=io.open(name,"r")
  if f~=nil then io.close(f) return true else return false end
end

function score:load()
    score.score = 0
    score.new_highscore = false
    score.current_highscore = score:read_high_score()

    default = love.graphics.newFont(12)
    popupfont = love.graphics.newFont(30)
end

-- draw score, highscore and if player is dead
function score:draw()
    local screen_width = love.graphics.getWidth()
    local screen_height = love.graphics.getHeight()

    love.graphics.setColor(200, 100, 0)
    love.graphics.print("Score: " .. score.score, 10, 220)
    love.graphics.print("Your highscore: " .. tostring(currentHighscore), 10, 240 )

    if player.dead then
        love.graphics.setFont(popupfont)
        love.graphics.printf("YOU DIED", (screen_width/2)-300, screen_height/3, 500, 'center')
        love.graphics.printf("Score: " ..score.score, (screen_width/2)-300, (screen_height/3)+50, 500,  'center')
        love.graphics.printf("Highscore: " ..tostring(currentHighscore), (screen_width/2)-300, (screen_height/3)+100, 500,  'center')
    end
  
    love.graphics.setFont(default)
    love.graphics.setColor(255,255,255)
end

 -- read highscore
 function score:read_high_score()
  if file_exists(highscore_filename) then
    file = io.open (highscore_filename, "r")

    io.input(file)
    currentHighscore = io.read()
    io.close(file)
  else
    file = io.open(highscore_filename, "w")

    io.output(file)
    io.write("0")
    io.close()

    currentHighscore = 0
  end
  return currentHighscore
end

-- write new highscore
function score:write_high_score(number)
 file = io.open(highscore_filename, "w")

 io.output(file)
 io.write(number)
 io.close()
end

-- save highscore
function score:save_high_score(new_score, savedHighscore)
  if tonumber(new_score) > tonumber(savedHighscore) then
    score:write_high_score(new_score)
  end
end
