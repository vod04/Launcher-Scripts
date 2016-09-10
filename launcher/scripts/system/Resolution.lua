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


ScreenWidth = Launcher.Config.Int("width",800)
ScreenHeight = Launcher.Config.Int("height",600)
AspectRatio = ScreenWidth/ScreenHeight
AspectBuffer = Launcher.Mem.Alloc(4)
Launcher.Mem.WriteFloat(AspectBuffer, AspectRatio)
Pointer = Launcher.Mem.AssembleString([[
    mov edx,[esp+0x8]
    mov eax, ]]..ScreenWidth..[[ 
    mov [edx],eax
    mov edx,[esp+0x0C]
    mov eax, ]]..ScreenHeight..[[ 
    mov [edx],eax
    mov eax,[]]..AspectBuffer..[[] 
    mov [0x4A59C6], eax
    mov [0x5CDF8E], eax
    mov [0x5D0270], eax
    ret
]])

if Pointer ~= nil then
    Launcher.Mem.WriteJump(0x406C10,Pointer)
end

if Launcher.Config.Bool("interfaceresolution",false) == true then
	Width = Launcher.Config.Int("Width",800)
	Height = Launcher.Config.Int("Height",600)


	Launcher.Mem.WriteLong(0x409a9f,Width) --Interface Window (Full screen)
	Launcher.Mem.WriteLong(0x409aa4,Height) 

	Launcher.Mem.WriteLong(0x409a8e,Width) --Interface Window
	Launcher.Mem.WriteLong(0x409a96,Height) 

	Launcher.Mem.WriteLong(0x409060,Height) --Adjust Interface Window
	Launcher.Mem.WriteLong(0x409065,Width) 

	Launcher.Mem.WriteLong(0x40908b,Height) --Adjust Interface Window
	Launcher.Mem.WriteLong(0x409090,Width) 

	Launcher.Mem.WriteLong(0x4090ee,Height) --Adjust Interface Window
	Launcher.Mem.WriteLong(0x4090f3,Width) 

	Launcher.Mem.WriteLong(0x409109,Height) --Adjust Interface Window
	Launcher.Mem.WriteLong(0x40910e,Width) 

	Launcher.Mem.WriteLong(0x4090e4,Width) --Compare
	Launcher.Mem.WriteLong(0x4090db,Height) 

	Launcher.Mem.WriteLong(0x409124,Height) --Adjust Interface Window
	Launcher.Mem.WriteLong(0x409129,Width) 

	Launcher.Mem.WriteLong(0x40913f,Width) --Adjust Interface Window
	Launcher.Mem.WriteLong(0x409149,Height) 

	Launcher.Mem.WriteLong(0x409c6a,Width) 
	Launcher.Mem.WriteLong(0x409c74,Height) 

	Launcher.Mem.WriteLong(0x409c85,Height) 
	Launcher.Mem.WriteLong(0x409c8a,Width) 

	Launcher.Mem.WriteLong(0x40902f,Height) 
	Launcher.Mem.WriteLong(0x409034,Width) 

	Launcher.Mem.WriteLong(0x409048,Height) 
	Launcher.Mem.WriteLong(0x40904d,Width) 

	Launcher.Mem.WriteLong(0x409b20,Height) 
	Launcher.Mem.WriteLong(0x409b25,Width)

	Launcher.Mem.WriteLong(0x409c85,Height) 
	Launcher.Mem.WriteLong(0x409c8a,Width)


	Launcher.Mem.WriteLong(0x462cde,Height) 
	Launcher.Mem.WriteLong(0x462ce3,Width)

end

