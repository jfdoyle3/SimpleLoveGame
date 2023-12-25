--[[
	Player Ojbect
]]

function Npc(name,life,attack,defend,str,dex,friend)
	return {
		name = name or "Nemesis",
	life = life or 10,
	attack = attack or 10,
	defend = defend or 10,
	str = str or 10,
	dex = dex or 10,
	friend=friend or false
	}
end