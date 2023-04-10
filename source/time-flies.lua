-- import "CoreLibs/object"
-- import "CoreLibs/graphics"
-- import "CoreLibs/sprites"
-- import "CoreLibs/timer"

-- local gfx <const> = playdate.graphics

-- -- Time flies - declaring variables
-- local playerSprite = nil
-- local playerImage = nil
-- local playerImageUp = nil
-- local playerImageDown = nil
-- local playerImageLeft = nil
-- local playerImageRight = nil
-- local playerSpeed = 4
-- local playTimer = nil
-- local playTime = 30 * 1000
-- local coinSprite = nil
-- local score = 0

-- -- Time flies - Start new timer for
-- local function resetTimer()
-- 	playTimer = playdate.timer.new(playTime, playTime, 0, playdate.easingFunctions.linear)
-- end

-- -- Time flies - Move coin
-- local function moveCoin()
-- 	local randX = math.random(40, 360)
-- 	local randY = math.random(40, 200)
-- 	coinSprite:moveTo(randX, randY)
-- end

-- -- Time flies - Init - Create sprites, and start timer
-- local function initialize()
-- 	math.randomseed(playdate.getSecondsSinceEpoch())
	
--   playerImageUp = gfx.image.new("images/player-up")

--   playerImageDown = gfx.image.new("images/player-down")
  
--   playerImageLeft = gfx.image.new("images/player-left")
  
--   playerImageRight = gfx.image.new("images/player-right")
  
--   playerImage = gfx.image.new("images/player")
-- 	playerSprite = gfx.sprite.new(playerImage)
-- 	playerSprite:moveTo(200, 120)
-- 	playerSprite:setCollideRect(0, 0, playerSprite:getSize())
-- 	playerSprite:add()

-- 	local coinImage = gfx.image.new("images/coin")
--     coinSprite = gfx.sprite.new(coinImage)
-- 	moveCoin()
-- 	coinSprite:setCollideRect(0, 0, coinSprite:getSize())
-- 	coinSprite:add()

-- 	resetTimer()
-- end

-- initialize()

-- function playdate.update()

--   local noButton = true

-- 	if playTimer.value == 0 then
-- 		if playdate.buttonJustPressed(playdate.kButtonA) then
-- 			resetTimer()
-- 			moveCoin()
-- 			score = 0
-- 		end
-- 	else
-- 		if playdate.buttonIsPressed(playdate.kButtonUp) then
-- 			playerSprite:moveBy(0, -playerSpeed)
--       playerSprite:setImage(playerImageUp)
--       noButton = false
-- 		end
-- 		if playdate.buttonIsPressed(playdate.kButtonRight) then
-- 			playerSprite:moveBy(playerSpeed, 0)
--       playerSprite:setImage(playerImageRight)
--       noButton = false
-- 		end
-- 		if playdate.buttonIsPressed(playdate.kButtonDown) then
-- 			playerSprite:moveBy(0, playerSpeed)
--       playerSprite:setImage(playerImageDown)
--       noButton = false
-- 		end
-- 		if playdate.buttonIsPressed(playdate.kButtonLeft) then
-- 			playerSprite:moveBy(-playerSpeed, 0)
--       playerSprite:setImage(playerImageLeft)
--       noButton = false
-- 		end

-- 		local collisions = coinSprite:overlappingSprites()
-- 		if #collisions >= 1 then
-- 			moveCoin()
-- 			score += 1
-- 		end
-- 	end

--   if noButton == true then
--     playerSprite:setImage(playerImage)
--     noButton = false
--   end

-- 	playdate.timer.updateTimers()
-- 	gfx.sprite.update()

-- 	gfx.drawText("Time: " .. math.ceil(playTimer.value/1000), 5, 5)
-- 	gfx.drawText("Score: " .. score, 320, 5)
-- end