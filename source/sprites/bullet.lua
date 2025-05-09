local pd <const> = playdate
local gfx <const> = pd.graphics

local imageBullet <const> = gfx.image.new(assets.bullet)

class("Bullet").extends(gfx.sprite)

function Bullet:init()
    Bullet.super.init(self, imageBullet)
    self.velocityX = 0
    self.velocityY = 0
end

function Bullet:spawn(posX, posY, velX, velY)
    -- Set the initial position and velocity of the bullet
    self:add()
    self:moveTo(posX, posY)
    self.velocityX = velX
    self.velocityY = velY

    -- Set the collision response
   --[[  self.collisionResponse = gfx.sprite.kCollisionTypeOverlap
    self:setCollideRect(0, 0, 16, 16) -- Adjust the collision rectangle as needed ]]
    
end

function Bullet:update()
    -- Update the bullet's position based on its velocity
    --local x, y = self:position()
    self:moveBy(self.velocityX, self.velocityY)

    -- Check if the bullet is off-screen and remove it if so
   --[[  if x < 0 or x > 400 or y < 0 or y > 240 then
        self:remove()
    end ]]
end
--[[ 
    -- Load the bullet image
    local bulletImage = gfx.image.new("images/bullet")
    assert(bulletImage, "Failed to load bullet image!")

    -- Set the sprite to use the bullet image
    self:setImage(bulletImage)
    self:moveTo(x, y)

    -- Set the collision response
    self.collisionResponse = gfx.sprite.kCollisionTypeOverlap
    self:setCollideRect(0, 0, 16, 16) -- Adjust the collision rectangle as needed

    -- Add the sprite to the display
    self:add()
end ]]