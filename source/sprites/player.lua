local pd <const> = playdate
local gfx <const> = pd.graphics

class("Player").extends(gfx.sprite)

local playerStartX = 40
local playerStartY = 120
local playerSpeed = 3
local playerIdleImage = gfx.image.new("assets/chopper_idle")
local playerHopImage = gfx.imagetable.new("assets/chopper_hop")

-- Player Movement
local velocityX = 0
local velocityY = 0
local gravity = 0.2
local hopStrength = -4 -- vertical hop speed
local hopSpeed = 0.3 -- horizontal hop speed

local jumpAnimator = nil



 -- create the player
function Player:init()
    Player.super.init(self, playerIdleImage)
    self:moveTo(playerStartX, playerStartY)
    self:setCollideRect(2, 2, 30, 30) --Need to either change the shape to be a more sophisticated "plus" shape or ignore the tail.
    
    
end

function Player:update()
    -- update every frame
end