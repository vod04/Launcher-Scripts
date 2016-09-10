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


LoopAddress = Launcher.Mem.Alloc(1)
CutsceneAddress = Launcher.Mem.Alloc(4)
ASM = [[ 
    pusha
    mov eax,[esi+0x1c]
    mov dword []]..CutsceneAddress..[[],eax
    **CutsceneLoop
    popa
    mov al, byte []]..LoopAddress..[[]
    ret
]]
function CutsceneLoop()
    local I, Count, Ret, Cutscene
    Count = Launcher.Callback.Count("CutsceneLoop")-1
    Cutscene = Launcher.Mem.Long(CutsceneAddress)
    for I = 0,Count do
        Ret = Launcher.Callback.Trigger("CutsceneLoop",nil,I,Cutscene)
        if Ret ~= nil and Ret then
            Launcher.Mem.WriteByte(LoopAddress,1)
            return
        end
    end
    Launcher.Mem.WriteByte(LoopAddress,0)
    return
end
if Launcher.Callback.Create("CutsceneLoop") ~= nil then
    ASMPointer = Launcher.Mem.AssembleString(ASM)
    if ASMPointer ~= nil then
        Launcher.Mem.WriteCall(0x5c5291,ASMPointer)
    end
end

