import "CoreLibs/object"
import "CoreLibs/sprites"
import "CoreLibs/graphics"

import "sprites"
import "gamestates"
import "statemanager"

local pd <const> = playdate
local gfx <const> = pd.graphics

--local StateManager = import("statemanager")
--local GameStates = import("gamestates")

StateManager:addState("menu", gamestates.menu())
StateManager:addState("playing", gamestates.playing())
StateManager:addState("paused", gamestates.paused())
StateManager:addState("gameover", gamestates.gameover())
StateManager:addState("credits", gamestates.credits())

StateManager:setState("menu")

function pd.gameWillPause()
    StateManager:setState("paused")
end

function pd.gameWillResume()
    StateManager:setState("playing")
end

--[[ local musicPlayer = pd.sound.fileplayer.new("assets/KiddCopter_music_mono")
local explosionSFX = pd.sound.sampleplayer.new("assets/explosion.wav") ]]

local player = Player()

local function init()
    player:add()
end

function pd.update()
    gfx.sprite.update()
    pd.drawFPS(0, 228)
    
    StateManager:update()
    StateManager:draw()
end