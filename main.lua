--[[
      Simple Love Game
		Main Game Loop
	The game will continuously
	run these three functions until the
	game ends.
	run order:
		Load / Update / Draw
]]

require("obj.button")
require("obj.player")
require("obj.npc")

function love.load()
--[[
		Android/iOS text input is disabled by default.
		On iOS and Android this variant tells the OS that the
		specified rectangle is where text will show up in the game,
		which prevents the system on-screen keyboard from covering the text.
		love.keyboard.setTextInput( enable, x, y, w, h )
		just enabling it may be fine.
	]]
--love.keyboard.setTextInput(enable)


	math.randomseed(os.time())
	npcAction = math.random(10)

	round = 0
	
	npcMiss=0
	npcScore=0
	playerScore=0
	playerMiss=0
	
	
	--[[
	  Use last action and round for a key value
	of game rounds logs for actionlog  
	]]
	
	
	lastAction={"Score","Miss"}
	acionLog={}



--[[
	      Objects
	]]


-- Buttons

	buttonA=Button.new("Attack",200,300,200,100,false)
	buttonD=Button.new("Defend",475,300,200,100,false)


-- Player
	player=Player.new()

-- NPC
	npc=Npc.new()

--[[	Object test console output
	
	print(buttonA.title,buttonA.posX,buttonA.posY,buttonA.sizeX,buttonA.sizeY,buttonA.state)
	print(buttonD.title)
	print(player.name,player.life,player.attack,player.defend,player.str,player.dex)
	print(npc.name,npc.life,npc.attack,npc.defend,npc.str,npc.dex,npc.friend)
]]



end
--[[
           Mouse Press / Screen Tap
	]]
function love.mousepressed(x, y)

	if x > buttonA.posX and x < buttonA.posX+buttonA.sizeX and 
       y > buttonA.posY and y < buttonA.posY+buttonA.sizeY then
		buttonA.state = true
		round=round+1
	elseif x > buttonD.posX and x < buttonD.posX+buttonD.sizeX and 
           y > buttonD.posY and y < buttonD.posY+buttonD.sizeY then
		buttonD.state = true
		round=round+1
	end

end
--[[
	Update
		This function update every frame per sec
		typical frame rate is 60
		This function runs 60 times in 1 minute
		
		All Play combos:
		-	Player Attack -> NPC Attack
		-	Player Defend -> NPC Attack
		-	Player Attack -> NPC Defend
		-	Player Defend -> NPC Defend
		
		
		math for damage:
		attack - 1 = attackb
		attackb - attack = total amount dmg
		
]]
function love.update()
	if buttonA.state and npcAction%2 == 1 then
	    npcMiss=npcMiss+1 -- Player Attack -> NPC Defend
		buttonA.state = false
		npcAction = math.random(10)
	elseif buttonD.state and npcAction%2 == 0 then
		npcScore = npcScore + 1 -- Player Defend -> NPC Attack
		buttonD.state = false
		npcAction = math.random(10)
	end
	
	if buttonA.state and npcAction%2 == 0 then
		playerScore = playerScore+1 -- Player Attack -> NPC Attack       
		buttonA.state = false
		npcAction = math.random(10)
	elseif buttonD.state and npcAction%2 == 1 then
		playerMiss=playerMiss+1  -- Player Defend -> NPC Defend
		buttonD.state = false
		npcAction = math.random(10)
	end

--[[
		Putting this line of code
		will randomize every second.
	     target=math.random(10)
	]]
--[[
	Counts Rounds
	]]

	if round==10 then
		os.exit()
	end
	
end

--[[
	Draw
]]
function love.draw()
-- Button Layer

-- Attack Button
	love.graphics.setColor(0,255,0)
	love.graphics.rectangle("fill",buttonA.posX,buttonA.posY,buttonA.sizeX,buttonA.sizeY)
	love.graphics.setColor(255,255,255)

-- Defend Button
	love.graphics.setColor(255,0,0)
	love.graphics.rectangle("fill",buttonD.posX,buttonD.posY,buttonD.sizeX,buttonD.sizeY)
	love.graphics.setColor(255,255,255)

-- Text Layer

-- Button Text
	love.graphics.setColor(0,0,0)
	love.graphics.print(buttonA.title,285,340)
	love.graphics.print(buttonD.title,550,340)
	love.graphics.setColor(255,255,255)

-- UI
	love.graphics.print("Round:\t"..round,350,40)
	love.graphics.print(player.name,250,100)
	love.graphics.print("life:\t"..player.life,250,115)
--	love.graphics.print("str:\t"..player.str,250,130)
--	love.graphics.print("dex:\t"..player.dex,250,145)
	love.graphics.print("VS.",400,100)
	love.graphics.print(npc.name,500,100)
	love.graphics.print("life:\t"..npc.life,500,115)
end


