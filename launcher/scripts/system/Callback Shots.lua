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

ReturnAddress = Launcher.Mem.Alloc(4)
ASM = [[ 
    pop eax
    mov []]..ReturnAddress..[[],eax
    mov eax,0x4B52C0
    call eax
    movsx ebx, byte [0x79BAF8]
    cmp ebx,0
    je home
    *ShotAway
    jmp finish
    home:
        *ShotHome
    finish:
        mov eax, []]..ReturnAddress..[[] 
        push eax
        ret
]]
if Launcher.Callback.Create("ShotHome") ~= nil then
    if Launcher.Callback.Create("ShotAway") ~= nil then
        ASMPointer = Launcher.Mem.AssembleString(ASM)
        if ASMPointer ~= nil then
            Launcher.Mem.WriteCall(0x4b6574,ASMPointer,0)
        end
    end
end

