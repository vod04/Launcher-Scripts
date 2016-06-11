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


Frame = 0
FrameTimer = 0
Teams = {}
Teams[6] = {}
Teams[6].Frames = 16
Teams[6].AnimationFPS = 3
Teams[6].Texture = {}
Teams[6].CRC = {}
Teams[6].CRC[0] = 1880723064
Teams[6].CRC[1] = 1806384399
Teams[6].CRC[2] = 1659566488
Teams[6].CRC[3] = 1130882918

function DeviceCreatedCallback()
	Team = Launcher.Game.HomeTeamID()
    HomeAbbreviation = Launcher.Game.HomeNameAbbreviation()
	Frame = 0
	if Teams[Team] ~= nil then
		for I = 0,Teams[Team].Frames-1 do
			Teams[Team].Texture[I] = Launcher.Texture.Load("launcher\\media\\textures\\upper ads\\"..HomeAbbreviation.."\\"..(I)..".png")
		end
		Frame = 0
		for I = 0, #Teams[Team].CRC do
			Launcher.Texture.Inject(Teams[Team].Texture[Frame],0,Teams[Team].CRC[I])
		end
		FrameTimer = Launcher.System.Time() + 60
		Launcher.Callback.Register("Tick",TickCallback)
	end
end
function TickCallback()
    if Launcher.Game.InReplay() then
        Frame = math.floor(Launcher.Replay.Frame() / (5 / Teams[Team].AnimationFPS)) % Teams[Team].Frames
        for I = 0, #Teams[Team].CRC do
            Launcher.Texture.Inject(Teams[Team].Texture[Frame],0,Teams[Team].CRC[I])
        end
    elseif Launcher.Game.InCutscene() then
        if not Launcher.Game.Paused() then
            if Launcher.System.Time() >= FrameTimer then
                Frame = Frame + 1
                if Frame >= Teams[Team].Frames then
                    Frame = 0
                end
                for I = 0, #Teams[Team].CRC do
                    Launcher.Texture.Inject(Teams[Team].Texture[Frame],0,Teams[Team].CRC[I])
                end
                FrameTimer = Launcher.System.Time() + 60
            end
        end
    end
end
function DeviceReleasedCallback()
	Launcher.Callback.Remove("Tick")
end


Launcher.Callback.Register("DeviceCreated",DeviceCreatedCallback)
Launcher.Callback.Register("DeviceReleased",DeviceReleasedCallback)