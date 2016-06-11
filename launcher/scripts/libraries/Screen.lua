Launcher.Screen.DefaultRenderTargetSurface = function()
    if LauncherGlobal.DefaultRenderTargetSurfaceASM == nil then
        LauncherGlobal.DefaultRenderTargetSurfaceAddress = Launcher.Mem.Alloc(4)
        local ASMString = [[
            pushad
            mov eax,[0x7CCD70]
            mov eax,[eax+0xf4]
            mov dword []]..LauncherGlobal.DefaultRenderTargetSurfaceAddress..[[],eax
            popad
            ret
        ]]
        LauncherGlobal.DefaultRenderTargetSurfaceASM = Launcher.Mem.AssembleString(ASMString)
    end
    Launcher.Mem.Call(LauncherGlobal.DefaultRenderTargetSurfaceASM)
    return Launcher.Mem.Long(LauncherGlobal.DefaultRenderTargetSurfaceAddress)
end
Launcher.Screen.DefaultRenderTargetStencil = function()
    if LauncherGlobal.DefaultRenderTargetStencilASM == nil then
        LauncherGlobal.DefaultRenderTargetStencilAddress = Launcher.Mem.Alloc(4)
        local ASMString = [[
            pushad
            mov eax,[0x7CCD70]
            mov eax,[eax+0xf4]
            mov dword []]..LauncherGlobal.DefaultRenderTargetStencilAddress..[[],eax
            popad
            ret
        ]]
        LauncherGlobal.DefaultRenderTargetStencilASM = Launcher.Mem.AssembleString(ASMString)
    end
    Launcher.Mem.Call(LauncherGlobal.DefaultRenderTargetStencilASM)
    return Launcher.Mem.Long(LauncherGlobal.DefaultRenderTargetStencilAddress)
end
Launcher.Screen.ResetRenderTarget = function()
    Launcher.Screen.SetRenderTarget(2,Launcher.Screen.DefaultRenderTargetSurface(),Launcher.Screen.DefaultRenderTargetStencil())
end