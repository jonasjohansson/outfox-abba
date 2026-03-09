-- ABBA Dance Experience - Song Select Screen
-- Custom overlay for the music selection wheel

local goldColor = color("#FFD700")
local blueColor = color("#1B3A8C")
local whiteColor = color("#FFFFFF")

return Def.ActorFrame{
	-- Background
	Def.Quad{
		OnCommand=function(self)
			self:Center()
				:zoomto(SCREEN_WIDTH, SCREEN_HEIGHT)
				:diffuse(color("#0A1A4A"))
		end,
	},

	-- Top bar
	Def.Quad{
		OnCommand=function(self)
			self:halign(0):valign(0)
				:zoomto(SCREEN_WIDTH, 60)
				:diffuse(blueColor)
		end,
	},

	-- Header text
	Def.BitmapText{
		Font="Common Normal",
		Text="SELECT YOUR SONG",
		OnCommand=function(self)
			self:Center():y(30)
				:zoom(1.0)
				:diffuse(goldColor)
		end,
	},

	-- Gold accent line under header
	Def.Quad{
		OnCommand=function(self)
			self:halign(0):valign(0):xy(0, 60)
				:zoomto(SCREEN_WIDTH, 3)
				:diffuse(goldColor)
		end,
	},

	-- Bottom info bar
	Def.Quad{
		OnCommand=function(self)
			self:halign(0):valign(1):xy(0, SCREEN_HEIGHT)
				:zoomto(SCREEN_WIDTH, 40)
				:diffuse(blueColor):diffusealpha(0.8)
		end,
	},

	-- Bottom hint
	Def.BitmapText{
		Font="Common Normal",
		Text="Use arrows to browse \u00b7 Press START to play",
		OnCommand=function(self)
			self:Center():y(SCREEN_HEIGHT - 20)
				:zoom(0.5)
				:diffuse(whiteColor):diffusealpha(0.7)
		end,
	},
}
