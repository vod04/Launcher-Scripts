Launcher.Screen.DefaultRenderTargetSurface = function()
    local Address = Launcher.Mem.Long(0x7CCD70) + 0xf8
    return Launcher.Mem.Long(Address)
end
Launcher.Screen.DefaultRenderTargetStencil = function()
    local Address = Launcher.Mem.Long(0x7CCD70) + 0xf8
    return Launcher.Mem.Long(Address)
end
Launcher.Screen.ResetRenderTarget = function()
    local Surface = Launcher.Screen.DefaultRenderTargetSurface()
    local Stencil = Launcher.Screen.DefaultRenderTargetStencil()
end