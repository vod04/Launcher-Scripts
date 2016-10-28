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
    local FOV = Launcher.Camera.FOVModifier()
    if FOV ~= TargetFOV and TargetFOV ~= nil then
        if TargetFOV < FOV then
            FOV = FOV - 0.2
            if FOV < TargetFOV then
                FOV = TargetFOV
                TargetFOV = nil
            end
            Launcher.Camera.SetFOVModifier(FOV)
        else
            FOV = FOV + 0.2
            if FOV > TargetFOV then
                FOV = TargetFOV
                TargetFOV = nil
            end
            Launcher.Camera.SetFOVModifier(FOV)
        end
    else
        if Launcher.Input.KeyPressed(VK_PRIOR) then
            if Launcher.Input.KeyDown(VK_SHIFT) then
                TargetFOV = FOV+10
            else
                TargetFOV = FOV+5
            end
        end
        if Launcher.Input.KeyPressed(VK_NEXT) then
            if Launcher.Input.KeyDown(VK_SHIFT) then
                TargetFOV = FOV-10
            else
                TargetFOV = FOV-5
            end
        end
    end

end

Launcher.Callback.Register("Tick",TickCallback)
