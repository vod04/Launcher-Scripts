--[[
    This program is free software: you can redistribute it and/or modify
    it under the terms of the GNU General Public License as published by
    the Free Software Foundation, either version 3 of the License, or
    (at your option) any later version.

    This program is distributed in the hope that it will be useful,
    but WITHOUT ANY WARRANTY; without even the implied warranty of
    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
    GNU General Public License for more details.

    You should have received a copy of the GNU General Public License
    along with this program.  If not, see <http://www.gnu.org/licenses/>.
--]]


Padding = 3
FontFamily = "Georgia"
FontColor = 0xFFCCEEFF
FontSize = 16
FontWeight = 600
BGAlpha = 0xBB000000

-- ***********************
Frames = 0
FrameRate = 0
FrameRateTotal= 0 
TotalFrames = 0
FrameRateCount = 0
FrameRateAVG = 0
Precision = Launcher.Config.Int("fpsprecision",0)
UpdateRate = Launcher.Config.Int("fpsupdate",0)
Padding2 = Padding * 2
Text = ""
function DeviceCreatedCallback()
	Frames = 0
	FrameRate = 0
	FrameTimer = 0
	TotalFrames = 0
    FrameRateAVG = 0
	FrameRateCount = 0
	FrameRateTotal = 0
	PrevTime = nil
	Text = ""
	FPSFont = Launcher.Font.Load(FontFamily,FontSize,FontWeight)
	BGSprite = Launcher.Sprite.Load("launcher\\media\\textures\\shared\\BlackBG.png")
    FrameTimer = Launcher.System.Time() + 1000	
	if BGSprite ~= nil then
		Launcher.Callback.Register("Render",RenderCallback)
	end
end
function round(num, idp)
  return string.format("%." .. (idp or 0) .. "f", num)
end
function RenderCallback()
	local X, Y 
	if Precision == 1 then
		Frames = Frames + 1
		TotalFrames = TotalFrames + 1
	else
		Time = Launcher.System.Time(2)
		if PrevTime ~= nil then
			Delta = (Time - PrevTime) / 1000000
			FrameRate = 1/Delta
			FrameRateTotal = FrameRateTotal + FrameRate
			FrameRateCount = FrameRateCount + 1
			FrameRateAVG = FrameRateTotal/FrameRateCount
			if UpdateRate == 2 then
				Text = round(FrameRate,2).." | "..round(FrameRateAVG,2)
			end
		end
		PrevTime = Time
	end
	if Launcher.System.Time() >= FrameTimer then
		if Precision == 1 then
			FrameRate = Frames
			FrameRateTotal = FrameRateTotal + FrameRate
			FrameRateCount = FrameRateCount + 1
			FrameRateAVG = FrameRateTotal/FrameRateCount
			Frames = 0
			Text = FrameRate.." | "..round(FrameRateAVG,2)
		else
			Text = round(FrameRate,2).." | "..round(FrameRateAVG,2)
		end
		FrameTimer = Launcher.System.Time() + 1000	
	end

	Width = Launcher.Font.TextWidth(FPSFont,Text)
	Height = Launcher.Font.TextHeight(FPSFont,Text)
	X = Launcher.Screen.Width() - Width
	Y = Launcher.Screen.Height() - Height
	Launcher.Sprite.Resize(BGSprite,Width + Padding2,Height + Padding2)
	Launcher.Sprite.Draw(BGSprite, X - Padding2, Y - Padding2, 0, BGAlpha)
	Launcher.Font.DrawText(FPSFont, Text, X-Padding, Y-Padding, FontColor)
end

	

if Launcher.Config.Bool("drawfps",false) then
	Launcher.Callback.Register("DeviceCreated",DeviceCreatedCallback)
end


