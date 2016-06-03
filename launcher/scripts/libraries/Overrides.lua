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


Launcher.Override.DisableGameClock = function ()
    Launcher.Mem.WriteASM(0x58f2bc,[[
        nop 
        nop 
        nop 
        nop 
        nop 
        nop 
        jmp near 0x000001e8 
        nop
    ]])

end
Launcher.Override.DisableTimer = function ()
	Launcher.Mem.WriteASM(0x4a1916,[[
        nop
        nop
    ]])
	Launcher.Mem.WriteASM(0x4a1919,[[
        nop
        nop
        nop
        nop
        nop
        nop
        nop
    ]])
end
Launcher.Override.DisableOverlay = function ()
	Launcher.Mem.WriteASM(0x54fb20,[[
        retn
    ]])
end
Launcher.Override.DisableWindowFocusCheck = function ()
	Launcher.Mem.WriteASM(0x653788,[[
        nop 
        nop 
        nop 
        nop 
        nop
     ]])
end
Launcher.Override.DisableMusic = function ()
	Launcher.Mem.WriteFloat(0x752EB4,0.0)
	--Launcher.Mem.WriteByte(0x78D568,0)

    local Address = Launcher.Mem.Alloc(4)
    Launcher.Mem.WriteLong(Address,0)
    Launcher.Mem.WriteASM(0x41a0e3,[[
        mov ecx,[0x]]..string.format("%x",Address)..[[]
    ]])
    Launcher.Mem.WriteASM(0x415f42,[[
       fild dword [0x]]..string.format("%x",Address)..[[]
    ]])
	Launcher.Mem.WriteASM(0x51a517,[[
        mov ecx,[0x]]..string.format("%x",Address)..[[]
    ]])
	Launcher.Mem.WriteASM(0x51a6cd,[[
        fild dword [0x]]..string.format("%x",Address)..[[]
    ]])
	Launcher.Mem.WriteASM(0x51ac96,[[
        mov ecx,[0x]]..string.format("%x",Address)..[[]
    ]])
	Launcher.Mem.WriteASM(0x51b1bf,[[
        mov ecx,[0x]]..string.format("%x",Address)..[[]
    ]])
	Launcher.Mem.WriteASM(0x525710,[[
        xor eax, eax
        ret
    ]])
    Launcher.Mem.WriteASM(0x525c47,[[
        fild dword [0x]]..string.format("%x",Address)..[[]
    ]])
    Launcher.Mem.WriteASM(0x525e11,[[
        fild dword [0x]]..string.format("%x",Address)..[[]
    ]])
	Launcher.Mem.WriteASM(0x6af8d5,[[
        mov edx,[0x]]..string.format("%x",Address)..[[]
    ]])
    Launcher.Mem.WriteByte(0x70bb47,0)
    Launcher.Mem.WriteByte(0x70bb41,0)
    Launcher.Mem.WriteByte(0x6f6049,0)
	Launcher.Mem.WriteASM(0x42aff0,[[
        ret
    ]])    

end
Launcher.Override.DisablePoints = function()
    Launcher.Mem.WriteASM(0x56F780,"ret")
end
