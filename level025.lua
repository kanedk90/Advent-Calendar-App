--local widget = require("widget")!!!--comment in if attempting to try out commented out code below--!!!
--import storyboard library
local storyboard = require( "storyboard" )
local scene = storyboard.newScene()
--load jingle audio file
local hohoho = audio.loadSound("media/xmas.wav")  
-- local forward references should go here --

--local completeGameBtn!!!--comment in if attempting to try out commented out code below--!!!

----function that transitions to required scene and plays jingle
local function buttonHit(event)
	storyboard.gotoScene (  event.target.destination, {effect = "slideLeft"} )
        audio.play(hohoho)
	return true
end

-- Called when the scene's view does not exist:
function scene:createScene( event )
	local group = self.view
        
        --Created Merry Xmas Text
	local title = display.newText( "Merry Christmas!", 0, 0, native.systemFontBold, 38 )
        title:setTextColor( .75, 0, 0)
        title.x = 160
	title.y = 40
	group:insert(title)

        --setup options table for image sheet
        local options =
                    {
                    width = 101, --of a sinfle frame
                    height = 142,--of a single frame
                    numFrames = 15--number of frames
                    }
        --use optionstable to build the image sheet          
        local xmasTreeSheet = graphics.newImageSheet("images/xmasTree.png", options)

        --looping sequence, sequential frames
        local xmasTreeSequenceData = 
        {
            name = "blink", --name of sequence
            start = 1, --start of sequence
            count = 15, --no. of frames in sequence
            time = 3000, -- duration of sequence
            loopCount = 0, --make looping sequence
            loopDirection = "forward" --direction of sequence
        }

        local xmasTree = display.newSprite(xmasTreeSheet, xmasTreeSequenceData)
        group:insert(xmasTree)

        xmasTree: setSequence("blink")
        xmasTree.x, xmasTree.y = 160, 250
        xmasTree:play()

        --created back button
        local backButton = display.newImage("images/backButton.png", 43, 495)
        group:insert(backButton)
        backButton:addEventListener("tap", buttonHit)
        backButton.destination = "calendar_scene"
end

-- Called immediately after scene has moved onscreen:
--[[function scene:enterScene( event )

!!!!!!!!!!!!!!!!!!!!---COULD NOT GET THIS FUNCTION TO WORK CORRECTLY, UNCOMMENT TO ATTEMPT TO IMPLEMENT IT-----------!!!!!!!!!!!!!!!!
        local group = self.view
        
        local function btnClicked (event)
	levels[23] = 3
	levels[24] = 1
	completegameBtn.destination = "calendar_scene" 
	completegameBtn:addEventListener("tap", buttonHit)
	end

	completegameBtn = widget.newButton { label = "Check Day", onRelease=btnClicked}
        
        labelColor = { completegameBtn={ 0, 1, 0 }} 
	completegameBtn.x = 160
	completegameBtn.y = 400
	group:insert (completegameBtn)
end]]--


---------------------------------------------------------------------------------
-- END OF YOUR IMPLEMENTATION
---------------------------------------------------------------------------------

-- "createScene" event is dispatched if scene's view does not exist
scene:addEventListener( "createScene", scene )

-- "enterScene" event is dispatched whenever scene transition has finished
--scene:addEventListener( "enterScene", scene )!!!--comment in if attempting to try out commented out code above--!!!

---------------------------------------------------------------------------------

return scene


