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


Address = Launcher.Mem.Alloc(4)
Launcher.Mem.WriteLong(Address,0x4A9D60)
ASM = [[ 
    call dword []]..Address..[[] 
    *PeriodStarted
    ret 
]]
if Launcher.Callback.Create("PeriodStarted") ~= nil then
    ASMPointer = Launcher.Mem.AssembleString(ASM)
    if ASMPointer ~= nil then
        Launcher.Mem.WriteCall(0x4a57f5,ASMPointer)
    end
end

