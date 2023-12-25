--[[
	Button Ojbect
]]

function Button(title,posX,posY,sizeX,sizeY,state)
	return {
		title=title or "Button",
		sizeX=sizeX,
		sizeY=sizeY,
		posX=posX,
		posY=posY,
		state = state
	}
end