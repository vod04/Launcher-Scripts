**Functions**

**Screen Library**

Function Name | Description | Return
------------------- | --------------------- | -------
Screen.Width() | Retrieve the screen width | Number
Screen.Height() | Retrieve the screen height | Number
Screen.SetRenderTarget(Type, RenderTarget) | Change the current render target. Type: 0 = Texture, 1 = Sprite | Bool
Screen.BeginScene() | Begin a D3D scene | Bool
Screen.EndScene() | End a D3D scene | Nil
Screen.Present() | Render the D3D scene | Nil
Screen.Clear(Color) | Clear the current render target | Nil
Screen.SetRenderState(State, Value) | Set D3D render state | Nil

**Window Library**

Function Name | Description | Return
------------------- | --------------------- | -------
Window.MessageBox(Title, Message) | Display a windows message box | 
Window.SelectBoolean(Title, Message) | Display a boolean message box | Boolean
Window.HasFocus() | Whether or not the game window has the focus | Bool
Window.ShowCursor() | Show the mouse cursor | Nil
Window.HideCursor() | Hide the mouse cursor | Nil