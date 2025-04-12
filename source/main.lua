import "CoreLibs/graphics"
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

-- Bomb Enemy
local bombSpeed = 3
local bombImage = gfx.image.new("images/bomb")
local bombSprite = gfx.sprite.new(bombImage)
bombSprite:setCollideRect(8, 5, 15, 6) --collision box is only 2 pixels smaller than the image!!!
bombSprite:moveTo(450, 240)
bombSprite:add()

-- Game State
local gameState = "stopped"
--function pd.display.setRefreshRate(0)
--end

function pd.update()
    pd.drawFPS(0, 228)
    
    gfx.sprite.update()

    if gameState == "stopped" then
        gfx.drawTextAligned("Press A to Start", 200, 40, kTextAlignment.center)
        if pd.buttonJustPressed(pd.kButtonA) then
            gameState = "active"
            playerSprite:moveTo(playerStartX, playerStartY)
            bombSprite:moveTo(450, math.random(40, 200))
        end
    elseif gameState == "active" then
-- Insert player controls here
        end

        bombSprite:moveBy(-bombSpeed, 0)
        if bombSprite.x < -20 then
            bombSprite:moveTo(450, math.random(40, 200))
        end

        if playerSprite.y > 270 or playerSprite.y < -30 then
            gameState = "stopped"
        end
    end