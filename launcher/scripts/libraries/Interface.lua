Launcher.Interface = {}
Launcher.Interface.Call = function(FunctionName)

    if LauncherInterfaceCallASMBuffer == nil then
        LauncherInterfaceCallOptionBuffer = Launcher.Mem.Alloc(4)
        local ASM = [[
                        push ]]..LauncherInterfaceCallOptionBuffer..[[
                        mov eax,0x4269F0
                        call eax
                    ]]
        LauncherInterfaceCallASMBuffer = Launcher.Mem.AssembleString(ASM)
    end
    LauncherInterfaceCallOptionBuffer = Launcher.Mem.ReAlloc(string.len(FunctionName))
    Launcher.Mem.WriteString(LauncherInterfaceCallOptionBuffer,FunctionName)
    Launcher.Mem.Call(LauncherInterfaceCallASMBuffer)
end