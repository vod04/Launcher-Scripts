**Internal Functions**

**Screen Library**

Function Name | Description | Return
------------------- | --------------------- | -------
Screen.Width() | Retrieve the screen width | Number
Screen.Height() | Retrieve the screen height | Number
Screen.BeginScene() | Begin a D3D scene | Boolean
Screen.EndScene() | End a D3D scene | Nil
Screen.Present() | Render the D3D scene | Nil
Screen.Clear(nColor) | Clear the current render target using the given color | Nil
Screen.SetRenderState(nState, nValue) | Set D3D render state | Nil
Screen.SetRenderTarget(nType, nRenderTarget) | Change the current render target. Type: 0 = Texture, 1 = Sprite. Render target is either a texture or sprite handle | Boolean
Screen.SaveScreenshot(sPath) | Save a screenshot to the given path. | Nil

**Window Library**

Function Name | Description | Return
------------------- | --------------------- | -------
Window.MessageBox(sTitle, sMessage) | Display a windows message box (Not advised in fullscreen exclusive) | Nil
Window.SelectBoolean(sTitle, sMessage) | Displays a boolean message box. This allows the user to select "yes" or "no". (Not advised in fullscreen exclusive) | Boolean
Window.HasFocus() | Whether or not the game window has the focus | Boolean
Window.ShowCursor() | Show the mouse cursor | Nil
Window.HideCursor() | Hide the mouse cursor | Nil
Window.Update() | Update the game window | Nil

**Callback Library**

Function Name | Description | Return
------------------- | --------------------- | -------
Callback.Register(sCallbackEvent,fLuaFunction) | Create a callback and return a handle | iCallbackHandle
Callback.Remove(inCallbackNameOrHandle) | Remove a callback | Nil
Callback.Trigger(isCallbackNameOrHandle) | Trigger a callback | Nil
Callback.Count(isCallbackNameOrHandle) | Count the number of active callbacks | Number
Callback.Create(sCallbackName) | Create a new callback which you can trigger using Callback.Trigger() | 
Callback.SetPriority(nPriority) | Set the priority of this script for recieving callbacks. A higher value will recieve them first | Nil

**Sprite Library**

Function Name | Description | Return
------------------- | --------------------- | -------
Sprite.Load(sPath) | Loads an image file and returns a sprite handle | iSpriteHandle
Sprite.Loaded(iSpriteHandle) | Returns true if the 2D sprite is loaded, otherwise false | Boolean
Sprite.Create(iWidth, iHeight, bRenderTarget) | Create a new 2D sprite and return the sprite handle. Set RenderTarget to true if you plan on using this sprite as a render target | iSpriteHandle
Sprite.Draw(iSpriteHandle,iX,iY,[nRotation,[iBlendColor]]) | Draw a 2D sprite to the current render target | Nil
Sprite.Clip(iSpriteHandle,iX,iY,iWidth,iHeight) | Clip the drawing region of the 2D sprite to the given coordinates | Nil
Sprite.Scale(iSpriteHandle,nX,nY) | Scale the sprite using X and Y multiplier | Nil
Sprite.Resize(iSpriteHandle,iWidth,iHeight) | Resize the sprite to the given width and height | Nil
Sprite.Begin(iSpriteHandle) | If you plan on drawing a sprite multiple times, calling this function may improve performance | Nil
Sprite.End(iSpriteHandle) | Must be called after calling Sprite.Begin() | Nil
Sprite.Width(iSpriteHandle) | Return the width of the given sprite | Integer
Sprite.Height(iSpriteHandle) | Return the height of the given sprite | Integer
Sprite.Save(iSpriteHandle,sPath) | Save the loaded sprite to the filesystem |  Nil
Sprite.Release(iSpriteHandle) | Unload the sprite from memory. The sprite handle will no longer be valid | Nil
Sprite.SetTexture(iSpriteHandle,iTextureHandle)| Change the texture of the given sprite to the given texture | Nil
Sprite.SetCenter(iSpriteHandle,nX,nY)| Set the rotation center of the given sprite | Nil

