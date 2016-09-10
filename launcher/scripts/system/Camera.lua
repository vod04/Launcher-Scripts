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




AspectAddress = Launcher.Mem.Alloc(4)
FinalFOVAddress = Launcher.Mem.Alloc(4)
FOVAddress = Launcher.Mem.Alloc(4)

Launcher.Env.SetNumber("fovmod",Launcher.Config.Number("fov",0))
Launcher.Mem.WriteFloat(FOVAddress,Launcher.Env.Number("fovmod"))

Aspect = Launcher.Screen.Width()/Launcher.Screen.Height()
Launcher.Mem.WriteFloat(AspectAddress,Aspect)



ASM = [[
    mov eax,[esp+0x0C]
    mov edx,[esp+0x10]
    mov [ecx+0x120],eax
    fld dword [esp+0x04]
    fadd dword []]..FOVAddress..[[]
    fstp dword []]..FinalFOVAddress..[[]
    mov eax, dword []]..FinalFOVAddress..[[]
    mov [ecx+0x124],edx
    mov edx,dword []]..AspectAddress..[[]
    mov [ecx+0x128],eax
    mov [ecx+0x12C],edx
    mov byte [ecx+0x0C],01
    ret 0x10

]]
ASMPointer = Launcher.Mem.AssembleString(ASM)
Launcher.Mem.WriteCall(0x45F875,ASMPointer)
Launcher.Mem.WriteCall(0x5AA678,ASMPointer)
Launcher.Mem.WriteCall(0x5D027B,ASMPointer)


function TickCallback()
    local FOVMod = Launcher.Env.Number("fovmod")
    Launcher.Mem.WriteFloat(FOVAddress,FOVMod)
    if FOVMod ~= LastFOV then
        local Address = Launcher.Mem.Long(0x07C7AB4)
        if Address > 0 then 
            Launcher.Mem.WriteFloat(Address + 0x128,Launcher.Mem.Float(Address + 0x128))
        end
        LastFOV = FOVMod
    end
end
function DeviceCreatedCallback()
    Launcher.Env.SetNumber("fovmod",Launcher.Config.Number("fov",0))
end
Launcher.Callback.Register("Tick",TickCallback)
Launcher.Callback.Register("DeviceCreated",DeviceCreatedCallback)