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


Launcher.Game = {}
Launcher.Game.SetPuckGravity = function (Gravity)
	Launcher.Mem.WriteFloat(0x79C754, Gravity)
end
Launcher.Game.PuckGravity = function ()
	Launcher.Mem.Float(0x79C754)
end
Launcher.Game.Quit = function ()
	Launcher.Mem.WriteByte(0x415df5,2)
end
Launcher.Game.Period = function ()
	return Launcher.Mem.Byte(0x79BA38) + 1
end
Launcher.Game.SetPeriod = function (Period)
	Launcher.Mem.WriteByte(0x79BA38,Period - 1)
	Launcher.Mem.WriteByte(0x79BA3A,Period - 1)
end
Launcher.Game.Time = function ()
	return Launcher.Mem.Short(0x79BA34)
end
Launcher.Game.SetTime = function (Seconds)
	Launcher.Mem.WriteShort(0x79BA34, Seconds)
end

Launcher.Game.SetFightsPerGame = function (Fights)
	Launcher.Mem.WriteByte(0x4A0DEA,Fights)
end
Launcher.Game.FightsPerGame = function ()
	return Launcher.Mem.Byte(0x4A0DEA)
end

Launcher.Game.InCutscene = function ()
    if Launcher.Mem.Byte(0x7BC958) ~= -1 then
		return true
	else
		return false
	end
end
Launcher.Game.Paused = function ()
	if Launcher.Mem.Byte(0x791118) == 1 then
		return true
	else
		return false
	end
end
Launcher.Game.PlayStopped = function ()
	if Launcher.Mem.Byte(0x79BA46) == 1 then
		return true
	else
		return false
	end
end
Launcher.Game.Loading = function ()
	if Launcher.Mem.Byte(0x7AAF24) == 1 then
		return true
	else
		return false
	end
end
Launcher.Game.InReplay = function ()
	if Launcher.Mem.Byte(0x78E5B8) == 1 then
		return true
	else
		return false
	end
end
Launcher.Game.Intermission = function ()
	if Launcher.Mem.Byte(0x76D240) == 1 then
		return true
	else
		return false
	end
end
Launcher.Game.PenaltyPending = function ()
	if Launcher.Mem.Byte(0x79B9BC) == 1 then
		return true
	else
		return false
	end
end
Launcher.Game.AwaySiren = function ()
	if Launcher.Mem.Byte(0x7C8A30) == 1 then
		return true
	else
		return false
	end
end
Launcher.Game.HomeSiren = function ()
	if Launcher.Mem.Byte(0x7C8A31) == 1 then
		return true
	else
		return false
	end
end
Launcher.Game.AwayTeamID = function ()
	return Launcher.Mem.Byte(0x7a8e04)
end
Launcher.Game.AwayFullName = function ()
	return Launcher.Mem.String(0x7a8e14,28)
end
Launcher.Game.AwayNameAbbreviation = function ()
	return Launcher.Mem.String(0x7a8e30,3)
end

Launcher.Game.HomeTeamID = function ()
	return Launcher.Mem.Byte(0x7A875C)
end
Launcher.Game.HomeFullName = function ()
	return Launcher.Mem.String(0x7a876c,28)
end
Launcher.Game.HomeNameAbbreviation = function ()
	return Launcher.Mem.String(0x7a8788,3)
end
Launcher.Game.PlayerWithPuck = function ()
	return Launcher.Mem.Byte(0x79BEF4)
end
Launcher.Game.TeamWithPuck = function ()
	return Launcher.Mem.Byte(0x79BAF8)
end
Launcher.Game.ShotSpeed = function ()
	return Launcher.Mem.String(0x79CABC)
end
Launcher.Player.FirstName = function (PlayerID)
	local Address
	local Team = 0
	if PlayerID == -1 then
		return nil
	end
	if PlayerID > 19 then
		Team = 1
	end
	Address = 0x7A8808 + Team * 0x6A8 + 0x4C * PlayerID + 0x8
	return Launcher.Mem.String(Address)
end
Launcher.Player.LastName = function (PlayerID)
	local Address
	local Team = 0
	if PlayerID == -1 then
		return nil
	end
	if PlayerID > 19 then
		Team = 1
	end
	Address = 0x7A8808 + Team * 0x6A8 + 0x4C * PlayerID + 0x18
	return Launcher.Mem.String(Address)
end
Launcher.Game.HomeLeague = function ()
    return Launcher.Mem.Byte(0x776c61)
end
Launcher.Game.HomeLine = function ()
	return Launcher.Mem.Byte(0x7A4BD0)
end
Launcher.Game.AwayLine = function ()
	return Launcher.Mem.Byte(0x7A4BD4)
end
Launcher.Game.ShootoutRound = function ()
	return Launcher.Mem.Byte(0x79BFB8)
end
Launcher.Game.ShootoutSide = function()
    return Launcher.Mem.Byte(0x79ba4a)
end
Launcher.Game.ShootoutPlayerID = function()
    return Launcher.Mem.Byte(0x79bc7e)
end
Launcher.Game.PenaltyPendingTeam = function ()
	return Launcher.Mem.Byte(0x79b3f4)
end
Launcher.Game.PenaltyPendingPlayer = function()
	return Launcher.Mem.Byte(0x79b3f5)
end
Launcher.Game.PenaltyPendingID = function ()
	return Launcher.Mem.Byte(0x79b3f6)
