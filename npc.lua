--[[
	Player Ojbect
]]

function Npc(name,life,attack,defend,str,dex,friend)
	return {
		name = name or "Nemesis",
	life = 10,
	attack = 10,
	defend = 10,
	str = 10,
	dex = 10,
	friend=false
	}
end