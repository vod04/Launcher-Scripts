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


Launcher.Graphics.SetPlayerShadowCount = function (Count)
	return Launcher.Mem.WriteByte(0x776D8C,Count)
end
Launcher.Graphics.PlayerShadowCount = function ()
	return Launcher.Mem.Byte(0x776D8C)
end
Launcher.Graphics.SetPlayerShadowIntensity = function (Intensity)
	return Launcher.Mem.WriteByte(0x776DA0,Intensity)
end
Launcher.Graphics.PlayerShadowIntensity = function ()
	return Launcher.Mem.Byte(0x776DA0)
end
Launcher.Graphics.EnablePuckShadow = function (Enable)
	return Launcher.Mem.WriteByte(0x78D5F4,Enable)
end

Launcher.Graphics.PuckShadowEnabled = function ()
	if Launcher.Mem.Byte(0x78D5F4) == 0 then
		return false
	else
		return true
	end
	
end

Launcher.Graphics.SetPuckShadowSize = function (Size)
	return Launcher.Mem.WriteByte(0x6F5140,Size)
end

Launcher.Graphics.PuckShadowSize = function ()
	return Launcher.Mem.Byte(0x6F5140)
end

Launcher.Screen.D3DDevice = function ()
	return Launcher.Mem.Long(0x7D08A8)
end