end
Launcher.Game.PenaltyPendingTime = function ()
	return Launcher.Mem.Byte(0x79b3f7)
end


Launcher.Game.LastPenaltyTeam = function ()
	return Launcher.Mem.Byte(0x79b41c)
end
Launcher.Game.LastPenaltyPlayer = function ()
	return Launcher.Mem.Byte(0x79b41d)
end
Launcher.Game.LastPenaltyID = function ()
	return Launcher.Mem.Byte(0x79b41e)
end
Launcher.Game.LastPenaltyTime = function ()
	return Launcher.Mem.Byte(0x79b41f)
end

Launcher.Game.SetArenaFilename = function (Name)
	Launcher.Mem.WriteString(0x72A081,Name)
end

Launcher.Game.SetInstantFights = function ()
	local ASM = [[
        NOP
        NOP
        NOP
        NOP
        NOP
        NOP
    ]]
    Launcher.Mem.WriteASM(0x4A0E10,ASM)
    Launcher.Mem.WriteASM(0x4A0E35,ASM)
end
function Launcher.Game.PuckPosition()
    local Address, X, Y, Z
    X = 0
    Y = 0 
    Z = 0
    Address = Launcher.Mem.Long(0x7ad820)
    if Address > 0 then
        Address = Address + 0x110
        Address = Launcher.Mem.Long(Address)
        if Address > 0 then
            Address = Address + 0x1c
            X = Launcher.Mem.Float(Address)
            Y = Launcher.Mem.Float(Address+4)
            Z = Launcher.Mem.Float(Address+8)
        end
    end
    return  X, Y , Z
end
function Launcher.Game.SetPuckPosition(X,Y,Z)
    local Address
    Address = Launcher.Mem.Long(0x7ad820) + 0x110
    Address = Launcher.Mem.Long(Address) + 0x1c
    Launcher.Mem.WriteFloat(Address,X)
    Launcher.Mem.WriteFloat(Address+4,Y)
    Launcher.Mem.WriteFloat(Address+8,Z)
end
Launcher.Game.Over = function()
    local ASM, Ret
    if LauncherGameOverASMBuffer == nil then
        LauncherGameOverAddress = Launcher.Mem.Alloc(4)
        ASM = [[
            push 0
            mov eax, 0x4a3f10
            call eax
            add esp, 4
            mov [0x]]..string.format("%x",LauncherGameOverAddress)..[[], eax
            ret
        ]]
        LauncherGameOverASMBuffer = Launcher.Mem.AssembleString(ASM)
    end
    if LauncherGameOverASMBuffer ~= nil then
        Launcher.Mem.Call(LauncherGameOverASMBuffer)
        Ret = Launcher.Mem.Long(LauncherGameOverAddress)
        if Ret == 1 then 
            return false -- intentionally invert
        else
            return true
        end
    else
        return nil
    end
end

Launcher.Game.SetPenaltyTimer = function(PenaltyTimer)
    if PenaltyTimer == nil then
        return 0
    end
    local ASM
    if PenaltyTimer == 0 then
        ASM = [[
            nop 
            nop 
            nop 
            nop 
            mov eax,[0x79C258]
            mov ecx,[eax]
            movzx edx,byte [ecx+0x000000D6]
            movzx eax,byte [eax+0x000000D6]
            sub eax,edx
            nop 
            nop 
            nop 
            nop 

        ]]
        Launcher.Mem.WriteASM(0x4a1840,ASM)    
    else
        Launcher.Mem.WriteByte(0x4a1870,PenaltyTimer+1)    
    end
    return 1
end
Launcher.Game.SetLastMinuteTimer = function(Timer)
    local ASM
    if Timer == nil then
        return 0
    elseif Timer == 0 then
        Launcher.Mem.WriteByte(0x4a180b,99)
        return 1
    else
        Launcher.Mem.WriteLong(0x4a1819,Timer+1)
        return 1
    end
end
Launcher.Game.SetOTTimer = function(OTTimer)
    local ASM, ASMPointer
    if OTTimer == nil then
        return 0
    elseif OTTimer == 0 then
        ASM = [[
            nop 
            nop 
            nop 
            nop 
            nop
        ]]  
        Launcher.Mem.WriteASM(0x4a1824,ASM)
        return 1
    else
        ASM = [[
            mov eax, ]]..tostring(OTTimer+1)..[[ 
            pop esi
            ret
        ]]
        ASMPointer = Launcher.Mem.AssembleString(ASM)
        if ASMPointer then
            Launcher.Mem.WriteJump(0x4a187a,ASMPointer)
            Launcher.Mem.WriteByte(0x4a1827,0x74)
            Launcher.Mem.WriteByte(0x4a1828,0x51)
            return 1
        end
    end
    return 0
end

Launcher.Game.SetPoints = function(PointsWin, PointsTie,PointsLoseOT, PointsWinOT)
      Launcher.Mem.WriteLong(0x774A74,PointsWin)
      Launcher.Mem.WriteLong(0x774A78,PointsTie)
      Launcher.Mem.WriteLong(0x774A7C,PointsLoseOT)
      Launcher.Mem.WriteLong(0x774A80,PointsWinOT)
end
Launcher.Game.GetLanguage = function()
    return Launcher.Mem.Byte(0x78d348)
end
Launcher.Game.SetLanguage = function(LanguageID)
    Launcher.Mem.WriteByte(0x78d348,LanguageID)
end