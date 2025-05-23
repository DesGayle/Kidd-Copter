
local pd <const> = playdate
local gfx <const> = playdate.graphics

gamestates = {}

-- MENU STATE
function gamestates.menu()
    local menuImage = gfx.image.new("images/titleScreen.png")
    return {
        enter = function()
           
        end,
        update = function()
            if pd.buttonJustPressed(pd.kButtonA) then
                StateManager:setState("playing")
            elseif pd.buttonJustPressed(pd.kButtonB) then
                StateManager:setState("credits")
            end
        end,
        draw = function()
            gfx.clear(gfx.kColorWhite)
            menuImage:draw(0, 0)
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
            if pd.buttonJustPressed(pd.kButtonB) then
                StateManager:setState("menu")
            end
        end,
        draw = function()
            gfx.clear()
            gfx.drawTextAligned("Credits", 200, 60, kTextAlignment.center)
            gfx.drawTextAligned("art and animation by Lu Nascimento", 200, 100, kTextAlignment.center)
            gfx.drawTextAligned("title screen and menu by Cyrus", 200, 120, kTextAlignment.center)
            gfx.drawTextAligned("created and developed by Kid Desimo", 200, 140, kTextAlignment.center)
            gfx.drawTextAligned("music from #Uppbeat (free for Creators!)", 200, 160, kTextAlignment.center)
            gfx.drawTextAligned("Press B to return", 200, 200, kTextAlignment.center)
        end
    }
end

return gamestates
