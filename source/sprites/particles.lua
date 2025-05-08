local pd <const> = playdate
local gfx <const> = pd.graphics

local bombTrails = gfx.imagetable.new("images/bombTrail.png")
assert(bombTrails, "Failed to load bomb trail image table!")

class("Particles").extends(gfx.sprite)

function Particles:init()
    self.index = 1 -- Initialize the index to the first image in the table
    Particles.super.init(self, bombTrails[self.index])
    self:moveTo(200, 120)   -- Set the initial position of the sprite

    -- Add an animation player to play the explosion frames
    --self.animation = gfx.animation.loop.new(100, bombTrails, false) -- 100ms per frame, non-looping
end 

function Particles:update()
    -- Update the animation
    --if self.animation:isPlaying() then
        --self.index = self.index + 1
        if self.index < #bombTrails then
            self.index += 1
        else
            self.index = 1
        end

        self:setImage(bombTrails[self.index])
    --else
    --    self:remove() -- Remove the sprite when the animation is done
    --end
end
--[[ function Particles:remove()
    -- Remove the sprite from the screen
    self:remove()
end ]]