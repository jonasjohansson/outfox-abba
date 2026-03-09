-- ABBA Dance Experience - Title Screen
-- Disco-inspired title menu with gold/blue aesthetics and particle effects

local goldColor = color("#FFD700")
local blueColor = color("#1B3A8C")
local whiteColor = color("#FFFFFF")
local pinkColor = color("#E91E8C")

-- Helper to create a shimmer particle
local function ShimmerParticle(x, y, size, clr, alpha, delay, speed)
	return Def.Quad{
		OnCommand=function(self)
			self:xy(x, y):zoomto(size, size):diffuse(clr):diffusealpha(0)
				:sleep(delay):linear(0.3):diffusealpha(alpha)
				:queuecommand("Shimmer")
		end,
		ShimmerCommand=function(self)
			self:linear(speed):diffusealpha(alpha * 0.15)
				:linear(speed):diffusealpha(alpha)
				:queuecommand("Shimmer")
		end,
	}
end

-- Helper for a drifting particle (moves slowly)
local function DriftParticle(x, y, size, clr, alpha, delay, driftX, driftY, speed)
	return Def.Quad{
		OnCommand=function(self)
			self:xy(x, y):zoomto(size, size):diffuse(clr):diffusealpha(0)
				:rotationz(45)
				:sleep(delay):linear(0.5):diffusealpha(alpha)
				:queuecommand("Drift")
		end,
		DriftCommand=function(self)
			self:linear(speed):addx(driftX):addy(driftY):diffusealpha(alpha * 0.2)
				:linear(speed):addx(-driftX):addy(-driftY):diffusealpha(alpha)
				:queuecommand("Drift")
		end,
	}
end

-- Rotating light sweep
local function LightSweep(y, alpha, speed, delay)
	return Def.Quad{
		OnCommand=function(self)
			self:Center():y(y)
				:zoomto(SCREEN_WIDTH * 1.5, 2)
				:diffuse(goldColor):diffusealpha(0)
				:sleep(delay):linear(0.3):diffusealpha(alpha)
				:queuecommand("Sweep")
		end,
		SweepCommand=function(self)
			self:rotationz(0):linear(speed):rotationz(360)
				:queuecommand("Sweep")
		end,
	}
end

local t = Def.ActorFrame{}

-- Background gradient
t[#t+1] = Def.Quad{
	OnCommand=function(self)
		self:Center()
			:zoomto(SCREEN_WIDTH, SCREEN_HEIGHT)
			:diffusetopedge(blueColor)
			:diffusebottomedge(color("#050D2A"))
	end,
}

-- Radial glow behind title
t[#t+1] = Def.Quad{
	OnCommand=function(self)
		self:Center():y(SCREEN_CENTER_Y - 100)
			:zoomto(500, 300)
			:diffuse(color("#1B3A8C"))
			:diffusealpha(0.3)
			:queuecommand("Pulse")
	end,
	PulseCommand=function(self)
		self:linear(3):diffusealpha(0.15)
			:linear(3):diffusealpha(0.3)
			:queuecommand("Pulse")
	end,
}

-- Disco light sweeps (subtle rotating lines)
t[#t+1] = Def.ActorFrame{
	OnCommand=function(self) self:Center():diffusealpha(0.08) end,
	LightSweep(0, 0.6, 8, 0),
	LightSweep(0, 0.4, 12, 2),
	LightSweep(0, 0.3, 6, 4),
}

-- Shimmer particle field - scattered across the screen
local particleData = {
	-- {x, y, size, color, alpha, delay, speed}
	{120, 80, 3, goldColor, 0.7, 0.0, 1.8},
	{300, 50, 2, whiteColor, 0.5, 0.3, 2.2},
	{500, 100, 4, goldColor, 0.6, 0.7, 1.5},
	{180, 200, 2, pinkColor, 0.4, 1.0, 2.0},
	{450, 180, 3, whiteColor, 0.5, 0.5, 1.7},
	{80, 350, 3, goldColor, 0.6, 1.2, 2.5},
	{350, 400, 2, pinkColor, 0.3, 0.8, 1.9},
	{550, 350, 4, goldColor, 0.7, 0.2, 2.1},
	{250, 300, 2, whiteColor, 0.4, 1.5, 1.6},
	{600, 250, 3, goldColor, 0.5, 0.6, 2.3},
	{50, 150, 2, whiteColor, 0.3, 1.1, 2.0},
	{400, 130, 3, pinkColor, 0.4, 0.4, 1.8},
	{150, 420, 2, goldColor, 0.5, 0.9, 2.4},
	{520, 420, 3, whiteColor, 0.4, 1.3, 1.7},
	{320, 250, 2, goldColor, 0.6, 0.1, 2.0},
}

for _, p in ipairs(particleData) do
	t[#t+1] = ShimmerParticle(p[1], p[2], p[3], p[4], p[5], p[6], p[7])
end

-- Drifting particles (slowly moving)
local driftData = {
	{100, 120, 2, goldColor, 0.4, 0.5, 10, -5, 4},
	{500, 300, 3, whiteColor, 0.3, 1.0, -8, 6, 5},
	{300, 400, 2, pinkColor, 0.3, 0.3, 12, -3, 6},
	{200, 60, 2, goldColor, 0.5, 0.8, -5, 8, 4.5},
	{450, 50, 2, whiteColor, 0.3, 1.2, 7, 4, 5.5},
}

for _, d in ipairs(driftData) do
	t[#t+1] = DriftParticle(d[1], d[2], d[3], d[4], d[5], d[6], d[7], d[8], d[9])
end

-- Gold horizontal accent lines (disco floor vibe)
for i = 1, 3 do
	local yOff = SCREEN_HEIGHT - 80 + (i - 1) * 15
	t[#t+1] = Def.Quad{
		OnCommand=function(self)
			self:Center():y(yOff)
				:zoomto(0, 1):diffuse(goldColor):diffusealpha(0.15 + i * 0.05)
				:sleep(1.5 + i * 0.3):linear(0.8):zoomto(SCREEN_WIDTH * (0.4 + i * 0.15), 1)
		end,
	}
end

-- Title text: ABBA
t[#t+1] = Def.BitmapText{
	Font="Common Normal",
	Text="ABBA",
	OnCommand=function(self)
		self:Center():y(SCREEN_CENTER_Y - 120)
			:zoom(3)
			:diffuse(goldColor)
			:shadowlength(2)
			:diffusealpha(0):sleep(0.5):linear(1):diffusealpha(1)
	end,
}

-- Subtitle
t[#t+1] = Def.BitmapText{
	Font="Common Normal",
	Text="DANCE EXPERIENCE",
	OnCommand=function(self)
		self:Center():y(SCREEN_CENTER_Y - 60)
			:zoom(1.2)
			:diffuse(whiteColor)
			:diffusealpha(0):sleep(1):linear(0.8):diffusealpha(0.9)
	end,
}

-- Decorative gold line
t[#t+1] = Def.Quad{
	OnCommand=function(self)
		self:Center():y(SCREEN_CENTER_Y - 30)
			:zoomto(0, 2):diffuse(goldColor)
			:sleep(1.5):linear(0.6):zoomto(300, 2)
	end,
}

-- Menu hint
t[#t+1] = Def.BitmapText{
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
}

-- Bottom credit
t[#t+1] = Def.BitmapText{
	Font="Common Normal",
	Text="A tribute to the music of ABBA",
	OnCommand=function(self)
		self:Center():y(SCREEN_HEIGHT - 30)
			:zoom(0.5)
			:diffuse(whiteColor)
			:diffusealpha(0.4)
	end,
}

return t
