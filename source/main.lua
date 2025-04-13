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
bombSprite.collisionResponse = gfx.sprite.kCollisionTypeOverlap
bombSprite:setCollideRect(8, 5, 15, 6)
bombSprite:moveTo(450, 240)
bombSprite:add()

-- Game State
local gameState = "stopped"
local score = 0
--function pd.display.setRefreshRate(0)
--end

function pd.update()
    gfx.sprite.update()
    pd.drawFPS(0, 228)

    if gameState == "stopped" then
        gfx.drawTextAligned("Press A to Start", 200, 40, kTextAlignment.center)
        if pd.buttonJustPressed(pd.kButtonA) then
            gameState = "active"
            score = 0
            playerSprite:moveTo(playerStartX, playerStartY)
            bombSprite:moveTo(450, math.random(40, 200))
        end
    elseif gameState == "active" then
-- Insert player controls here
        end

        local actualX, actualY, collisions, length = bombSprite:moveWithCollisions(bombSprite.x -bombSpeed, bombSprite.y)
        if bombSprite.x < -20 then
            bombSprite:moveTo(450, math.random(40, 200))
            score += 1
        end

        if length > 0 or playerSprite.y > 270 or playerSprite.y < -30 then
            gameState = "stopped"
        end
    end

    gfx.drawTextAligned("Score: " .. score, 390, 10, kTextAlignment.right)
