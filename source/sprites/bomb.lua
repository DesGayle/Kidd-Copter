local pd <const> = playdate
local gfx <const> = pd.graphics


-- Bomb Enemy
local bombSpeed = 0
local bombImage = gfx.image.new("assets/bomb")
local bombSprite = gfx.sprite.new(bombImage)
bombSprite.collisionResponse = gfx.sprite.kCollisionTypeOverlap
bombSprite:setCollideRect(8, 5, 15, 6)
bombSprite:moveTo(450, 240)
bombSprite:add()