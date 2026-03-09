-- ABBA Dance Experience - Shared color definitions
-- Use these throughout the theme for consistency

ABBA = {
	Colors = {
		Gold       = color("#FFD700"),
		GoldDark   = color("#B8960F"),
		GoldLight  = color("#FFE44D"),
		Blue       = color("#1B3A8C"),
		BlueDark   = color("#0A1A4A"),
		BlueLight  = color("#2E5BBF"),
		White      = color("#FFFFFF"),
		Silver     = color("#C0C0C0"),
		Disco      = color("#E91E8C"),
		DiscoLight = color("#FF69B4"),
	},

	-- Helper to get a random disco color for particle effects
	RandomDiscoColor = function()
		local colors = {
			color("#FFD700"),
			color("#FF69B4"),
			color("#00BFFF"),
			color("#FFFFFF"),
			color("#E91E8C"),
			color("#C0C0C0"),
		}
		return colors[math.random(#colors)]
	end,
}
