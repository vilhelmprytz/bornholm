--- Operation Bornholm
---
--- Copyright (C) 2020, Vilhelm Prytz <vilhelm@prytznet.se>, Pontus Liedgren <pop2strong4u@gmail.com>, et. al.
--- This game is licensed under the terms of the GNU GPL v3.0 license, see LICENSE
---
--- https://github.com/VilhelmPrytz/bornholm

require "src/version"

score = {}
highscoreSave = "bornholm_highscore.txt"

function score:load()
    score.score = 0
    currentHighscore = readHighscore()

    default = love.graphics.newFont(12)
    popupfont = love.graphics.newFont(30)
end

-- check if highscore file exists
function file_exists(name)
    local f=io.open(name,"r")
    if f~=nil then io.close(f) return true else return false end
 end

 -- read highscore
function readHighscore()
    if file_exists(highscoreSave) then
      file = io.open (highscoreSave, "r")
  
      io.input(file)
      currentHighscore = io.read()
      io.close(file)
    else
      file = io.open(highscoreSave, "w")
  
      io.output(file)
      io.write("0")
      io.close()
  
      currentHighscore = 0
    end
    return currentHighscore
  end
 
  -- write new highscore
 function writeHighscore(number)
   file = io.open(highscoreSave, "w")
 
   io.output(file)
   io.write(number)
   io.close()
 end

 -- save highscore
 function saveHighscore(score, savedHighscore)
    if tonumber(score) > tonumber(savedHighscore) then
      writeHighscore(score)
    end
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
        love. graphics.printf("Highscore: " ..tostring(currentHighscore), (screen_width/2)-300, (screen_height/3)+100, 500,  'center')
    end
    love.graphics.setFont(default)
    love.graphics.setColor(255,255,255)
end

player.newHighscore = false
