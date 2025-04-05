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


function pd.update()
    gfx.sprite.update()

    -- Insert player controls here

end