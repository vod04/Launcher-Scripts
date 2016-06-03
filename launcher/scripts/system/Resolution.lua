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


Pointer = Launcher.Mem.AssembleString([[
    MOV edx,[esp+0x8]
    MOV eax, ]]..Launcher.Config.Int("width",800)..[[ 
    MOV [edx],eax
    MOV edx,[esp+0x0C]
    MOV eax, ]]..Launcher.Config.Int("height",600)..[[ 
    MOV [edx],eax
    RET
]])

if Pointer ~= nil then
    Launcher.Mem.WriteJump(0x406C10,Pointer)
end
