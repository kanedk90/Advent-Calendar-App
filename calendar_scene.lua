---------------------------------------------------------------------------------
-- Calendar Scene
-- Have options to go to each of the 25 days listed
---------------------------------------------------------------------------------
--import storyboard libary
local storyboard = require( "storyboard" )
local scene = storyboard.newScene()
--load sound
local hohoho = audio.loadSound("media/xmas.wav") 

-- Clear previous scene
storyboard.removeAll()

-- local forward references should go here --

--[[levels = 
{	
1, 2, 2, 2 ,2,  --1 means level is open to 	be played (level.png)
2, 2, 2, 2, 2,  --2 means level is locked (locked.png)
2, 2, 2, 2, 2,  --3 means level is completed (greenchecked.png)
2, 2, 2, 2, 2,
2, 2, 2, 2, 2,
}]]

--create table of images 
levels = 
{	
1, 1, 1, 1 ,1,  --1 means level is open to 	be played (level.png)
1, 1, 1, 1, 1,   --2 means level is locked (locked.png)
1, 1, 1, 1, 1,
1, 1, 1, 1, 1,
1, 1, 1, 1, 1,
}

--display images in accordance to number i.e. 1 = gift, 2 = lock, 3 = checked
images ={
    { getFile = "images/gift.png", types = "play"},
    { getFile = "images/lock.png", types = "locked"},
    { getFile = "images/greenchecked.png", types = "done"}
}

--function that transitions to required scene and plays jingle
local function buttonHit(event)
	storyboard.gotoScene ( event.target.destination, {effect = "slideLeft"} )
        audio.play(hohoho)
	print( event.target.destination)
		return true
end
---------------------------------------------------------------------------------
-- BEGINNING OF YOUR IMPLEMENTATION
---------------------------------------------------------------------------------


-- Called when the scene's view does not exist:
function scene:createScene( event )
  local group = self.view
  
        --Created function that displays required images, adds day number over images, and formats the table layout i.e. spacing
        local levelIndex = 0
            for i=0,4 do
		for j=1,5 do
                               
                    tablePlace =   i*5 + j	
                    levelIndex = levelIndex + 1
                    local imagesId = levels[levelIndex] 
                    levelImg = display.newImageRect (images[imagesId].getFile , 50, 50 )
                    levelImg.x = -22 + (j*62)
                    levelImg.y  = 130+ (i*70)
                    levelImg.anchorY = .8
                    group:insert(levelImg)

                    local levelText = display.newText(tablePlace,0,0,native.systemFontBold,30)
                    levelText:setTextColor(0, 0, .75)
                    levelText.x = -22 + (j*62)
                    levelText.y = 115+ (i*70)
                    group:insert(levelText)
						
                    levelImg.destination = "level0"..tostring(tablePlace)
						
                    if images[imagesId].types ~= "locked" then
                    levelImg:addEventListener("tap", buttonHit)
                    end
                end
            end
		
        --Created Christmas countdown heading
        local heading = display.newText("Christmas Countdown", 0, 0, native.systemFontBold, 31)
        heading: setTextColor( .75, 0, 0)
        heading.x, heading.y = 160, 35
        group:insert(heading)
        
        --Created back button that transitions toprevious page
        local backButton = display.newImage("images/backButton.png", 43, 495)
        group:insert(backButton)
        backButton:addEventListener("tap", buttonHit)
        backButton.destination = "menu_scene"
end

---------------------------------------------------------------------------------
-- END OF MY IMPLEMENTATION
---------------------------------------------------------------------------------

-- "createScene" event is dispatched if scene's view does not exist
scene:addEventListener( "createScene", scene )
---------------------------------------------------------------------------------

return scene




