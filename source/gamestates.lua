-- gamestates.lua
--local StateManager = import("statemanager")
local gfx <const> = playdate.graphics

gamestates = {}

-- MENU STATE
function gamestates.menu()
    return {
        enter = function()
            gfx.clear()
        end,
        update = function()
            if playdate.buttonJustPressed(playdate.kButtonA) then
                StateManager:setState("playing")
            end
        end,
        draw = function()
            gfx.clear()
            gfx.drawTextAligned("Kidd Copter", 200, 80, kTextAlignment.center)
            gfx.drawTextAligned("Press A to Start", 200, 120, kTextAlignment.center)
        end
    }
end

-- PLAYING STATE
function gamestates.playing()
    local player = nil

    return {
        enter = function()
            player = Player()
            player:add()
        end,
        update = function()
            gfx.sprite.update()
            if player then
                player:update()
            end
        end,
        draw = function()
            -- Add HUD or score display here
        end,
        exit = function()
            gfx.sprite.removeAll()
        end
    }
end

-- PAUSED STATE
function gamestates.paused()
    local controlsImage = gfx.image.new("images/controls")
    local logoImage = gfx.image.new("images/logo")

    return {
        update = function()
        
        end,
        draw = function()
            gfx.setColor(gfx.kColorWhite)
            gfx.fillRect(0, 0, 400, 240)
            --[[ controlsImage:draw(20, 60)
            logoImage:draw(260, 60) ]]
            gfx.setColor(gfx.kColorBlack)
            gfx.drawText("Paused - Open menu to resume", 100, 20)
        end
    }
end

-- GAMEOVER STATE
function gamestates.gameover()
    return {
        enter = function()
            -- Could play sound or animation
        end,
        update = function()
            if playdate.buttonJustPressed(playdate.kButtonA) then
                StateManager:setState("menu")
            end
        end,
        draw = function()
            gfx.clear()
            gfx.drawTextAligned("Game Over", 200, 100, kTextAlignment.center)
            gfx.drawTextAligned("Press A to return to menu", 200, 130, kTextAlignment.center)
        end
    }
end

-- CREDITS STATE
function gamestates.credits()
    return {
        update = function()
            -- Check for button presses to return to menu
            if playdate.buttonJustPressed(playdate.kButtonA) or playdate.buttonJustPressed(playdate.kButtonB) then
                StateManager:setState("menu")
            end
        end,
        draw = function()
            gfx.clear()
            gfx.drawTextAligned("Credits", 200, 60, kTextAlignment.center)
            gfx.drawTextAligned("Game by Altered Gene", 200, 100, kTextAlignment.center)
            gfx.drawTextAligned("Music by ...", 200, 120, kTextAlignment.center)
            gfx.drawTextAligned("Press A or B to return", 200, 200, kTextAlignment.center)
        end
    }
end

return gamestates
