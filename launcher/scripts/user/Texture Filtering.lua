DeviceCreatedCallback = function()
    local Filtering = Launcher.Config.Int("filtering",0)
    Launcher.Texture.SetFilter("L256",Filtering)
    Launcher.Texture.SetFilter("SNOW",Filtering)
    Launcher.Texture.SetFilter("SCRH",Filtering)
end
if Launcher.Config.Bool("selectivefiltering",false) then
    Launcher.Callback.Register("DeviceCreated",DeviceCreatedCallback)
end