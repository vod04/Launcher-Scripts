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


Launcher.Mem.WriteCall = function (Address,FunctionPointer, NOPs)
  local I
  Launcher.Mem.WriteByte(Address,0xe8)
  Launcher.Mem.WriteLong(Address+1,FunctionPointer-Address-5)
  if NOPs ~= nil and NOPs > 0 then
    for I = 1,NOPs do
        Launcher.Mem.WriteByte(Address+4+I,0x90)
    end
  end
end
Launcher.Mem.WriteJump = function (Address,FunctionPointer)
  Launcher.Mem.WriteByte(Address,0xe9)
  Launcher.Mem.WriteLong(Address+1,FunctionPointer-Address-5)
end
Launcher.Mem.WriteASM = function (Address, ASMString)
    local Mem = Launcher.Mem.AssembleString(ASMString)
    if Mem ~= nil then
        local Size = Launcher.Mem.Size(Mem)
        Launcher.Mem.Copy(Mem,Address,Size)
        Launcher.Mem.Release(Mem)
    end
end