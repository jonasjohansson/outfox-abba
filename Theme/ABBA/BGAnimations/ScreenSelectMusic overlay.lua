-- ABBA Dance Experience - Song Select Screen
-- Shows album art, song info, and disco-styled UI

local goldColor = color("#FFD700")
local goldDark = color("#B8960F")
local blueColor = color("#1B3A8C")
local blueDark = color("#0A1A4A")
local blueLight = color("#2E5BBF")
local whiteColor = color("#FFFFFF")
local pinkColor = color("#E91E8C")

return Def.ActorFrame{
	-- Background gradient
	Def.Quad{
		OnCommand=function(self)
			self:Center()
				:zoomto(SCREEN_WIDTH, SCREEN_HEIGHT)
				:diffusetopedge(blueDark)
				:diffusebottomedge(color("#050D2A"))
		end,
	},

	-- Left panel background (song info area)
	Def.Quad{
		OnCommand=function(self)
			self:halign(0):valign(0)
				:zoomto(SCREEN_WIDTH * 0.45, SCREEN_HEIGHT)
				:diffuse(color("#00000066"))
		end,
	},

	-- Top bar
	Def.Quad{
		OnCommand=function(self)
			self:halign(0):valign(0)
				:zoomto(SCREEN_WIDTH, 50)
				:diffuse(blueColor):diffusealpha(0.9)
		end,
	},

	-- Gold accent line under top bar
	Def.Quad{
		OnCommand=function(self)
			self:halign(0):valign(0):xy(0, 50)
				:zoomto(SCREEN_WIDTH, 3)
				:diffuse(goldColor)
		end,
	},

	-- Header text
	Def.BitmapText{
		Font="Common Normal",
		Text="CHOOSE YOUR SONG",
		OnCommand=function(self)
			self:Center():y(25)
				:zoom(0.9)
				:diffuse(goldColor)
				:shadowlength(1)
		end,
	},

	-- ABBA logo top-left
	Def.BitmapText{
		Font="Common Normal",
		Text="ABBA",
		OnCommand=function(self)
			self:halign(0):xy(15, 25)
				:zoom(0.7)
				:diffuse(goldColor)
		end,
	},

	-- Album art / Banner display
	Def.Sprite{
		OnCommand=function(self)
			self:xy(SCREEN_WIDTH * 0.22, SCREEN_CENTER_Y - 60)
				:diffusealpha(0):decelerate(0.3):diffusealpha(1)
				:playcommand("Set")
		end,
		CurrentSongChangedMessageCommand=function(self) self:playcommand("Set") end,
		SetCommand=function(self)
			local song = GAMESTATE:GetCurrentSong()
			if song then
				if song:HasBackground() then
					self:Load(song:GetBackgroundPath())
				elseif song:HasBanner() then
					self:Load(song:GetBannerPath())
				else
					self:visible(false)
					return
				end
				self:visible(true)
				-- Scale to fit in a box
				local maxW = SCREEN_WIDTH * 0.38
				local maxH = SCREEN_HEIGHT * 0.45
				local w = self:GetWidth()
				local h = self:GetHeight()
				if w > 0 and h > 0 then
					local scale = math.min(maxW / w, maxH / h)
					self:zoomto(w * scale, h * scale)
				end
			else
				self:visible(false)
			end
		end,
	},

	-- Song title display
	Def.BitmapText{
		Font="Common Normal",
		OnCommand=function(self)
			self:xy(SCREEN_WIDTH * 0.22, SCREEN_CENTER_Y + 140)
				:zoom(1.1)
				:diffuse(goldColor)
				:shadowlength(1)
				:maxwidth(350)
				:playcommand("Set")
		end,
		CurrentSongChangedMessageCommand=function(self) self:playcommand("Set") end,
		SetCommand=function(self)
			local song = GAMESTATE:GetCurrentSong()
			if song then
				self:settext(song:GetDisplayMainTitle())
			else
				self:settext("")
			end
		end,
	},

	-- Artist display
	Def.BitmapText{
		Font="Common Normal",
		OnCommand=function(self)
			self:xy(SCREEN_WIDTH * 0.22, SCREEN_CENTER_Y + 170)
				:zoom(0.65)
				:diffuse(whiteColor)
				:diffusealpha(0.8)
				:maxwidth(400)
				:playcommand("Set")
		end,
		CurrentSongChangedMessageCommand=function(self) self:playcommand("Set") end,
		SetCommand=function(self)
			local song = GAMESTATE:GetCurrentSong()
			if song then
				self:settext(song:GetDisplayArtist())
			else
				self:settext("")
			end
		end,
	},

	-- BPM display
	Def.BitmapText{
		Font="Common Normal",
		OnCommand=function(self)
			self:xy(SCREEN_WIDTH * 0.22, SCREEN_CENTER_Y + 200)
				:zoom(0.55)
				:diffuse(pinkColor)
				:playcommand("Set")
		end,
		CurrentSongChangedMessageCommand=function(self) self:playcommand("Set") end,
		SetCommand=function(self)
			local song = GAMESTATE:GetCurrentSong()
			if song then
				local bpms = song:GetDisplayBpms()
				if bpms[1] == bpms[2] then
					self:settext(string.format("%.0f BPM", bpms[1]))
				else
					self:settext(string.format("%.0f-%.0f BPM", bpms[1], bpms[2]))
				end
			else
				self:settext("")
			end
		end,
	},

	-- Song length display
	Def.BitmapText{
		Font="Common Normal",
		OnCommand=function(self)
			self:xy(SCREEN_WIDTH * 0.22, SCREEN_CENTER_Y + 225)
				:zoom(0.5)
				:diffuse(whiteColor)
				:diffusealpha(0.5)
				:playcommand("Set")
		end,
		CurrentSongChangedMessageCommand=function(self) self:playcommand("Set") end,
		SetCommand=function(self)
			local song = GAMESTATE:GetCurrentSong()
			if song then
				local len = song:MusicLengthSeconds()
				self:settext(string.format("%d:%02d", math.floor(len/60), len%60))
			else
				self:settext("")
			end
		end,
	},

	-- Bottom bar
	Def.Quad{
		OnCommand=function(self)
			self:halign(0):valign(1):xy(0, SCREEN_HEIGHT)
				:zoomto(SCREEN_WIDTH, 45)
				:diffuse(blueColor):diffusealpha(0.9)
		end,
	},

	-- Gold accent line above bottom bar
	Def.Quad{
		OnCommand=function(self)
			self:halign(0):valign(1):xy(0, SCREEN_HEIGHT - 45)
				:zoomto(SCREEN_WIDTH, 2)
				:diffuse(goldColor):diffusealpha(0.6)
		end,
	},

	-- Bottom hint text
	Def.BitmapText{
		Font="Common Normal",
		Text="Use arrows to browse \xC2\xB7 Press START to play",
		OnCommand=function(self)
			self:Center():y(SCREEN_HEIGHT - 22)
				:zoom(0.45)
				:diffuse(whiteColor):diffusealpha(0.7)
		end,
	},

	-- Decorative shimmer particles
	Def.Quad{
		OnCommand=function(self)
			self:xy(SCREEN_WIDTH * 0.1, SCREEN_HEIGHT * 0.3)
				:zoomto(3,3):diffuse(goldColor):diffusealpha(0.4)
				:queuecommand("Shimmer")
		end,
		ShimmerCommand=function(self)
			self:linear(2):diffusealpha(0.1):linear(2):diffusealpha(0.5)
				:queuecommand("Shimmer")
		end,
	},
	Def.Quad{
		OnCommand=function(self)
			self:xy(SCREEN_WIDTH * 0.35, SCREEN_HEIGHT * 0.15)
				:zoomto(2,2):diffuse(whiteColor):diffusealpha(0.3)
				:sleep(0.7):queuecommand("Shimmer")
		end,
		ShimmerCommand=function(self)
			self:linear(1.5):diffusealpha(0.1):linear(1.5):diffusealpha(0.4)
				:queuecommand("Shimmer")
		end,
	},
}
