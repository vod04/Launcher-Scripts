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

Launcher.Widget = {}
Launcher.Widget.Window = {}
Launcher.Widget.Window.Windows_ = {}

Launcher.Widget.Window.Create = function(X, Y, Width, Height, Title)
    local Index
    Index = #Launcher.Widget.Windows_
    Launcher.Widget.Window.Windows_[Index] = {}
    Launcher.Widget.Window.Windows_[Index].X = X
    Launcher.Widget.Window.Windows_[Index].Y = Y
    Launcher.Widget.Window.Windows_[Index].Width = Width
    Launcher.Widget.Window.Windows_[Index].Height = Height
    Launcher.Widget.Window.Windows_[Index].Title = Title
    return Index
end
Launcher.Widget.Window.Close = function(WindowID)
    Launcher.Widget.Window.Windows_[WindowID] = nil
end
Launcher.Widget.Window.Move = function(WindowID, X, Y)
    Launcher.Widget.Window.Windows_[WindowID].X = X
    Launcher.Widget.Window.Windows_[WindowID].Y = Y
end
Launcher.Widget.Window.Resize = function(WindowID, Width, Height)
    Launcher.Widget.Window.Windows_[WindowID].Width = Width
    Launcher.Widget.Window.Windows_[WindowID].Height = Height
end
Launcher.Widget.Window.SetTitle = function(WindowID, Width, Height)
    Launcher.Widget.Window.Windows_[WindowID].Title = Title
end
Launcher.Widget.Window.Position = function(WindowID)
    return Launcher.Widget.Window.Windows_[WindowID].X,Launcher.Widget.Window.Windows_[WindowID].Y
end

Launcher.Widget.Window.X = function(WindowID)
    return Launcher.Widget.Window.Windows_[WindowID].X
end
Launcher.Widget.Window.Y = function(WindowID)
    return Launcher.Widget.Window.Windows_[WindowID].Y
end
Launcher.Widget.Window.Size = function(WindowID)
    return Launcher.Widget.Window.Windows_[WindowID].Width,Launcher.Widget.Window.Windows_[WindowID].Height
end
Launcher.Widget.Window.Width = function(WindowID)
    return Launcher.Widget.Window.Windows_[WindowID].Width
end
Launcher.Widget.Window.Height = function(WindowID)
    return Launcher.Widget.Window.Windows_[WindowID].Height
end