**Texture Library**

Function Name | Description | Return
------------------- | --------------------- | -------
Texture.Load(sPath) | Loads a D3D texture and returns a texture handle | iTextureHandle
Texture.Width(iTextureHandle) | Returns the width of the texture | Integer
Texture.Height(iTextureHandle) | Returns the height of the texture | Integer
Texture.Create(iWidth,iHeight,bRenderTarget) | Create a texture and return the texture handle. Set RenderTarget to true if you plan on using this texture as a render target | Integer
Texture.Inject(iTextureHandle, sFSHID) | Replace an in-game NHL 2004 texture with a launcher texture using the fsh ID. This is done in memory, not permanent | Nil
Texture.SetFilter(sFSHID,iFilter) | Set the Anisotropic filter of the given NHL 2004 object based on the fsh ID |  Nil
Texture.Release(iTextureHandle) | Unload the texture from memory. The texture handle will no longer be valid |  Nil
Texture.Loaded(iTextureHandle) | Returns true if the texture is loaded, otherwise false | Boolean
Texture.Save(iTextureHandle, sPath) | Save the loaded texture to the filesystem | Nil

**Font Library**

Function Name | Description | Return
------------------- | --------------------- | -------
Font.Load(sFamily, iSize, [iWeight, [bItalic, [bUnderline,  [bStrikeOut, [bAntialiasing]]]]]) | Loads a font and returns a font handle | iFontHandle
Font.TextWidth(iFontHandle, sText) | Calculates the text width in pixels | Number
Font.TextHeight(iFontHandle, sText) | Calculates the text width in pixels | Number
Font.DrawText(iFontHandle, sText, iX, iY, iColor) | Draw the given text to the current render target | Nil
Font.Release(iFontHandle) | Unloads the font from memory. The font handle will no longer be valid | Nil
Font.Loaded(iFontHandle) | Returns true if the font is loaded, otherwise false | Boolean
Font.AddFile(sPath) | Loads an external font file using standard font formats | Boolean

**Sound Library

Function Name | Description | Return
------------------- | --------------------- | -------
Sound.Load(sPath) | Loads a sound file and returns a sound handle | iSoundHandle
Sound.Release(iSoundHandle) | Unload the sound from memory. The sound handle will no longer be valid | iSoundHandle
Sound.Play(iSoundHandle) | Begin playback of the given sound | Nil
Sound.Stop(iSoundHandle) | Stop playback of the given sound | Nil
Sound.Pause(iSoundHandle) | Pause playback of the given sound | Nil
Sound.FadeVolume(iSoundHandle, fVolume, iDuration) | Fade the volume of the sound to the given value for the given duration | Nil
Sound.SetVolume(iSoundHandle, fVolume) | Set the volume of the sound | Nil
Sound.Volume(iSoundHandle) | Returns the current volume of the sound | Number
Sound.Length(iSoundHandle) | Returns the length in seconds of the sound | Integer
Sound.Position(iSoundHandle) | Returns the current position in seconds of the sound | Integer
Sound.Seek(iSoundHandle, iSeconds) | Seek the sound playback to the given seconds | Integer
Sound.Status(iSoundHandle) | Returns the current playback status | Integer
Sound.Loaded(iSoundHandle) | Returns true if the sound is loaded, otherwise fale | Boolean

**Log Library

Function Name | Description | Return
------------------- | --------------------- | -------
Log.Write(sString) | Write the string to the log file | Nil

**Environment Variable Library
Environment variables are variables that are persistant across all loaded scripts. They are referenced using a unique key.

Function Name | Description | Return
------------------- | --------------------- | -------
Env.SetString(sKey, sValue) | Set the environment variable defined by sKey to the given string value | Nil
Env.String(sKey) | Retrieve the environment string value of the given key | Nil
Env.SetNumber(sKey, nValue) | Set the environment variable defined by sKey to the given numerical value | Nil
Env.Number(sKey, nValue) | Retrieve the environment numerical value of the given key | Nil
