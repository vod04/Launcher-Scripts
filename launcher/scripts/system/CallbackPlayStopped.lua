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


ReasonAddress = Launcher.Mem.Alloc(4)
ASM = [[ 
    mov byte[0x79BA46],1
    mov dword []]..ReasonAddress..[[],esi
    **PlayStopped
    ret 
]]
HomeGoals = 0
AwayGoals = 0
function PlayStopped()
    local LauncherReason, Team, Reason
    Reason = Launcher.Mem.Long(ReasonAddress)
    --Launcher.Log.Write("Play stopped reason "..Reason)
    LauncherReason = 0
    if Reason == 3 then
      if Launcher.Game.Over() then
        LauncherReason = LauncherPlayStoppedGameOver
        HomeGoals = 0
        AwayGoals = 0
      else
        LauncherReason = LauncherPlayStoppedPeriod  
      end
    elseif Reason == 5 then
        LauncherReason = LauncherPlayStoppedPuckOver
    elseif Reason == 6 then
        LauncherReason = LauncherPlayStoppedIcing
    elseif Reason == 7 then
        LauncherReason = LauncherPlayStoppedOffside
    elseif Reason == 8 then
        LauncherReason = LauncherPlayStoppedTwoLinePass
    elseif Reason == 9 then
        if Launcher.Stats.HomeGoals() ~= HomeGoals then
            HomeGoals = Launcher.Stats.HomeGoals()
            LauncherReason = LauncherPlayStoppedGoalHome
        elseif Launcher.Stats.AwayGoals() ~= AwayGoals then
            AwayGoals = Launcher.Stats.AwayGoals()
            LauncherReason = LauncherPlayStoppedGoalAway
        end
    elseif Reason == 10 then
        LauncherReason = 2
    elseif Reason == 14 then
        LauncherReason = LauncherPlayStoppedGoalie
    elseif Reason == 15 then
        LauncherReason = LauncherPlayStoppedNetLoose
    elseif Reason == 20 then
        LauncherReason = LauncherPlayStoppedFight
    elseif Reason == 23 or Reason == 24 or Reason == 25 or Reason == 26 or Reason == 27 or Reason == 29 or Reason == 32 or Reason == 34 or Reason == 36 then
        -- 23 = Roughing
        -- 24 = Cross-Checking
        -- 25 = Hooking
        -- 26 = Tripping
        -- 27 = Interference
        -- 29 = Elbowing
        -- 32 = Holding
        -- 34 = Hooking
        -- 36 = Tripping
        Team = Launcher.Game.TeamWithPuck()
        if Team == 1 then
            LauncherReason = LauncherPlayStoppedPenaltyAway
        else
            LauncherReason = LauncherPlayStoppedPenaltyHome
        end
    end
    Launcher.Callback.Trigger("PlayStopped",nil,nil,LauncherReason)
end
if Launcher.Callback.Create("PlayStopped") ~= nil then
    ASMPointer = Launcher.Mem.AssembleString(ASM)
    if ASMPointer ~= nil then
        Launcher.Mem.WriteCall(0x4A4BC5,ASMPointer)
    end
end

