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
    mov [0x79B9BC],bl
    **PenaltyPending
    ret
]]
function PenaltyPending()
    local Val1 = Launcher.Mem.Byte(0x79b3f4)
    local Val2 = Launcher.Mem.Byte(0x79b3f5)
    local Val3 = Launcher.Mem.Byte(0x79b3f6)
    local Val4 = Launcher.Mem.Byte(0x79b3f7)
    Launcher.Callback.Trigger("PenaltyPending",nil, nil, Val2,Val2,Val3,Val4)
end
if Launcher.Callback.Create("PenaltyPending") ~= nil then
    ASMPointer = Launcher.Mem.AssembleString(ASM)
    if ASMPointer ~= nil then
        Launcher.Mem.WriteCall(0x4aa271,ASMPointer,1)
    end
end

