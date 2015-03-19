---------------------------------------------------------------------------------
-- Credits Page
-- Show credits
---------------------------------------------------------------------------------
--import storyboard library
local storyboard = require( "storyboard" )
local scene = storyboard.newScene()
--load jingle
local hohoho = audio.loadSound("media/xmas.wav") 
-- Clear previous scene
storyboard.removeAll()

--function that transitions to required scene and plays jingle
local function buttonHit(event)
    audio.play(hohoho)
    storyboard.gotoScene(event.target.goto, {effect = "slideLeft"})
    
end
---------------------------------------------------------------------------------
-- BEGINNING OF YOUR IMPLEMENTATION
---------------------------------------------------------------------------------


-- Called when the scene's view does not exist:
function scene:createScene( event )
  local group = self.view
 
  --Created back button that transitions toprevious page
  local backButton = display.newImage("images/backButton.png", 43, 495)
  group:insert(backButton)
  backButton:addEventListener("tap", buttonHit)
  backButton.goto = "menu_scene"
  
  --Created the credits speech buuble
  local creditsText = display.newImage("images/credits.png", 160, 120)
  creditsText:scale(1.5, 1.5)
  group:insert(creditsText)
  
  --Created santa image
  local Santa = display.newImage("images/santa.png", 215, 350)
  Santa:scale(2,2)
  group:insert(Santa)
end

---------------------------------------------------------------------------------
-- END OF YOUR IMPLEMENTATION
---------------------------------------------------------------------------------

-- "createScene" event is dispatched if scene's view does not exist
scene:addEventListener( "createScene", scene )

---------------------------------------------------------------------------------

return scene


