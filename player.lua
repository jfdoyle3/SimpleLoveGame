--[[
	Player Ojbect
]]

function Player(name,life,attack,defend,str,dex)
	return {
		name = name or "Hero",
	life = 10,
	attack = 10,
	defend = 10,
	str = 10,
	dex = 10,
	}
end