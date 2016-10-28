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


function Replace(Path)
	local Dir, Filename, Name, Tex
	Dir = Launcher.Filesystem.EnumerateFiles(Path,"*.png")
	if Dir ~= nil then
		while Launcher.Filesystem.EnumerateNextFile(Dir) ~= nil do
			Filename = Launcher.Filesystem.EnumeratedFilename(Dir)
			if Filename ~= "." and Filename ~= ".." then
				Name = string.sub(Filename,1,string.len(Filename)-4)
				if string.len(Name) == 4 then
					Tex = Launcher.Texture.Load("launcher\\media\\textures\\inject\\"..Filename)
					if Tex ~= nil then
						Launcher.Texture.Inject(Tex,Name)
					end
				end
			end
		end
        Launcher.Filesystem.EnumeratedFilesFinish(Dir)
	end
	
end

function DeviceCreatedCallback()
	Replace("launcher\\media\\textures\\inject")
    Replace("launcher\\media\\textures\\inject\\"..Launcher.Game.HomeNameAbbreviation())
end


Launcher.Callback.Register("DeviceCreated",DeviceCreatedCallback)