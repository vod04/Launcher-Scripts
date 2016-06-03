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


Launcher.Cutscene.ID = function ()
	return Launcher.Mem.Byte(0x7BC958)
end
Launcher.Cutscene.PlayerText = function ()
	return Launcher.Mem.String(0x7bda6c)
end
Launcher.Cutscene.DescriptionText = function ()
	return Launcher.Mem.String(0x7bdaac)
end
Launcher.Cutscene.PlayerText2 = function ()
	return Launcher.Mem.String(0x7bdaec)
end
Launcher.Cutscene.TimeText = function ()
	return Launcher.Mem.String(0x7bdbac)
end
Launcher.Cutscene.StringID = function ()
	return Launcher.Mem.String(0x7bca80)
end