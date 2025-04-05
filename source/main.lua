
import "CoreLibs/sprites"

local pd = playdate
local gfx = pd.graphics


-- Player
local playerStartX = 40
local playerStartY = 120
local playerSpeed = 3
local playerImage = gfx.image.new("images/chopper")
local playerSprite = gfx.sprite.new(playerImage)
playerSprite:setCollideRect(2, 2, 30, 30) --collision box is only 2 pixels smaller than the image!!!
playerSprite:moveTo(playerStartX, playerStartY)
playerSprite:add()

-- Game State
local gameState = "stopped"

function pd.update()
    gfx.sprite.update()

    if gameState == "stopped" then
        gfx.drawText("Press A to Start", 200, 40)
        if pd.buttonJustPressed(pd.kButtonA) then
            gameState = "active"
            playerSprite:moveTo(playerStartX, playerStartY)
        end
    elseif gameState == "active" then
-- Insert player controls here
        end
    end