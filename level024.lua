--import storyboard library
local storyboard = require( "storyboard" )
local scene = storyboard.newScene()
--import gameUI library
local gameUI = require("gameUI")
--import physics library
local physics = require("physics")
--load audio jingle
local hohoho = audio.loadSound("media/xmas.wav") 

----function that transitions to required scene and plays jingle
local function buttonHit(event)
	storyboard.gotoScene (  event.target.destination, {effect = "slideLeft"} )
        audio.play(hohoho)
	return true
end

 --added dragBody function allowing user to move the snowman around the screen
local function dragBody( event ) 
    return gameUI.dragBody( event ) 
end

-- Called when the scene's view does not exist:
function scene:createScene( event )
	local group = self.view
        
        --Created x days until christmas 
	local title = display.newText( "1 day to go!", 0, 0, native.systemFontBold, 38 )
        title:setTextColor( .75, 0, 0)
	title.x = 160
	title.y = 40
	group:insert(title)
        
        --creates back button
        backButton = display.newImage("images/backButton.png", 43, 495)
        group:insert(backButton)
        backButton.destination = "calendar_scene" 
        backButton:addEventListener("tap", buttonHit)
        
        --start physics
        physics.start (true)

        --created floor boundary
        local bottom = display.newRect(160, 490, 320, 0)
        physics.addBody(bottom, "static")
        group:insert(bottom)
        
        --created ceiling boundary
        local ceiling = display.newRect(160, 0, 320, 0)
        physics.addBody(ceiling, "static")
        group:insert(ceiling)
        
        --created leftWall boundary
        local leftWall = display.newRect(1, 0, 1, 1000)
        physics.addBody(leftWall, "static")
        group:insert(leftWall)
        
        --created rightWall boundary
        local rightWall = display.newRect(320, 0, 1, 1000)
        physics.addBody(rightWall, "static")
        group:insert(rightWall)
        
        --created torso of snowman
        local snowmanMiddle = display.newCircle(160, 260, 60)
        group:insert(snowmanMiddle)
        physics.addBody(snowmanMiddle, "dynamic", {density = 1.0, friction = 1.0, bounce = 0, radius = 6.0})
        
        --created bootom ofsnowman
        local snowmanBottom = display.newCircle(160, 350, 80)
        group:insert(snowmanBottom)
        physics.addBody(snowmanBottom, "dynamic", {density = 0, friction = 1.0, bounce = 0, radius = 6.0})
        
        --created head of snowman
        local levelImage = display.newImage("images/snowmanHead.png", 160, 160)
        levelImage: scale(.1, .1)
        group:insert(levelImage)
        physics.addBody(levelImage, "dynamic", {density = 0, friction = 1.0, bounce = 0, radius = 6.0})
        
        --added joints between snowman sections
        local myPivotJoint = physics.newJoint("pivot", levelImage, snowmanMiddle, levelImage.x, snowmanMiddle.y)
        local myPivotJoint = physics.newJoint("pivot", snowmanMiddle, snowmanBottom, snowmanMiddle.x, snowmanBottom.y)
        local myPivotJoint = physics.newJoint("pivot", snowmanBottom, snowmanMiddle, snowmanBottom.x, snowmanMiddle.y)
       
        --added dragBody function allowing user to move the snowman around the screen
        local function dragBody( event ) 
            return gameUI.dragBody( event ) 
        end 

        --added touch event listener to each part of the snowman
        snowmanMiddle:addEventListener( "touch", dragBody )
        snowmanBottom:addEventListener( "touch", dragBody )
        levelImage:addEventListener( "touch", dragBody )
end

-- Called immediately after scene has moved onscreen:
--[[function scene:enterScene( event )

!!!!!!!!!!!!!!!!!!!!---COULD NOT GET THIS FUNCTION TO WORK CORRECTLY, UNCOMMENT TO ATTEMPT TO IMPLEMENT IT-----------!!!!!!!!!!!!!!!!
        local group = self.view
        
        local function btnClicked (event)
	levels[24] = 3
	levels[25] = 1
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




