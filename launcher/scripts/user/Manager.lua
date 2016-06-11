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


TextureWidth = 256
TextureHeight = 256
Display = false
TextureCount = 0
SelectedInternal = 0
function DeviceCreatedCallback()
    Font = Launcher.Font.Load("Arial",18) 
    InjectedSprite = Launcher.Sprite.Create(TextureWidth, TextureHeight,0)
end

function Update(CRC)
    if CRC ~= nil then
        if Launcher.Sprite.Loaded(CurrentSprite) then
            Launcher.Sprite.Release(CurrentSprite)
        end
        CurrentSprite = Launcher.Sprite.GetInternal(CRC)
        if CurrentSprite ~= nil then
            CurrentWidth = Launcher.Sprite.Width(CurrentSprite)
            CurrentHeight = Launcher.Sprite.Height(CurrentSprite)
            Launcher.Sprite.Resize(CurrentSprite,TextureWidth, TextureHeight)
            InjectedTexture = Launcher.Texture.GetInjected(CRC,0)
            TextureCount = Launcher.Texture.InternalHandleCount(CRC)
            if InjectedTexture == -1 then
                InjectedScript = Launcher.Texture.GetInjectedScript(CRC,0)
            elseif InjectedTexture ~= nil then
                InjectedWidth = Launcher.Texture.Width(InjectedTexture)
                InjectedHeight = Launcher.Texture.Height(InjectedTexture)
                InjectedScript = Launcher.Texture.GetInjectedScript(CRC,0)
                if not Launcher.Sprite.SetTexture(InjectedSprite,InjectedTexture) then
                    Launcher.Log.Write("SetTexture() failed")
                end
                Launcher.Sprite.Resize(InjectedSprite,TextureWidth,TextureHeight)
            end
        end
    else
        CurrentSprite = nil
        InjectedTexture = nil
        TextureCount = 0
    end
end


