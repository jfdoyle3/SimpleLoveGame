--[[
	Button Ojbect
]]

Button={}
Button.__index=Button


function Button.new(title,posX,posY,sizeX,sizeY,state)
	local self=setmetatable({},Button)
	
	self.title=title or "Button"
		self.sizeX=sizeX
		self.sizeY=sizeY
		self.posX=posX
		self.posY=posY
		self.state = statereturn or false
	return self
end