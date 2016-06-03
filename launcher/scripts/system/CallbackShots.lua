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


ASM = [[ 
    inc word [eax]
    cmp eax,0x7A95D8
    je home
    cmp eax,0x7A9634
    je away
    jmp finished
    away:
        *ShotAway
        jmp finished
    home:
        *ShotHome
    finished:
        mov eax,[esi+04]
        ret
]]
if Launcher.Callback.Create("ShotHome") ~= nil then
    if Launcher.Callback.Create("ShotAway") ~= nil then
        ASMPointer = Launcher.Mem.AssembleString(ASM)
        if ASMPointer ~= nil then
            Launcher.Mem.WriteCall(0x4d4680,ASMPointer,1)
        end
    end
end

