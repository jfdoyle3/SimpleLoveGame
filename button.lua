--[[
	Button Ojbect
]]

function Button(title,sizeX,sizeY,posX,posY,state)
	return {
		title= title or "Button",
		sizeX=sizeX,
		sizeY=sizeY,
		posX=posX,
		posY=posY,
		state = state
	}

end