-- ABBA Dance Experience - Attract Mode Demo Overlay
-- Shows song info while auto-playing demo

local goldColor = color("#FFD700")
local whiteColor = color("#FFFFFF")

return Def.ActorFrame{
	-- Semi-transparent bar at bottom
	Def.Quad{
		OnCommand=function(self)
			self:halign(0):valign(1):xy(0, SCREEN_HEIGHT)
				:zoomto(SCREEN_WIDTH, 70)
				:diffuse(color("#000000")):diffusealpha(0.7)
		end,
	},

	-- Gold accent line
	Def.Quad{
		OnCommand=function(self)
			self:halign(0):valign(1):xy(0, SCREEN_HEIGHT - 70)
				:zoomto(SCREEN_WIDTH, 2)
				:diffuse(goldColor):diffusealpha(0.6)
		end,
	},

	-- ABBA logo
	Def.BitmapText{
		Font="Common Normal",
		Text="ABBA",
		OnCommand=function(self)
			self:halign(0):xy(20, SCREEN_HEIGHT - 50)
				:zoom(0.9)
				:diffuse(goldColor)
				:diffusealpha(0):sleep(1):linear(0.5):diffusealpha(1)
		end,
	},

	-- Song title
	Def.BitmapText{
		Font="Common Normal",
		OnCommand=function(self)
			self:halign(0):xy(100, SCREEN_HEIGHT - 50)
				:zoom(0.7)
				:diffuse(whiteColor)
				:maxwidth(500)
				:diffusealpha(0):sleep(1.5):linear(0.5):diffusealpha(1)
				:playcommand("Set")
		end,
		CurrentSongChangedMessageCommand=function(self) self:playcommand("Set") end,
		SetCommand=function(self)
			local song = GAMESTATE:GetCurrentSong()
			if song then
				self:settext(song:GetDisplayMainTitle())
			end
		end,
	},

	-- "Press START to play" hint
	Def.BitmapText{
		Font="Common Normal",
		Text="Press START to play",
		OnCommand=function(self)
			self:xy(SCREEN_WIDTH - 120, SCREEN_HEIGHT - 35)
				:zoom(0.5)
				:diffuse(goldColor)
				:diffusealpha(0):sleep(2):linear(0.5):diffusealpha(0.8)
				:queuecommand("Pulse")
		end,
		PulseCommand=function(self)
			self:linear(1):diffusealpha(0.3):linear(1):diffusealpha(0.8)
				:queuecommand("Pulse")
		end,
	},

	-- "DANCE EXPERIENCE" top corner
	Def.BitmapText{
		Font="Common Normal",
		Text="ABBA DANCE EXPERIENCE",
		OnCommand=function(self)
			self:halign(1):xy(SCREEN_WIDTH - 15, 20)
				:zoom(0.45)
				:diffuse(goldColor)
				:diffusealpha(0.5)
		end,
	},
}
