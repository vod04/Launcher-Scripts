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


--[[

    Events (* = No reverb):

    Interface*
    Loading*
    Intro
    Menu*
    Intermission*
    Goal Home
    Goal Away
    Play Stopped
    Puck over (Or Play Stopped if doesn't exist)
    Offside (Or Play Stopped if doesn't exist)
    Icing (Or Play Stopped if doesn't exist)
    Net Loose (Or Play Stopped if doesn't exist)
    Penalty Home
    Penalty Away
    Home Win
    Away Win
    Tie
    Fight
    Period Started
--]]

-- Options
MusicPath = "launcher\\media\\sound\\ditties\\"
ArenaVolume = 0.4  -- Volume range: 0.0 - 1.0
MenuVolume = 0.4
InterfaceVolume = 0.4
DisableReverb = false
IntroReverb = true
IntermissionReverb = false
MenuReverb = false
LoadingReverb = false
FadeOutTime = 1000
MenuRepeat = true
MenuMusicInReplay = false
PreloadDitties = true


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
  
  
  --[[

lRoom:               Attenuation of the room effect, in millibels (mB), in the range from -10000 to 0. The default value is -1000 mB.  
lRoomHF:             Attenuation of the room high-frequency effect, in mB, in the range from -10000 to 0. The default value is -100 mB.  
flRoomRolloffFactor: Rolloff factor for the reflected signals, in the range from 0 to 10. The default value is 0.0.  
flDecayTime:         Decay time, in seconds, in the range from 0.1 to 20. The default value is 1.49 seconds.  
flDecayHFRatio:      Ratio of the decay time at high frequencies to the decay time at low frequencies, in the range from 0.1 to 2. The default value is 0.83.  
lReflections:        Attenuation of early reflections relative to lRoom, in mB, in the range from -10000 to 1000. The default value is -2602 mB.  
flReflectionsDelay:  Delay time of the first reflection relative to the direct path, in seconds, in the range from 0 to 0.3. The default value is 0.007 seconds.  
lReverb:             Attenuation of late reverberation relative to lRoom, in mB, in the range from -10000 to 2000. The default value is 200 mB.  
flReverbDelay:       Time limit between the early reflections and the late reverberation relative to the time of the first reflection, in seconds, in the range from 0 to 0.1. The default value is 0.011 seconds.  
flDiffusion:         Echo density in the late reverberation decay, in percent, in the range from 0 to 100. The default value is 100.0 percent.  
flDensity:           Modal density in the late reverberation decay, in percent, in the range from 0 to 100. The default value is 100.0 percent.  
flHFReference:       Reference high frequency, in hertz, in the range from 20 to 20000. The default value is 5000.0 Hz.  

--]]
  
  
--***************

Preloaded = {}

function PlayInterfaceTimer()
    if InterfaceTimer ~= nil and Launcher.Sound.Loaded(InterfaceStream) then
        if Launcher.Sound.Status(InterfaceStream) == 0 then
            StopSong(InterfaceStream)
            InterfaceTimer = nil            
            PlayInterface()
            return
        end
        InterfaceTimer = Launcher.Timer.SetTimeout(1000,PlayInterfaceTimer)
    end
end
function PlayMenuTimer()
    if MenuTimer ~= nil and Launcher.Sound.Loaded(MenuStream) ~= nil then
        if Launcher.Sound.Status(MenuStream) == 0 then
            StopSong(MenuStream)
            MenuTimer = nil
            PlayMenu()
            return
        end
        MenuTimer = Launcher.Timer.SetTimeout(1000,PlayMenuTimer)
    end
end
function PlayMenu()
    if not Launcher.Game.Over() then
        local MenuSong, Reverb
        Reverb = false
        StopSong(MenuStream)
        MenuTimer = nil
        if Launcher.Sound.Loaded(Stream) then
            if Launcher.Sound.Status(Stream) == 1 then
                Launcher.Sound.Pause(Stream)
            else
                StopSong(Stream)
            end
        end
        if Launcher.Game.Time() == 0 then
            MenuSong = PickSong("Intermission")
            if MenuSong ~= nil and IntermissionReverb then
                Reverb = true
            end
        end
        if MenuSong == nil then
            MenuSong = PickSong("Menu")
            if MenuSong ~= nil and MenuReverb then
                Reverb = true
            end
        end
        if MenuSong ~= nil then
            MenuStream = PlaySong(MenuSong, Reverb, MenuVolume)
            if MenuStream ~= nil and MenuRepeat then
                MenuTimer = Launcher.Timer.SetTimeout(1000,PlayMenuTimer)
            end
        end
    end
end
function PlayInterface()
	local Song = PickSong("Interface")
	if Song ~= nil then
		InterfaceStream = PlaySong(Song, false, InterfaceVolume)
        if InterfaceStream ~= nil then
            InterfaceTimer = Launcher.Timer.SetTimeout(1000,PlayInterfaceTimer)
        end
	end
end
function QuitGameCallback()
	HomeAbbreviation = nil
    MenuTimer = nil

    StopSong(Stream)
    StopSong(MenuStream)

	PlayInterface()
end
function PreloadEvent(Event)
	local Dir, Size, Path, Filename, Abbrev
   
    
	if HomeAbbreviation ~= nil then
		Path = MusicPath..HomeAbbreviation.."\\".. Event.."\\"
		if not Launcher.Filesystem.DirectoryExists(Path) then
			Path = MusicPath.."ALL\\".. Event.."\\"
		end
        Abbrev = HomeAbbreviation
	else
        Abbrev = "ALL"
		Path = MusicPath.."ALL\\".. Event.."\\"
	end
	if Launcher.Filesystem.DirectoryExists(Path) then
        if Preloaded[Abbrev] == nil then
            Preloaded[Abbrev] = {}
        end
        Preloaded[Abbrev][Event] = {}
        Dir = Launcher.Filesystem.EnumerateFiles(Path,"*.mp3")
		if Dir ~= nil then
			while Launcher.Filesystem.EnumerateNextFile(Dir) ~= nil do
				Filename = Launcher.Filesystem.EnumeratedFilename(Dir)
				if Filename ~= "." and Filename ~= ".." then
					table.insert(Preloaded[Abbrev][Event],Path..Filename)
				end
			end
			Launcher.Filesystem.EnumeratedFilesFinish(Dir)
		else
			return nil
		end
	else
		return nil
	end
end
function Preload(Event)
    if Event ~= nil then
        PreloadEvent(Event)
        return
    end
    local Count = #Preloaded
    local I
    for I=0, Count do Preloaded[I]=nil end
    PreloadEvent("Menu")
    PreloadEvent("Interface")
    PreloadEvent("Loading")
    PreloadEvent("Intro")
    PreloadEvent("Menu")
    PreloadEvent("Intermission")
    PreloadEvent("Goal Home")
    PreloadEvent("Goal Away")
    PreloadEvent("Play Stopped")
    PreloadEvent("Puck over")
    PreloadEvent("Offside")
    PreloadEvent("Icing")
    PreloadEvent("Net Loose")
    PreloadEvent("Penalty Home")
    PreloadEvent("Penalty Away")
    PreloadEvent("Home Win")
    PreloadEvent("Away Win")
    PreloadEvent("Tie")
    PreloadEvent("Fight")
    PreloadEvent("Period Started")
end
function DeviceCreatedCallback()
    InterfaceTimer = nil
    MenuTimer = nil
	Launcher.Override.DisableMusic()
	HomeAbbreviation = Launcher.Game.HomeNameAbbreviation()
    if PreloadDitties then
        Preload()
    end  
    StopSong(InterfaceStream)
	local Song = PickSong("Loading")
	if Song ~= nil then
		Stream = PlaySong(Song, LoadingReverb, InterfaceVolume)
	end
end
function PausedCallback()
    PlayMenu()
end
function UnpausedCallback()
    local Song
    MenuTimer = nil
    StopSong(MenuStream)

    if Launcher.Sound.Loaded(Stream) then
        Launcher.Sound.Play(Stream,0)
    end
end
function FadeOutTimer()
    StopSong(Stream)
end
function PlayStartedCallback()
	if Launcher.Sound.Loaded(Stream) then
		Launcher.Sound.SlideVolume(Stream,0,FadeOutTime)
        Launcher.Timer.SetTimeout(FadeOutTime,FadeOutTimer)
	end
end
function CutsceneStartedCallback(CutsceneID)
    if CutsceneID == 44 then
        StopSong(Stream)
        Song = PickSong("Intro")
        if Song ~= nil then
            Stream = PlaySong(Song,IntroReverb,ArenaVolume)
        end       
    end
end
function PlayStoppedCallback(Reason)

	local Song = nil
    StopSong(Stream)

	if Reason == LauncherPlayStoppedPeriod then
		Song = nil
	elseif Reason == LauncherPlayStoppedGoalHome then
		Song = PickSong("Goal Home")
	elseif Reason == LauncherPlayStoppedGoalAway then
		Song = PickSong("Goal Away")
	elseif Reason == LauncherPlayStoppedPuckOver then
		Song = PickSong("Puck Over")
        if Song == nil then
            Song = PickSong("Play Stopped")
        end
	elseif Reason == LauncherPlayStoppedOffside then
		Song = PickSong("Offside")
        if Song == nil then
            Song = PickSong("Play Stopped")
        end
	elseif Reason == LauncherPlayStoppedIcing then
		Song = PickSong("Icing")
        if Song == nil then
            Song = PickSong("Play Stopped")
        end
    elseif Reason == LauncherPlayStoppedNetLoose then
		Song = PickSong("Net Loose")
        if Song == nil then
            Song = PickSong("Play Stopped")
        end
    elseif Reason == LauncherPlayStoppedPenaltyHome then
		Song = PickSong("Penalty Home")
	elseif Reason == LauncherPlayStoppedPenaltyAway then
		Song = PickSong("Penalty Away")
	elseif Reason == LauncherPlayStoppedGameOver then
		if Launcher.Stats.HomeGoals() > Launcher.Stats.AwayGoals() then
			Song = PickSong("Home Win")
		elseif Launcher.Stats.AwayGoals() > Launcher.Stats.HomeGoals() then
			Song = PickSong("Away Win")
		else
			Song = PickSong("Tie")
		end
    elseif Reason == LauncherPlayStoppedFight then
        Song = PickSong("Fight")
    else
		Song = PickSong("Play Stopped")
	end
	if Song ~= nil then
		Stream = PlaySong(Song,true, ArenaVolume)
	end
end
function StopSong(MusicStream)
    if MusicStream ~= nil then
        if Launcher.Sound.Loaded(MusicStream) then
            Launcher.Sound.Release(MusicStream)
        end
    end
end
function PlaySong(Path, Reverb, Volume)
    local RetStream
    if Reverb and not DisableReverb then
        RetStream = Launcher.Sound.Load(Path,false)
        Launcher.Sound.SetReverb(RetStream,BASS_DX8_I3DL2REVERB_lRoom,BASS_DX8_I3DL2REVERB_lRoomHF,BASS_DX8_I3DL2REVERB_flRoomRolloffFactor,BASS_DX8_I3DL2REVERB_flDecayTime,BASS_DX8_I3DL2REVERB_flDecayHFRatio,BASS_DX8_I3DL2REVERB_lReflections,BASS_DX8_I3DL2REVERB_flReflectionsDelay,BASS_DX8_I3DL2REVERB_lReverb,BASS_DX8_I3DL2REVERB_flReverbDelay,BASS_DX8_I3DL2REVERB_flDiffusion,BASS_DX8_I3DL2REVERB_flDensity,BASS_DX8_I3DL2REVERB_flHFReference)
    else
        RetStream = Launcher.Sound.Load(Path,true)
    end
	if RetStream ~= nil then
		Launcher.Sound.SetVolume(RetStream,Volume)	
		Launcher.Sound.Play(RetStream,1)
	end
    return RetStream
end
function PickSong(Event)
    math.randomseed(os.time())
	local Dir, List, Size, Path, Filename, Rand, Abbrev

    
	if HomeAbbreviation ~= nil then
		Path = MusicPath..HomeAbbreviation.."\\".. Event.."\\"
		if not Launcher.Filesystem.DirectoryExists(Path) then
			Path = MusicPath.."ALL\\".. Event.."\\"
		end
        Abbrev = HomeAbbreviation
	else
		Path = MusicPath.."ALL\\".. Event.."\\"
        Abbrev = "ALL"
	end
    if PreloadDitties then
        if Preloaded[Abbrev] ~= nil then
            if Preloaded[Abbrev][Event] ~= nil and #Preloaded[Abbrev][Event] > 0 then
                Rand = math.random(1,#Preloaded[Abbrev][Event])
                return Preloaded[Abbrev][Event][Rand]
            end
        end
        return nil
    end
	if Launcher.Filesystem.DirectoryExists(Path) then
		Dir = Launcher.Filesystem.EnumerateFiles(Path,"*.mp3")
		List = {}
		if Dir ~= nil then
			while Launcher.Filesystem.EnumerateNextFile(Dir) ~= nil do
				Filename = Launcher.Filesystem.EnumeratedFilename(Dir)
				if Filename ~= "." and Filename ~= ".." then
					table.insert(List,Path..Filename)
				end
			end
			Launcher.Filesystem.EnumeratedFilesFinish(Dir)
			if #List > 0 then
                Rand = math.random(1,#List)
				return List[Rand] 
			else 
				return nil
			end
		else
			return nil
		end
	else
		return nil
	end
end
function InitSoundCallback()
    if PreloadDitties then
        Preload("Interface")
    end
	PlayInterface()
end
function RematchCallback()
    StopSong(MenuStream)
    StopSong(Stream)
    MenuTimer = nil
end
function PeriodStartedCallback()
    local Song
    StopSong(Stream)
    Song = PickSong("Period Started")
    if Song ~= nil then
        Stream = PlaySong(Song,true, ArenaVolume)
    end
end
function EnterReplayCallback()
    MenuTimer = nil
    StopSong(MenuStream)
end
if Launcher.Config.Bool("enableditties",true) then
    Launcher.Override.DisableMusic()

    Launcher.Callback.Register("DeviceCreated",DeviceCreatedCallback)
    Launcher.Callback.Register("PlayStarted",PlayStartedCallback)
    Launcher.Callback.Register("PlayStopped",PlayStoppedCallback)
    Launcher.Callback.Register("Paused",PausedCallback)
    Launcher.Callback.Register("Unpaused",UnpausedCallback)
    Launcher.Callback.Register("QuitGame",QuitGameCallback)
    Launcher.Callback.Register("SoundInit",InitSoundCallback)
    Launcher.Callback.Register("CutsceneStarted",CutsceneStartedCallback)
    Launcher.Callback.Register("Rematch",RematchCallback)
    Launcher.Callback.Register("PeriodStarted",PeriodStartedCallback)
    if MenuMusicInReplay == false then
        Launcher.Callback.Register("EnterReplay",EnterReplayCallback)
    end
end
