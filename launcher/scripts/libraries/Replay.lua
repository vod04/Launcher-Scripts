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


Launcher.Replay.State = function ()
	return Launcher.Mem.Byte(0x7CC7C8)
end
Launcher.Replay.Frame = function ()
	return Launcher.Mem.Short(0x7CC7EC)
end
Launcher.Replay.TotalFrames = function ()
	return Launcher.Mem.Short(0x7cc7f0)
end
Launcher.Replay.Time = function ()
	return Launcher.Mem.Short(0x79BF4C)
end
Launcher.Replay.SpeedPercent = function ()
	return Launcher.Mem.Byte(0x78E4E0)
end
Launcher.Replay.CursorY = function ()
	return Launcher.Mem.Float(0x7AC2D4)
end
Launcher.Replay.CursorX = function ()
	return Launcher.Mem.Float(0x7AC2DC)
end
Launcher.Replay.HomeSelectedPlayerID = function ()
	return Launcher.Mem.Float(0x79ca7e)
end