--[[
	Player Ojbect
]]

Player={}
Player.__index=Player

function Player.new(name,life,attack,defend,str,dex)
	local self=setmetatable({},Player)
	self.name=name or "Hero"
	self.life = life or 10
	self.attack = attack or 10
	self.defend = defend or 10
	self.str = str or 10
	self.dex = dex or 10
	return self
end