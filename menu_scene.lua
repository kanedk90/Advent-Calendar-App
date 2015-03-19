---------------------------------------------------------------------------------
-- Menu Page
-- Have options to go to the calendar page or credits page
---------------------------------------------------------------------------------

local storyboard = require( "storyboard" )
local scene = storyboard.newScene()
local hohoho = audio.loadSound("media/xmas.wav") 

-- Clear previous scene
storyboard.removeAll()

-- local forward references should go here --

--function that transitions to required scene and plays jingle
local function buttonHit(event)
    audio.play(hohoho)
    storyboard.gotoScene(event.target.goto, {effect = "slideRight"})
end

---------------------------------------------------------------------------------
-- BEGINNING OF YOUR IMPLEMENTATION
---------------------------------------------------------------------------------


-- Called when the scene's view does not exist:
function scene:createScene( event )
    local group = self.view

    --Created the calendar button
    local calendarButton = display.newImage("images/calendarButton.png", 160, 190)
    group:insert(calendarButton)
    calendarButton:scale(1.5, 1.5)
    calendarButton:addEventListener("tap", buttonHit)
    calendarButton.goto = "calendar_scene"

    --Created the creditsButton
    local creditsButton = display.newImage("images/creditsButton.png", 160, 290)
    group:insert(creditsButton)
    creditsButton:scale(1.5, 1.5)
    creditsButton:addEventListener("tap", buttonHit)
    creditsButton.goto = "credits_scene"

    --Created Until Xmas Text
    local xmasText = display.newText("Until Christmas", 0, 0, native.systemFontBold, 30)
    xmasText: setTextColor( 0, 0,.75)
    xmasText.x, xmasText.y = 160, 80
    group:insert(xmasText)

    --Created The number of days remaining text
    local dayText = display.newText( "", 0, 0, native.systemFontBold, 30 )
    dayText:setTextColor( 0, 0, .75)
    dayText.x, dayText.y = 55, 45
    group:insert(dayText)

    --Craeted The number of hours remaining text
    local hourText = display.newText( "", 0, 0, native.systemFontBold, 30 )
    hourText:setTextColor( 0, 0, .75)
    hourText.x, hourText.y = 160, 45
    group:insert(hourText)

    --Created The number of minutes remaining text
    local minutesText = display.newText( "", 0, 0, native.systemFontBold, 30 )
    minutesText:setTextColor( 0, 0, .75)
    minutesText.x, minutesText.y = 255, 45
    group:insert(minutesText)

    --Created the Days label
    local dayLabel = display.newText( "Days", 0, 0, native.systemFont, 30 )
    dayLabel:setTextColor( 0, 0, .75 )
    dayLabel.x = 60; dayLabel.y = 5
    group:insert(dayLabel)

    --Created the Hours label
    local hourLabel = display.newText( "Hours", 0, 0, native.systemFont, 30)
    hourLabel:setTextColor( 0, 0, .75 )
    hourLabel.x = 160; hourLabel.y = 5
    group:insert(hourLabel)

    --Created the Minutes label
    local minuteLabel = display.newText( "Mins", 0, 0, native.systemFont, 30 )
    minuteLabel:setTextColor( 0, 0, .75 )
    minuteLabel.x = 260; minuteLabel.y = 5
    group:insert(minuteLabel)

    --Created the Function to update the countdown clock
    local function updateTime()
        local time = os.date("*t")

        local daysLeft = 358 - time.yday
        if (daysLeft < 10) then
        daysLeft = "0" .. daysLeft
        end
        dayText.text = daysLeft

        local hoursLeft = 23 - time.hour
        if (hoursLeft < 10) then
        hoursLeft = "0" .. hoursLeft
        end
        hourText.text = hoursLeft

        local minutesLeft = 60 - time.min
        if (minutesLeft < 10) then
        minutesLeft = "0" .. minutesLeft
        end
        minutesText.text = minutesLeft
end

    --Update the time to display the correct time
    updateTime()

    -- Update the clock once per second
    local clockTimer = timer.performWithDelay( 1000, updateTime, -1 )
end
---------------------------------------------------------------------------------
-- END OF YOUR IMPLEMENTATION
---------------------------------------------------------------------------------

-- "createScene" event is dispatched if scene's view does not exist
scene:addEventListener( "createScene", scene )

---------------------------------------------------------------------------------

return scene

