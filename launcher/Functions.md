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

**Sound Library**

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

**Log Library**

Function Name | Description | Return
------------------- | --------------------- | -------
Log.Write(sString) | Write the string to the log file | Nil

**Environment Variable Library**

Environment variables are variables that are persistant across all loaded scripts. They are referenced using a unique key.

Function Name | Description | Return
------------------- | --------------------- | -------
Env.SetString(sKey, sValue) | Set the environment variable defined by sKey to the given string value | Nil
Env.String(sKey) | Retrieve the environment string value of the given key | String
Env.SetNumber(sKey, nValue) | Set the environment variable defined by sKey to the given numerical value | Nil
Env.Number(sKey, nValue) | Retrieve the environment numerical value of the given key | Number

**Input Library**

Function Name | Description | Return
------------------- | --------------------- | -------
Input.KeyDown(iKeyCode, bAsync) | Returns true if the given keyboard key or mouse button is currently down. If bAsync is true, it will work even if the window does not have focus | Boolean
Input.KeyPressed(iKeyCode, bAsync) | Returns true if the given keyboard key or mouse button was pressed. If bAsync is true, it will work even if the window does not have focus | Boolean
Input.CursorPosition() | Returns both the x and y coordinates of the mouse cursor within the game window. | Integer, Integer
Input.CursorX() | Returns the x coordinate of the mouse cursor within the game window | Integer
Input.CursorY() | Returns the y coordinate of the mouse cursor within the game window | Integer

**XInput Library**

Function Name | Description | Return
------------------- | --------------------- | -------
XInput.BatteryLevel(iIndex, iType) | Returns the current battery level. Please refer to xinput.lua for the valid iType constants | Integer
XInput.SetVibration(iIndex, iLeftVibration, iRightVibration) | Sets the left and right vibration of the controller. The range is 0-65530. You must manually set it to zero again to stop it.  | Nil
XInput.KeyStroke(iIndex, iKeyCode) | Returns the keystroke value of the given key | Integer
XInput.GetState(iIndex) | Under construction | Integer

**Memory Library**

Function Name | Description | Return
------------------- | --------------------- | -------
Mem.WriteByte(iByte, iAddress) | Write the byte to the given memory address of the game | Nil
Mem.WriteShort(iShort, iAddress) | Write the short integer (2 bytes) to the given memory address of the game | Nil
Mem.WriteLong(iLong, iAddress) | Write the long integer (4 bytes) to the given memory address of the game | Nil
Mem.WriteLong(nFloat, iAddress) | Write the float (4 bytes) to the given memory address of the game | Nil
Mem.WriteQuad(iQuad, iAddress) | Write the quad integer (8 bytes) to the given memory address of the game | Nil
Mem.WriteDouble(nDouble, iAddress) | Write the double-precision float (8 bytes) to the given memory address of the game | Nil
Mem.WriteString(sString, iAddress) | Write the string to the given memory address of the game | Nil
Mem.Byte(iAddress) | Return the byte at the given memory address of the game | Integer
Mem.Short(iAddress) | Return the short integer (2 bytes) at the given memory address of the game | Integer
Mem.Long(iAddress) | Return the long integer (4 bytes) at the given memory address of the game | Integer
Mem.Float(iAddress) | Return the float (4 bytes) at the given memory address of the game | Number
Mem.Quad(iAddress) | Return the quad integer (8 bytes) at the given memory address of the game | Integer
Mem.Double(iAddress) | Return the double precision float (8 bytes) at the given memory address of the game | Number
Mem.String(iAddress) | Return the string at the given memory address of the game | String
Mem.Bool(iAddress) | Returns false if the byte at the given memory address of the game is 0, otherwise true | Boolean
Mem.Alloc(Size) | Allocates virtual memory and returns the address | iAddress
Mem.AllocString(sString) | Allocates virtual memory, writes the given string, and then returns the address | iAddress
Mem.Release(iAddress) | Releases the previously allocated virtual memory. The Address will no longer be valid | Nil
Mem.AssembleString(sASMString) | Assembles the ASM code in sASMString, writes the machine code to executable memory and returns the address  | iAddress
Mem.Copy(iAddress1, iAddress2, iLength) | Copies the memory contents of iAddress 1 to iAddress2 using the iLength parameter | Nil
Mem.Call(iAddress) | Pushes the current instruction pointer to the stack and jumps to the given iAddress | Nil
Mem.Size(iAddress) | Returns the size of the previously allocated memory | Integer

