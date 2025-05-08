local pd <const> = playdate
local gfx <const> = pd.graphics

import "sprites/explosion"

class("Player").extends(gfx.sprite)

local playerStartX = 100 --this was fine, just needed a recompile
local playerStartY = 120
local playerSpeed = 3
local playerIdleImage = gfx.image.new("images/chopper_idle")
-- local playerHopImage = gfx.imagetable.new("assets/chopper_hop")

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
    -- update every frame
function Player:update()
    Player.super.update(self)

    self.velocityY = self.velocityY + gravity -- Apply gravity
    local actualX, actualY, collisions, length = self:moveWithCollisions(self.x + self.velocityX, self.y + self.velocityY)

    --self:moveBy(self.velocityX, self.velocityY)

    for i = 1, length do
        local collision = collisions[i]
        if collision.other == floor then
            self:explode() -- Trigger explosion
            StateManager:setState("gameover") -- Set game state to game over
            break
        end
    end
        
    if pd.buttonJustPressed(pd.kButtonA) then
        self.velocityY = hopStrength
        --self.velocityX = hopSpeed
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