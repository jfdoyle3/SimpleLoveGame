--[[
	NPC Ojbect
]]
Npc={}
Npc.__index=Npc

function Npc.new(name,life,attack,defend,str,dex)
	local self=setmetatable({},Npc)
	self.name=name or "Nemsis"
	self.life = life or 10
	self.attack = attack or 10
	self.defend = defend or 10
	self.str = str or 10
	self.dex = dex or 10
	return self
end