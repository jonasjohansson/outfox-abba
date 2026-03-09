-- ABBA Dance Experience - Results/Evaluation Screen

local goldColor = color("#FFD700")
local blueColor = color("#1B3A8C")
local whiteColor = color("#FFFFFF")

return Def.ActorFrame{
	-- Background
	Def.Quad{
		OnCommand=function(self)
			self:Center()
				:zoomto(SCREEN_WIDTH, SCREEN_HEIGHT)
				:diffusetopedge(color("#0A1A4A"))
				:diffusebottomedge(blueColor)
		end,
	},

	-- Header
	Def.BitmapText{
		Font="Common Normal",
		Text="THANK YOU FOR THE MUSIC",
		OnCommand=function(self)
			self:Center():y(60)
				:zoom(1.5)
				:diffuse(goldColor)
				:diffusealpha(0):linear(0.8):diffusealpha(1)
		end,
	},

	-- Gold line
	Def.Quad{
		OnCommand=function(self)
			self:Center():y(90)
				:zoomto(0, 2):diffuse(goldColor)
				:sleep(0.5):linear(0.5):zoomto(400, 2)
		end,
	},
}
