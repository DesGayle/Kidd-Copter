import "CoreLibs/graphics"
import "CoreLibs/sprites"

local pd = playdate
local gfx = pd.graphics

local musicPlayer = pd.sound.fileplayer.new("audio/KiddCopter_music_mono")

-- Player
local playerStartX = 40
local playerStartY = 120
local playerSpeed = 3
local playerIdleImage = gfx.image.new("images/chopper_idle")
local playerHopImage = gfx.imagetable.new("images/chopper_hop")

local playerSprite = gfx.sprite.new(playerIdleImage)
playerSprite:setCollideRect(2, 2, 30, 30) --collision box is only 2 pixels smaller than the image!!!
playerSprite:moveTo(playerStartX, playerStartY)
playerSprite:add()

-- Player Movement
local velocityX = 0
local velocityY = 0
local gravity = 0.2
local hopStrength = -4
local hopSpeed = 0.3 -- horizontal hop speed

-- Bomb Enemy
local bombSpeed = 0
local bombImage = gfx.image.new("images/bomb")
local bombSprite = gfx.sprite.new(bombImage)
bombSprite.collisionResponse = gfx.sprite.kCollisionTypeOverlap
bombSprite:setCollideRect(8, 5, 15, 6)
bombSprite:moveTo(450, 240)
bombSprite:add()

-- Game State
local gameState = "stopped"
local score = 0
-- Maybe add some code here to hide the player?

function pd.update()
    gfx.sprite.update()
    pd.drawFPS(0, 228)

    if gameState == "stopped" then
        gfx.drawTextAligned("Press A to Start", 200, 40, kTextAlignment.center)
        musicPlayer:stop()
        bombSpeed = 0
        if pd.buttonJustPressed(pd.kButtonA) then
            gameState = "active"
            score = 0
            bombSpeed = 5
            playerSprite:moveTo(playerStartX, playerStartY)
            bombSprite:moveTo(450, math.random(40, 200))
            musicPlayer:play(0)
        end
    elseif gameState == "active" then
        velocityY += gravity
        playerSprite:moveBy(velocityX, velocityY)
        if pd.buttonJustPressed(pd.kButtonA) then
            velocityY = hopStrength
            velocityX = hopSpeed 
        end

        local actualX, actualY, collisions, length = bombSprite:moveWithCollisions(bombSprite.x -bombSpeed, bombSprite.y)
        if bombSprite.x < -20 then
            bombSprite:moveTo(450, math.random(40, 200))
            score += 1
            bombSpeed += 0.4
        end

        if length > 0 or playerSprite.y > 270 or playerSprite.y < -30 then
            gameState = "stopped"
        end

        gfx.drawTextAligned("Score: " .. score, 390, 10, kTextAlignment.right)
    end
end