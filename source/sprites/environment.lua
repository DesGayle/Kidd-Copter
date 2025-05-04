local pd <const> = playdate
local gfx <const> = pd.graphics

local floor = nil -- Declare the floor sprite

local function init()
    -- Create the floor sprite
    floor = gfx.sprite.new()
    floor:setSize(400, 20) -- Set the floor size (width: 400px, height: 20px)
    floor:moveTo(200, 230) -- Position the floor at the bottom of the screen
    floor:setCollideRect(0, 0, 400, 20) -- Enable collision for the floor
    floor:add() -- Add the floor to the sprite system
end