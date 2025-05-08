local pd <const> = playdate
local gfx <const> = pd.graphics

local floorSprite = nil -- Declare the floor sprite
local floorImagePath = "images/waterTexture.png"
local floorImage = gfx.image.new(floorImagePath)
if not floorImage then
    error("Failed to load floor image at path: " .. floorImagePath)
end
assert(floorImage, "Failed to load floor image!")
    -- The size is automatically set by the image, so this line is not needed.
-- Initializes the floor sprite and sets its properties.

Environment = {}

function Environment.init()
    -- Create the floor sprite
    floorSprite = gfx.sprite.new(floorImage)
    --floorSprite:setSize(400, 20) -- Set the floor size (width: 400px, height: 20px)
    floorSprite:moveTo(200, 230) -- Position the floor at the bottom of the screen
    local spriteWidth, spriteHeight = floorSprite:getSize()
    floorSprite:setCollideRect(0, 0, spriteWidth, spriteHeight) -- Enable collision for the floor
    floorSprite:add() -- Add the floor to the sprite system
end

return Environment