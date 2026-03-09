-- ABBA Dance Experience - Title Screen
-- Disco-inspired title menu with gold/blue aesthetics

local goldColor = color("#FFD700")
local blueColor = color("#1B3A8C")
local whiteColor = color("#FFFFFF")

return Def.ActorFrame{
	-- Background gradient
	Def.Quad{
		OnCommand=function(self)
			self:Center()
				:zoomto(SCREEN_WIDTH, SCREEN_HEIGHT)
				:diffusetopedge(blueColor)
				:diffusebottomedge(color("#0A1A4A"))
		end,
	},

	-- Disco ball shimmer effect (subtle animated quads)
	Def.ActorFrame{
		OnCommand=function(self) self:Center() end,
		-- Shimmer particles
		Def.Quad{
			OnCommand=function(self)
				self:xy(-200, -100):zoomto(4,4):diffuse(goldColor):diffusealpha(0.6)
					:queuecommand("Shimmer")
			end,
			ShimmerCommand=function(self)
				self:linear(2):diffusealpha(0.2):linear(2):diffusealpha(0.8)
					:queuecommand("Shimmer")
			end,
		},
		Def.Quad{
			OnCommand=function(self)
				self:xy(150, -150):zoomto(3,3):diffuse(whiteColor):diffusealpha(0.4)
					:sleep(0.5):queuecommand("Shimmer")
			end,
			ShimmerCommand=function(self)
				self:linear(1.5):diffusealpha(0.1):linear(1.5):diffusealpha(0.6)
					:queuecommand("Shimmer")
			end,
		},
		Def.Quad{
			OnCommand=function(self)
				self:xy(80, -80):zoomto(5,5):diffuse(goldColor):diffusealpha(0.3)
					:sleep(1):queuecommand("Shimmer")
			end,
			ShimmerCommand=function(self)
				self:linear(3):diffusealpha(0.7):linear(3):diffusealpha(0.1)
					:queuecommand("Shimmer")
			end,
		},
	},

	-- Title text: ABBA
	Def.BitmapText{
		Font="Common Normal",
		Text="ABBA",
		OnCommand=function(self)
			self:Center():y(SCREEN_CENTER_Y - 120)
				:zoom(3)
				:diffuse(goldColor)
				:shadowlength(2)
				:diffusealpha(0):sleep(0.5):linear(1):diffusealpha(1)
		end,
	},

	-- Subtitle
	Def.BitmapText{
		Font="Common Normal",
		Text="DANCE EXPERIENCE",
		OnCommand=function(self)
			self:Center():y(SCREEN_CENTER_Y - 60)
				:zoom(1.2)
				:diffuse(whiteColor)
				:diffusealpha(0):sleep(1):linear(0.8):diffusealpha(0.9)
		end,
	},

	-- Decorative line
	Def.Quad{
		OnCommand=function(self)
			self:Center():y(SCREEN_CENTER_Y - 30)
				:zoomto(0, 2):diffuse(goldColor)
				:sleep(1.5):linear(0.6):zoomto(300, 2)
		end,
	},

	-- Menu hint
	Def.BitmapText{
		Font="Common Normal",
		Text="Press START",
		OnCommand=function(self)
			self:Center():y(SCREEN_CENTER_Y + 100)
				:zoom(0.8)
				:diffuse(whiteColor)
				:diffusealpha(0):sleep(2):linear(0.5):diffusealpha(0.7)
				:queuecommand("Pulse")
		end,
		PulseCommand=function(self)
			self:linear(1):diffusealpha(0.3):linear(1):diffusealpha(0.7)
				:queuecommand("Pulse")
		end,
	},

	-- Bottom credit
	Def.BitmapText{
		Font="Common Normal",
		Text="A tribute to the music of ABBA",
		OnCommand=function(self)
			self:Center():y(SCREEN_HEIGHT - 30)
				:zoom(0.5)
				:diffuse(whiteColor)
				:diffusealpha(0.4)
		end,
	},
}
