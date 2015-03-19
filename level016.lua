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
        
        --created the X days to go text
	local title = display.newText( "9 days to go!", 160, 40, native.systemFontBold, 38 )
        title:setTextColor( .75, 0, 0)
        group:insert(title)
        
        --created the level image
        local levelImage = display.newImage("images/level016.png", 160, 240)
        levelImage: scale(2, 2)
        group:insert(levelImage)
        
        --creates back button
        backButton = display.newImage("images/backButton.png", 43, 495)
        group:insert(backButton)
        backButton.destination = "calendar_scene" 
        backButton:addEventListener("tap", buttonHit)
end

-- Called immediately after scene has moved onscreen:
--[[function scene:enterScene( event )

!!!!!!!!!!!!!!!!!!!!---COULD NOT GET THIS FUNCTION TO WORK CORRECTLY, UNCOMMENT TO ATTEMPT TO IMPLEMENT IT-----------!!!!!!!!!!!!!!!!
        local group = self.view
        
        local function btnClicked (event)
	levels[16] = 3
	levels[17] = 1
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

