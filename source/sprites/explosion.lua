local pd <const> = playdate
local gfx <const> = pd.graphics

class("Explosion").extends(gfx.sprite)

function Explosion:init(x, y)
    Explosion.super.init(self)

    -- Load the explosion image table
    local explosionImages = gfx.imagetable.new("images/explosion")
    assert(explosionImages, "Failed to load explosion image table!")

    -- Set the sprite to use the image table
    self:setImage(explosionImages[1])
    self:moveTo(x, y)

    -- Add an animation player to play the explosion frames
    self.animation = gfx.animation.loop.new(100, explosionImages, false) -- 100ms per frame, non-looping
end

function Explosion:update()
    -- Update the animation
    if self.animation:isPlaying() then
        self:setImage(self.animation:image())
    else
        self:remove() -- Remove the sprite when the animation is done
    end
end