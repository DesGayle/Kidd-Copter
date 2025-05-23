import "CoreLibs/object"
import "CoreLibs/sprites"
import "CoreLibs/graphics"

import "assets"
import "sprites"
import "gamestates"
import "statemanager"

local pd <const> = playdate
local gfx <const> = pd.graphics

StateManager:addState("menu", gamestates.menu())
StateManager:addState("playing", gamestates.playing())
StateManager:addState("gameover", gamestates.gameover())
StateManager:addState("credits", gamestates.credits())

StateManager:setState("menu")

--[[ local musicPlayer = pd.sound.fileplayer.new("assets/KiddCopter_music_mono")
local explosionSFX = pd.sound.sampleplayer.new("assets/explosion.wav") ]]

local player = Player()
--local particles = Particles()

local function init()
    local pauseMenuImage = gfx.image.new("images/paused")
    pd.setMenuImage(pauseMenuImage)
    Environment.init()
    --particles:add()

   
end

function pd.update()
    gfx.sprite.update()
    
    StateManager:update()
    StateManager:draw()
    
    pd.drawFPS(0, 0)
end

init()