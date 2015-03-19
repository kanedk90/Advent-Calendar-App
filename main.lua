require "CiderDebugger";
--add a global background i.e its displayed on every pageof the app
local background = display.newImage("images/xmasbg.jpg",160, 240,300,480)
--load jingle SFX
local hohoho = audio.loadSound("media/xmas.wav")
--add a global Mute button
local muteUnmuteText = display.newText("Mute", 290, 495, native.SystemFontBold, 25)
muteUnmuteText:setTextColor(0,0,0.75)
muteUnmuteText.status = "playing"
--load global bgMusic 
local bgMusic = audio.loadSound("media/bgmusic.wav")
local backgroundMusicChannel = audio.play( bgMusic, { channel=1, loops=-1, fadein=5000 } )


--create function mutes or plays the background music
function muteUnmuteText:tap(event)
    if(self.status == "playing")then
        audio.pause();
        self.status = "paused"
        self.text = "Play"
    elseif(self.status == "paused")then
        audio.resume()
        self.status = "playing"
        self.text = "Mute"
    end
end
--create muteUnmuteText event listener that mutes/plays bgMusic
muteUnmuteText:addEventListener("tap", muteUnmuteText)

--remove snowflake images
local function removeFlake(target)
        target:removeSelf()
        target = nil
end

--controls global falling snow effects
local function spawnSnowFlake()
        local flake = display.newImage("images/snowflake.png")
        flake.x = math.random(display.contentWidth)
        flake.y = -2
        local wind = math.random(80) - 40
        transition.to(flake,{time=math.random(3000) + 3000, y = display.contentHeight + 2, x = flake.x + wind,
        onComplete=removeFlake})
end

local function makeSnow(event)
      if math.random(10) == 1 then -- adjust speed here by making the random number higher or lower
            spawnSnowFlake()
      end
      return true
end
--listener for falling snow effect
Runtime:addEventListener("enterFrame",makeSnow)
 
--load storyboard libary
local storyboard = require( "storyboard" )
--destroy previous scene on scene change
storyboard.purgeOnScreenChange = true
--when app opened direct user to the menu_scene
storyboard.gotoScene( "menu_scene" )


