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

Render = false
Text = ""
Padding2 = Padding * 2
function DeviceCreatedCallback()
	BGSprite = Launcher.Sprite.Load("launcher\\media\\textures\\BlackBG.png")	
	ShotFont = Launcher.Font.Load(FontFamily,FontSize, FontWeight)
	if BGSprite ~= nil then
		Launcher.Callback.Register("Render",RenderCallback)
	end
end
function Timeout()
	Render = false
end
function ShotCallback()
	Render = true
	Text = Launcher.Game.ShotSpeed()
	Launcher.Timer.SetTimeout(2500,Timeout)
end
function RenderCallback()
	local X, Y, Width, Height
	if Render then
		Width = Launcher.Font.TextWidth(ShotFont,Text)
		Height = Launcher.Font.TextHeight(ShotFont,Text)
		X = 0
		Y = Launcher.Screen.Height() - Height
		Launcher.Sprite.Resize(BGSprite,Width + Padding2, Height + Padding2)
		Launcher.Sprite.Draw(BGSprite, X, Y - Padding2, 0, 0xBB000000)
		Launcher.Font.DrawText(ShotFont, Text, X + Padding, Y - Padding, FontColor)
	end
end

Launcher.Callback.Register("ShotHome",ShotCallback)
Launcher.Callback.Register("ShotAway",ShotCallback)
Launcher.Callback.Register("DeviceCreated",DeviceCreatedCallback)