function TickCallback()
    local Loop = true, Text, X, Y, MouseX, MouseY, Width, Height, File, Texture
    if Launcher.Input.KeyPressed(VK_T) then
        Display = true
        Launcher.Window.ShowCursor()
        SelectedInternal = 0
        CurrentCRC = Launcher.Texture.SelectInternal(SelectedInternal)
        Update(CurrentCRC)
    end
    while Display do
         MouseX,MouseY = Launcher.Input.CursorPosition()
        if Launcher.Input.KeyPressed(VK_RIGHT) then
            SelectedInternal = SelectedInternal + 1
            if SelectedInternal >= Launcher.Texture.InternalCount() then
                SelectedInternal = 0
            end
            CurrentCRC = Launcher.Texture.SelectInternal(SelectedInternal)
            Update(CurrentCRC)
        elseif Launcher.Input.KeyPressed(VK_LEFT) then
            SelectedInternal = SelectedInternal - 1
            if SelectedInternal < 0 then
                SelectedInternal = Launcher.Texture.InternalCount() - 1
            end
            CurrentCRC = Launcher.Texture.SelectInternal(SelectedInternal)
            Update(CurrentCRC)
        end
        if Launcher.Screen.BeginScene() then
            Launcher.Screen.Clear(0xff0077DD)
            if CurrentSprite ~= nil then
                if InjectedTexture == nil then
                    Width = TextureWidth
                    X = Launcher.Screen.Width()/2 - TextureWidth/2
                    Y = Launcher.Screen.Height()/2 - TextureHeight/2
                    Launcher.Sprite.Draw(CurrentSprite,X,Y)
                    
                    Launcher.Font.DrawText(Font,"Internal Texture",X,Y+TextureHeight+10,0xffffffff)                      
                    Launcher.Font.DrawText(Font,"Dimensions : "..CurrentWidth .. " x " .. CurrentHeight,X,Y+TextureHeight+30,0xffffffff)  
                    Launcher.Font.DrawText(Font,"CRC  : "..CurrentCRC,X,Y+TextureHeight+50,0xffffffff)  
                    
                    if TextureCount > 1 then
                        for I = 0, TextureCount-1 do
                            Launcher.Font.DrawText(Font,"Handle "..tostring(I+1)..": 0x"..string.format("%x", Launcher.Texture.GetInternalHandle(CurrentCRC,I)),X,Y+TextureHeight+70+I*20,0xffffffff)      
                        end
                    else
                        Launcher.Font.DrawText(Font,"Handle: "..": 0x"..string.format("%x", Launcher.Texture.GetInternalHandle(CurrentCRC,0)),X,Y+TextureHeight+70,0xffffffff)      
                    end
                    
                else
                    Width = TextureWidth * 2 + 10
                    X = Launcher.Screen.Width()/2 - Width / 2
                    Y = Launcher.Screen.Height()/2 - TextureHeight/2
                    Launcher.Sprite.Draw(CurrentSprite, X, Y)
                    if InjectedTexture ~= -1 then
                        Launcher.Sprite.Draw(InjectedSprite, X + TextureWidth + 10, Y)
                    end
                    Launcher.Font.DrawText(Font,"Internal Texture",X,Y+TextureHeight+10,0xffffffff)                      
                    Launcher.Font.DrawText(Font,"Dimensions: "..CurrentWidth .. " x " .. CurrentHeight,X,Y+TextureHeight+30,0xffffffff)  
                    Launcher.Font.DrawText(Font,"CRC: "..CurrentCRC,X,Y+TextureHeight+50,0xffffffff)  

                    if TextureCount > 1 then
                        for I = 0, TextureCount-1 do
                            Launcher.Font.DrawText(Font,"Handle "..tostring(I+1)..": 0x"..string.format("%x", Launcher.Texture.GetInternalHandle(CurrentCRC,I)),X,Y+TextureHeight+70+I*20,0xffffffff)      
                        end
                    else
                        Launcher.Font.DrawText(Font,"Handle: "..": 0x"..string.format("%x", Launcher.Texture.GetInternalHandle(CurrentCRC,0)),X,Y+TextureHeight+70,0xffffffff)      
                    end

                    if InjectedTexture ~= -1 then
                        Launcher.Font.DrawText(Font,"Injected by "..InjectedScript,X + TextureWidth + 10,Y+TextureHeight+10,0xffffffff)
                        Launcher.Font.DrawText(Font,"Dimensions: "..InjectedWidth .. " x " .. InjectedHeight,X + TextureWidth + 10,Y+TextureHeight+30,0xffffffff)
                    else
                        Launcher.Font.DrawText(Font,"Hidden by "..InjectedScript,X + TextureWidth + 10,Y+TextureHeight+10,0xffffffff)
                    end
                    if MouseX >=  X + TextureWidth + 10 and MouseY >= Y and MouseX <= X + TextureWidth*2+10 and MouseY <= Y + TextureHeight+10 then
                        if Launcher.Input.KeyPressed(VK_LBUTTON) then
                            InjectedTexture = nil
                            Launcher.Texture.Inject(0,0,CurrentCRC)
                            if Launcher.Filesystem.Filesize("launcher\\media\\textures\\inject\\"..CurrentCRC..".png") ~= nil then
                                if Launcher.Window.SelectBoolean("Permanent?","Would you like to make it permanent? This will delete  .\\media\\user\\textures\\inject\\"..CurrentCRC..".png") then
                                    Launcher.Filesystem.DeleteFile("launcher\\media\\textures\\inject\\"..CurrentCRC..".png")
                                end
                            end
                            Update(CurrentCRC)
                        end
                    end
                end
            end
            Text = "Mouse: "..MouseX..", "..MouseY 
            Launcher.Font.DrawText(Font,Text,5,5,0xffffffff)
            if MouseX >= X and MouseY >= Y and MouseX <= X + TextureWidth and MouseY <= Y + TextureHeight then
                if Launcher.Input.KeyPressed(VK_LBUTTON) then
                    File = Launcher.Filesystem.SelectFile(1, "Inject texture","","Texture|*.png")
                    if File ~= nil then
                        Texture = Launcher.Texture.Load(File)
                        if Texture ~= nil then
                            InjectedTexture = Texture
                            Launcher.Sprite.SetTexture(InjectedSprite,InjectedTexture)
                            Launcher.Sprite.Resize(InjectedSprite, TextureWidth, TextureHeight)
                            InjectedWidth = Launcher.Texture.Width(InjectedTexture)
                            InjectedHeight = Launcher.Texture.Height(InjectedTexture)
                            Launcher.Texture.Inject(InjectedTexture,0,CurrentCRC)
                            if Launcher.Window.SelectBoolean("Permanent?","Would you like to make it permanent? This will copy the texture to .\\media\\user\textures\\inject\\") then
                                Launcher.Filesystem.CopyFile(File,"launcher\\media\\textures\\inject\\"..CurrentCRC..".png")
                            end
                            Update(CurrentCRC)
                        end
                    end
                elseif Launcher.Input.KeyPressed(VK_RBUTTON) then
                    File = Launcher.Filesystem.SelectFile(0, "Dump texture",CurrentCRC..".dds","Texture|*.dds;*.png")
                    if File ~= nil then
                        Launcher.Sprite.Save(CurrentSprite,File)                            
                    end
                elseif Launcher.Input.KeyPressed(VK_MBUTTON) then
                    if InjectedTexture == -1 then
                        Launcher.Texture.Inject(0,0,CurrentCRC)
                    else
                        Launcher.Texture.Inject(-1,0,CurrentCRC)
                    end
                    Update(CurrentCRC)
                end
            end
            Launcher.Screen.EndScene()
        end
        Launcher.Screen.Present()
        Launcher.System.Sleep(1)

        if Launcher.Input.KeyPressed(VK_T) or Launcher.Input.KeyPressed(VK_ESCAPE) then
            Display = false
            if not Launcher.Game.Paused() then
                Launcher.Window.HideCursor()
            end
        end
    end
end
Launcher.Callback.Register("DeviceCreated",DeviceCreatedCallback)
Launcher.Callback.Register("Tick",TickCallback)