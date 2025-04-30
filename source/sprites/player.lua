local pd <const> = playdate
local gfx <const> = pd.graphics

class("Player").extends(gfx.sprite)

local playerStartX = 40
local playerStartY = 120
local playerSpeed = 3
local playerIdleImage = gfx.image.new("assets/chopper_idle")
-- local playerHopImage = gfx.imagetable.new("assets/chopper_hop")

-- Player Movement

local gravity = 0.05
local hopStrength = -2 -- vertical hop speed
local hopSpeed = 0.3 -- horizontal hop speed

 -- create the player
function Player:init()
    Player.super.init(self, playerIdleImage)
    self:moveTo(playerStartX, playerStartY)
    self:setCollideRect(2, 2, 30, 30) --Need to either change the shape to be a more sophisticated "plus" shape or ignore the tail.
    self.velocityX = 0
    self.velocityY = 0
end
    -- update every frame
function Player:update()
    Player.super.update(self)

    self.velocityY = self.velocityY + gravity
    self:moveBy(self.velocityX, self.velocityY)
        
    if pd.buttonJustPressed(pd.kButtonA) then
        self.velocityY = hopStrength
        self.velocityX = hopSpeed
    end
end