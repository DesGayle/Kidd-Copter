local pd <const> = playdate
local gfx <const> = pd.graphics

import "sprites/explosion"

class("Player").extends(gfx.sprite)

local playerStartX = 100 --this was fine, just needed a recompile
local playerStartY = 120
local playerSpeed = 3
local playerIdleImage = gfx.image.new("images/chopperIdle")
local playerHopImage = gfx.imagetable.new("images/chopperHop")

-- Player Movement
local gravity = 0.05
local hopStrength = -2 -- vertical hop speed
local hopSpeed = 0.3 -- horizontal hop speed

 -- create the player
function Player:init()
    Player.super.init(self, playerIdleImage)
    self:moveTo(playerStartX, playerStartY)
    self:setCollideRect(6, 2, 26, 28)
    self.velocityX = 0
    self.velocityY = 0
    
end
    --[[ self.isAnimating = false -- Flag to track animation state
    self.animationIndex = 1 -- Track the current animation frame ]]

    -- update every frame
function Player:update()
    Player.super.update(self)

    self.velocityY = self.velocityY + gravity -- Apply gravity
    local actualX, actualY, collisions, length = self:moveWithCollisions(self.x + self.velocityX, self.y + self.velocityY)

    --self:moveBy(self.velocityX, self.velocityY)

    --[[ for i = 1, length do
        local collision = collisions[i]
        if collision.other == floor then
            self:explode() -- Trigger explosion
            StateManager:setState("gameover") -- Set game state to game over
            break
        end
    end ]]
        
    if pd.buttonJustPressed(pd.kButtonA) and not self.isAnimating then
        self.isAnimating = true
        self.animationIndex = 1 -- Reset animation index to 1
        self.velocityY = hopStrength
        --self.velocityX = hopSpeed
    end

    -- shooting bullets

    local isButtonPressed = pd.buttonJustPressed(pd.kButtonB)

    if isButtonPressed then
        local bullet = Bullet()
        bullet:spawn(self.x, self.y, 5, 0) -- Set the bullet's position to the player's position
        
        --bullet:moveBy(0, -10) -- Move the bullet upwards
    end

    if self.isAnimating then
        self:setImage(playerHopImage[self.animationIndex])
        self.animationIndex += 1
        if self.animationIndex > #playerHopImage then
            self.isAnimating = false
            self:setImage(playerIdleImage) -- Reset to idle image
        end
    end
end

function Player:explode()
    -- Play explosion sound
    local explosionSFX = pd.sound.sampleplayer.new("audio/explosion.wav")
    explosionSFX:play()

    -- Create and add the explosion animation
    local explosion = Explosion(self.x, self.y)
    explosion:add()

    -- Remove the player sprite (optional)
    self:remove()
end