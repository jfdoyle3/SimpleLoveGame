--[[
      Simple Love Game
		Main Game Loop
	The game will continuously
	run these three functions until the
	game ends.
	run order:
		Load / Update / Draw
]]


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
	target = math.random(10)

	score = 0
	miss = 0
	round = 0

--[[
	      Objects
	]]

--Button Object
	Button={}
	Button.__index = Button




-- Player
	player = {}
	player.name = "Hero"
	player.life = 10
	player.attack = 10
	player.defend = 10
	player.str = 10
	player.dex = 10

-- NPC
	npc = {}
	npc.name = "Nemesis"
	npc.life = 10
	npc.attack = 10
	npc.defend = 10
	npc.str = 10
	npc.dex = 10


-- attack Object
	attack = {}
	attack.message = "Attack"
	attack.status = false
	attack.points = 5

-- defend Object
	defend = {}
	defend.message = "Defend"
	defend.status = false
	defend.points = 5
	
	buttonA=Button.new()

end

function Button.new(name)
	local instance=setmetatable({},Button)
	instance.name=name
	return instance
end

--[[
           Mouse Press
]]
function love.mousepressed(x, y)
--[[ Clickable area:
		Square: x > start and x < start+width , y > start and y < start+height
		 Circle: For a circle button at 20, 50 coordinates with 40 radius
			math.sqrt((20-x)^2+(50-y)^2) <= 40
	]]
	if x > 100 and x < 300 and y > 100 and y < 200 then
		attack.status = true
	elseif x > 400 and x < 600 and y > 100 and y < 200 then
		defend.status = true
	end

end
--[[
	Update
		This function update every frame per sec
		typical frame rate is 60
		This function runs 60 times in 1 minute
]]
function love.update()
	if attack.status and target%2 == 1 then
		miss = miss+1
		attack.status = false
	end
	if defend.status and target%2 == 0 then
		miss = miss+1
		defend.status = false
	end
	if attack.status and target%2 == 0 then
		score = score+1
		attack.status = false
		target = math.random(10)
	elseif defend.status and target%2 == 1 then
		score = score+1
		defend.status = false
		target = math.random(10)
	end

--[[
		Putting this line of code
		will randomize every second.
	     target=math.random(10)
	]]
--[[
	Counts Rounds
	round=round+1
	if round==10 then
		os.exit()
	end
	]]
end

--[[
	Draw
]]
function love.draw()
-- Button Layer

-- Attack Button
	love.graphics.setColor(0,255,0)
	love.graphics.rectangle("fill",200,300,200,100)
	love.graphics.setColor(255,255,255)

-- Defend Button
	love.graphics.setColor(255,0,0)
	love.graphics.rectangle("fill",475,300,200,100)
	love.graphics.setColor(255,255,255)

-- Text Layer

-- Button Text
	love.graphics.setColor(0,0,0)
	love.graphics.print(attack.message,285,340)
	love.graphics.print(defend.message,550,340)
	love.graphics.setColor(255,255,255)
--

	love.graphics.print("score:\t"..score,250,50)
	love.graphics.print("misses:\t"..miss,475,50)
--
	love.graphics.print(player.name,250,100)
	love.graphics.print("life:\t"..player.life,250,115)
	love.graphics.print("str:\t"..player.str,250,130)
	love.graphics.print("dex:\t"..player.dex,250,145)
	love.graphics.print("VS.",400,100)
	love.graphics.print(npc.name,500,100)
	love.graphics.print("life:\t"..npc.life,500,115)
end