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


TextureCRC = 2070369940
CrowdTexture = {}
Frame = 0
Frames = 9

function DeviceCreatedCallback()
	Frame = 0 
	for I=0,Frames-1 do
		CrowdTexture[I] = {}
		CrowdTexture[I].Generic = Launcher.Texture.Load("launcher\\media\\textures\\upper crowd\\generic\\"..(I+1)..".png")
	end
	for I=0,Frames-1 do
		CrowdTexture[I].Goal = Launcher.Texture.Load("launcher\\media\\textures\\upper crowd\\goal\\"..(I+1)..".png")
	end
	Timer = Launcher.Timer.SetTimeout(150,CrowdTimer)
end

function CrowdTimer()
	local Timeout
    if Timer ~= nil then
        if not Launcher.Game.Paused() or Launcher.Game.InReplay() then
            if Launcher.Game.InReplay() then 
                Frame = math.floor(Launcher.Replay.Frame() / 6) % Frames
                Timeout = 1
            elseif Launcher.Game.InCutscene() then
                Frame = Frame + 1
                if Frame > Frames - 1 then
                    Frame = 0
                end
            else
                Launcher.Timer.SetTimeout(250,CrowdTimer)
                return
            end
            if Launcher.Game.AwaySiren() then
                Timeout = 200
                Launcher.Texture.Inject(CrowdTexture[Frame].Goal,0,TextureCRC)
            else
                Timeout = 250
                Launcher.Texture.Inject(CrowdTexture[Frame].Generic,0,TextureCRC)
            end
        else
            Timeout = 200
        end
        Timer = Launcher.Timer.SetTimeout(Timeout,CrowdTimer)
    end
end
function DeviceReleasedCallback()
	Timer = nil
end


Launcher.Callback.Register("DeviceCreated",DeviceCreatedCallback)
Launcher.Callback.Register("DeviceReleased",DeviceReleasedCallback)