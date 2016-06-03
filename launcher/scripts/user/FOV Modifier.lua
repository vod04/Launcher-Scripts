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



function TickCallback()

	if Launcher.Input.KeyPressed(VK_PRIOR) then
		Launcher.Camera.SetFOVModifier(Launcher.Camera.FOVModifier()+5)
	end

	if Launcher.Input.KeyPressed(VK_NEXT) then
		Launcher.Camera.SetFOVModifier(Launcher.Camera.FOVModifier()-5)
	end

end

Launcher.Callback.Register("Tick",TickCallback)
