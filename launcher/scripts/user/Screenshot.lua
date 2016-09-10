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


Format = Launcher.Config.String("screenshotformat","bmp")

function TickCallback()
    local Path, Number, Filename
	if Launcher.Input.KeyPressed(VK_SNAPSHOT) then
		Surface = Launcher.Screen.DefaultRenderTargetSurface()
        Path = Launcher.System.DocsPath()
        Number = 0
        while true do
            Pre = ""
            if Number < 10 then
                Pre = "000"
            elseif Number < 100 then
                Pre = "00"
            elseif Number < 1000 then
                Pre = "0"
            end
            Filename = Pre .. Number .. "." .. Format
            if not Launcher.Filesystem.FileExists(Path..Filename) then
                break
            end
            Number = Number + 1
        end
        Launcher.Surface.Save(Surface,Path..Filename)
	end
	
end
Launcher.Callback.SetPriority(-999)
Launcher.Callback.Register("Tick",TickCallback)