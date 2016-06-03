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


Launcher.Stats.Fights = function ()
	return Launcher.Mem.Byte(0x79BA4B)
end

Launcher.Stats.SetFights = function (Fights)
	return Launcher.Mem.WriteByte(0x79BA4B,Fights)
end


-- -----------------------------

Launcher.Stats.HomeGoals = function ()
	return Launcher.Mem.Short(0x7a95da)
end
Launcher.Stats.SetHomeGoals = function (Goals)
	Launcher.Mem.WriteShort(0x7A4AC8,Goals)
    Launcher.Mem.WriteShort(0x7a95da,Goals)
end
Launcher.Stats.HomeShots = function ()
	return Launcher.Mem.Short(0x7A95D8)
end
Launcher.Stats.SetHomeShots = function (Shots)
	Launcher.Mem.WriteShort(0x7A95D8,Shots)
end
Launcher.Stats.HomeHits = function ()
	return Launcher.Mem.Short(0x7A9608)
end
Launcher.Stats.SetHomeHits = function (Hits)
	return Launcher.Mem.WriteShort(0x7A9608,Hits)
end
Launcher.Stats.HomePasses = function ()
	return Launcher.Mem.Short(0x7A960C)
end
Launcher.Stats.SetHomePasses = function (Passes)
	return Launcher.Mem.WriteShort(0x7A960C,Passes)
end
Launcher.Stats.HomePassAttempts = function ()
	return Launcher.Mem.Short(0x7A960A)
end
Launcher.Stats.SetHomePassAttempts = function (Passes)
	return Launcher.Mem.WriteShort(0x7A960A,Passes)
end
Launcher.Stats.HomeFaceoffsWon = function ()
	return Launcher.Mem.Short(0x7A95E8)
end
Launcher.Stats.SetHomeFaceoffsWon = function (Faceoffs)
	return Launcher.Mem.WriteShort(0x7A95E8,Faceoffs)
end
Launcher.Stats.HomeOneTimers = function ()
	return Launcher.Mem.Short(0x7A95FC)
end
Launcher.Stats.SetHomeOneTimers = function (OneTimers)
	return Launcher.Mem.WriteShort(0x7A95FC,OneTimers)
end
Launcher.Stats.HomePowerPlays = function ()
	return Launcher.Mem.Short(0x7A95EC)
end
Launcher.Stats.SetHomePowerPlays = function (PP)
	return Launcher.Mem.WriteShort(0x7A95EC,PP)
end
Launcher.Stats.HomePowerPlayGoals = function ()
	return Launcher.Mem.Short(0x7A95EE)
end
Launcher.Stats.SetHomePowerPlayGoals = function (PPGoals)
	return Launcher.Mem.WriteShort(0x7A95EE,PPGoals)
end
Launcher.Stats.HomePIM = function ()
	return Launcher.Mem.Short(0x7A95F6)
end
Launcher.Stats.SetHomePIM = function (PIM)
	return Launcher.Mem.WriteShort(0x7A95F6,PIM)
end
Launcher.Stats.HomePenalties = function ()
	return Launcher.Mem.Short(0x7A95F4)
end
Launcher.Stats.SetHomePenalties = function (Penalties)
	return Launcher.Mem.WriteShort(0x7A95F4,Penalties)
end
-- ------------------------------

Launcher.Stats.AwayShots = function ()
	return Launcher.Mem.Short(0x7A9634)
end
Launcher.Stats.SetAwayShots = function (Shots)
	return Launcher.Mem.WriteShort(0x7A9634, Shots)
end
Launcher.Stats.AwayGoals = function ()
	return Launcher.Mem.Short(0x7a9636)
end
Launcher.Stats.SetAwayGoals = function (Goals)
	Launcher.Mem.WriteShort(0x7A4ACC,Goals)
    Launcher.Mem.WriteShort(0x7a9636,Goals)
end
Launcher.Stats.AwayHits = function ()
	return Launcher.Mem.Short(0x7A9664)
end
Launcher.Stats.SetAwayHits = function (Hits)
	return Launcher.Mem.WriteShort(0x7A9664,Hits)
end
Launcher.Stats.AwayPasses = function ()
	return Launcher.Mem.Short(0x7A9668)
end
Launcher.Stats.SetAwayPasses = function (Passes)
	return Launcher.Mem.WriteShort(0x7A9668,Passes)
end
Launcher.Stats.AwayPassAttempts = function ()
	return Launcher.Mem.Short(0x7A9666)
end
Launcher.Stats.SetAwayPassAttempts = function (Passes)
	return Launcher.Mem.WriteShort(0x7A9666,Passes)
end
Launcher.Stats.AwayFaceoffsWon = function ()
	return Launcher.Mem.Short(0x7A9644)
end
Launcher.Stats.SetAwayFaceoffsWon = function (FOW)
	return Launcher.Mem.WriteShort(0x7A9644,FOW)
end
Launcher.Stats.AwayOneTimers = function ()
	return Launcher.Mem.Short(0x7A9658)
end
Launcher.Stats.SetAwayOneTimers = function (OneTimers)
	return Launcher.Mem.WriteShort(0x7A9658,OneTimers)
end
Launcher.Stats.AwayPowerPlays = function ()
	return Launcher.Mem.Short(0x7A9648)
end
Launcher.Stats.SetAwayPowerPlays = function (PP)
	return Launcher.Mem.WriteShort(0x7A9648,PP)
end
Launcher.Stats.AwayPowerPlayGoals = function ()
	return Launcher.Mem.Short(0x7A964A)
end
Launcher.Stats.SetAwayPowerPlayGoals = function (PPGoals)
	return Launcher.Mem.WriteShort(0x7A964A,PPGoals)
end
Launcher.Stats.AwayPIM = function ()
	return Launcher.Mem.Short(0x7A9652)
end
Launcher.Stats.SetAwayPIM = function (PIM)
	return Launcher.Mem.WriteShort(0x7A9652,PIM)
end
Launcher.Stats.AwayPenalties = function ()
	return Launcher.Mem.Short(0x7A9650)
end
Launcher.Stats.WriteAwayPenalties = function (Penalties)
	return Launcher.Mem.WriteShort(0x7A9650,Penalties)
end