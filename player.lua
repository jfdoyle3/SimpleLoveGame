--[[
	Player Ojbect
]]

function Player(name,life,attack,defend,str,dex)
	return {
		name = name or "Hero",
	life = life or 10,
	attack = attack or 10,
	defend = defend or 10,
	str = str or 10,
	dex = dex or 10,
	}
end