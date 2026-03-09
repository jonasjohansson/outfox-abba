-- ABBA Dance Experience - Gameplay Overlay
-- Minimal overlay to keep focus on the arrows/notes

local goldColor = color("#FFD700")

return Def.ActorFrame{
	-- Subtle top gradient for readability
	Def.Quad{
		OnCommand=function(self)
			self:halign(0):valign(0)
				:zoomto(SCREEN_WIDTH, 80)
				:diffusetopedge(color("#000000AA"))
				:diffusebottomedge(color("#00000000"))
		end,
	},

	-- Subtle bottom gradient
	Def.Quad{
		OnCommand=function(self)
			self:halign(0):valign(1):xy(0, SCREEN_HEIGHT)
				:zoomto(SCREEN_WIDTH, 60)
				:diffusebottomedge(color("#000000AA"))
				:diffusetopedge(color("#00000000"))
		end,
	},

	-- Small ABBA watermark
	Def.BitmapText{
		Font="Common Normal",
		Text="ABBA",
		OnCommand=function(self)
			self:xy(SCREEN_WIDTH - 50, 20)
				:zoom(0.4)
				:diffuse(goldColor)
				:diffusealpha(0.3)
		end,
	},
}
