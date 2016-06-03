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


Launcher.Camera.Rotate = function (Rotation)
    Launcher.Mem.WriteFloat(0x7BD610,Rotation)
end
Launcher.Camera.Roll = function (Rotation)
    Launcher.Mem.WriteFloat(0x7BD614,Rotation)
end
Launcher.Camera.SetFOVModifier = function(FOV)
    Launcher.Env.SetNumber("fovmod",FOV)
end
Launcher.Camera.FOVModifier = function()
    return Launcher.Env.Number("fovmod")
end