**System Library**

Function Name | Description | Return
------------------- | --------------------- | -------
System.Time([Precision]) | Retreive the system time since boot. Precision is a value between 0 and 2. 0 uses ticks (Milliseconds), 1 uses media timer (Milliseconds), 2 uses high-resolution timer (Nanoseconds) | Nil
System.SetClipboard(sText) | Set the clipboard text to the given string | nil
System.Sleep(iMilliseconds) | Tell the CPU to sleep for the given milliseconds | nil
System.DocsPath() | Returns the My Documents path associated with the running game | String

**Config Library**

This library is for reading values from Launcher.ini

Function Name | Description | Return
------------------- | --------------------- | -------
Launcher.Config.Int[eger](sKey, iDefault) | Returns the integer config value defined by sKey. If the key does not exist in launcher.ini, it will return iDefault | Integer
Launcher.Config.Number(sKey, nDefault) | Returns the numerical config value defined by sKey. If the key does not exist in launcher.ini, it will return nDefault | Number
Launcher.Config.String(sKey, sDefault) | Returns the string config value defined by sKey. If the key does not exist in launcher.ini, it will return sDefault | String
Launcher.Config.Boolean(sKey, bDefault) | Returns the boolean config value defined by sKey (true|false, 0|1, yes|no). If the key does not exist in launcher.ini, it will return bDefault | Boolean
Launcher.Config.Color(sKey, iDefault) | Returns a color config value defined by sKey. Supports #hex, rgb(), rgba(). If the key does not exist in launcher.ini, it will return nDefault | Integer


**Timer Library**

Function Name | Description | Return
------------------- | --------------------- | -------
Timer.SetInterval(iMilliseconds, fLuaFunction) | Repeatedly call the given Lua function every [iMilliseconds] | iTimerHandle
Timer.SetTimeout(iMilliseconds, fLuaFunction) | Call the given Lua function once after iMilliseconds as elapsed | iTimerHandle
Timer.Release(iTimerHandle) | Stop and release the given timer. The handle will no longer be valid | Nil

**Filesystem**

Function Name | Description | Return
------------------- | --------------------- | -------
Filesystem.DirectoryExists(sPath) | Returns true if the given directory exists, otherwise false | Boolean
Filesystem.FileExists(sPath) | Returns true if the given file exists, otherwise false | Boolean
Filesystem.FileSize(sPath) | Returns the file size of the given file | Integer
Filesystem.FileExtension(sPath) | Returns the file extension of the given file | String
Filesystem.CopyFile(sPath1, sPath2) | Copy the file at sPath1 to sPath2 | Nil
Filesystem.SelectFile(bOpen, sTitle, sDefaultFile, sPattern) | Opens a file selection window. Returns the selected file. If bOpen is true, the file selector will be for opening a file, otherwise it's for saving a file. | String
Filesystem.DeleteFile(sPath) | Permanently deletes the file at the given path. Use with caution | String
Filesystem.EnumerateFiles(sPath, sPattern) | Begin enumerating files in the given path based on the given pattern and returns a directory handle | iFileEnumHandle
Filesystem.EnumerateNextFile(iFileEnumHandle) | Enumerates to the next file. Returns false if there is no more files, otherwise true | Boolean
Filesystem.EnumeratedFileName(iFileEnumHandle) | Returns the filename of the current enumerated file | String
Filesystem.EnumeratedIsDirectory(iFileEnumHandle) | Returns true if the current enumerated object is a directory, false if it's a file | Boolean
Filesystem.EnumeratedFilesFinish(iFileEnumHandle) | Finish file enumeration. The file enumeration handle will no longer be valid | Nil
