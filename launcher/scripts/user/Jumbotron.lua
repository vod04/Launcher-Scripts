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


FrameTexture = {}
Teams = {}
Teams[27] = {}
Teams[27].Frames = 720
Teams[27].AnimationFPS = 23.976
Teams[27].Texture = "VIDA"

BASS_DX8_I3DL2REVERB_lRoom = 0
BASS_DX8_I3DL2REVERB_lRoomHF = -100
BASS_DX8_I3DL2REVERB_flRoomRolloffFactor = 0
BASS_DX8_I3DL2REVERB_flDecayTime = 2.49
BASS_DX8_I3DL2REVERB_flDecayHFRatio = 0.83
BASS_DX8_I3DL2REVERB_lReflections = -2602
BASS_DX8_I3DL2REVERB_flReflectionsDelay = 0.007
BASS_DX8_I3DL2REVERB_lReverb = 250
BASS_DX8_I3DL2REVERB_flReverbDelay = 0.011
BASS_DX8_I3DL2REVERB_flDiffusion = 100
BASS_DX8_I3DL2REVERB_flDensity = 100
BASS_DX8_I3DL2REVERB_flHFReference = 5000
Volume = 0.9
Stream = nil
PlayVideo = false
FPSTimer = 0
Team = 0
Frame = 0
function DeviceCreatedCallback()
	local Path
	Team = Launcher.Game.HomeTeamID()
    HomeAbbreviation = Launcher.Game.HomeNameAbbreviation()
	Path = "launcher\\media\\textures\\jumbotron\\"..HomeAbbreviation.."\\"
	if Launcher.Filesystem.DirectoryExists(Path) then--and Teams[Team] ~= nil then
		for i = 1,Teams[Team].Frames do
			FrameTexture[i-1] = Launcher.Texture.Load(Path..(i)..".jpg")
		end
		Stream = Launcher.Sound.Load(Path.."track.mp3",false)
		if Stream ~= nil then
			Launcher.Sound.SetReverb(Stream,BASS_DX8_I3DL2REVERB_lRoom,BASS_DX8_I3DL2REVERB_lRoomHF,BASS_DX8_I3DL2REVERB_flRoomRolloffFactor,BASS_DX8_I3DL2REVERB_flDecayTime,BASS_DX8_I3DL2REVERB_flDecayHFRatio,BASS_DX8_I3DL2REVERB_lReflections,BASS_DX8_I3DL2REVERB_flReflectionsDelay,BASS_DX8_I3DL2REVERB_lReverb,BASS_DX8_I3DL2REVERB_flReverbDelay,BASS_DX8_I3DL2REVERB_flDiffusion,BASS_DX8_I3DL2REVERB_flDensity,BASS_DX8_I3DL2REVERB_flHFReference)
		end
		Frame = 0
		Launcher.Texture.Inject(FrameTexture[Frame],Teams[Team].Texture)
		Launcher.Callback.Register("Tick",TickCallback)
	end
end
function TickCallback()
    local Time, Delta
	if not Launcher.Game.InReplay() then 
		if PlayVideo then
			PlayVideo = false
			if Stream ~= nil then
				Launcher.Sound.Stop(Stream)
			end
			Frame = 0
			Launcher.Texture.Inject(FrameTexture[Frame],Teams[Team].Texture)
		end
	else 
		if Launcher.Input.KeyPressed(VK_I) then
			PlayVideo = true
			Frame = 0
			if Stream ~= nil then
				Launcher.Sound.Stop(Stream)
			end
            Launcher.Sound.SetVolume(Stream,Volume)
            Launcher.Sound.Play(Stream,1)
			Launcher.Texture.Inject(FrameTexture[Frame],Teams[Team].Texture)
			FPSTimer = Launcher.System.Time(2)
		end

		if PlayVideo then
			Time = Launcher.System.Time(2)
			Delta = (Time - FPSTimer) / 1000000
			FPSTimer = Time
			Multi = Teams[Team].AnimationFPS * Delta
			Frame = Frame + 1*Multi
			if Frame >= Teams[Team].Frames then
				Frame = Teams[Team].Frames - 1
				PlayVideo = 0
			end
			Launcher.Texture.Inject(FrameTexture[math.floor(Frame)],Teams[Team].Texture)
		end
	end
end
function DeviceReleasedCallback()
	Launcher.Callback.Remove("Render")
	if Stream ~= nil then
		Launcher.Sound.Release(Stream)
		Stream = nil
	end
end
Launcher.Callback.Register("DeviceCreated",DeviceCreatedCallback)
Launcher.Callback.Register("DeviceReleased",DeviceReleasedCallback)
