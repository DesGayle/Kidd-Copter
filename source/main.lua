import "CoreLibs/object"
import "CoreLibs/graphics"
import "CoreLibs/sprites"

import "sprites"

local pd <const> = playdate
local gfx <const> = pd.graphics

--[[ local musicPlayer = pd.sound.fileplayer.new("assets/KiddCopter_music_mono")
local explosionSFX = pd.sound.sampleplayer.new("assets/explosion.wav") ]]

function pd.update()
    gfx.sprite.update()
    pd.drawFPS(0, 228)
end