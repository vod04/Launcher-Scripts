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


IceSprite = 0
IceTexture = 0
IceDarkSprite = 0
LogoBWSprite = 0
BufferSprite = 0
Rotation = 0
Scale = 2
Light = {}
RenderTimer = 0


TextureCRC = {}
TextureCRC[6] = 1491449550 -- Chicago
TeamID = 0
AniTimer = nil
function AddLight(x,y)
	table.insert(Light,{x=x,y=y,rotation=0,angle=0,distance=150})
	table.insert(Light,{x=x,y=y,rotation=0,angle=180,distance=150})
end

AddLight(1703,732)
AddLight(1703,288)
AddLight(345,732)
AddLight(345,288)
AddLight(1024,512)

function Timer()
    IceSprite = Launcher.Sprite.GetInternal(TextureCRC[TeamID])
    if IceSprite ~= nil then
        IceTexture = Launcher.Texture.Create(2048,1024,1)
        BufferSprite = Launcher.Sprite.Create(2048,1024,1)
        IceDarkSprite = Launcher.Sprite.Load("launcher\\media\\textures\\ice animations\\"..HomeAbbreviation .."\\icedark.png")
        LogoBWSprite = Launcher.Sprite.Load("launcher\\media\\textures\\ice animations\\"..HomeAbbreviation .."\\logobw.png")
        Launcher.Screen.SetRenderTarget(0,IceTexture)
        if Launcher.Screen.BeginScene() then
            Launcher.Sprite.Draw(IceSprite,0,0)
            Launcher.Screen.EndScene()
        end
        Launcher.Screen.ResetRenderTarget()
        Launcher.Texture.Inject(IceTexture,0,TextureCRC[TeamID])
        Launcher.Callback.Register("Tick",TickCallback)
        Launcher.Callback.Register("PlayStarted",PlayStartedCallback)
        Launcher.Callback.Register("DeviceRecovered",DeviceRecoveredCallback)
    else
        Launcher.Timer.SetTimeout(100,Timer)
    end
end
function LoadingCompleteCallback()
	if TextureCRC ~= nil then
        IceSprite = nil
		TeamID = Launcher.Game.HomeTeamID()
        HomeAbbreviation = Launcher.Game.HomeNameAbbreviation()
		if TextureCRC[TeamID] ~= nil then
            Launcher.Timer.SetTimeout(100,Timer)
		end
	end

end
function DeviceRecoveredCallback()
    if AniTimer ~= nil then
        Launcher.Screen.SetRenderTarget(0,IceTexture)
        if Launcher.Screen.BeginScene() then
            Launcher.Sprite.Draw(IceSprite,0,0)
            Launcher.Screen.EndScene()
        end
        Launcher.Screen.ResetRenderTarget()	
    end
end
function TickCallback()
	if Launcher.Game.InCutscene() then
		Launcher.Screen.SetRenderTarget(0,IceTexture)
		if Launcher.Screen.BeginScene() then
			Launcher.Sprite.Draw(IceSprite,0,0)
			Launcher.Screen.EndScene()
		end
		Launcher.Screen.ResetRenderTarget()
		return
	end
	if Launcher.System.Time() >= RenderTimer and not Launcher.Game.Paused() then

		RenderTimer = Launcher.System.Time() + 10
		Launcher.Screen.SetRenderTarget(1,BufferSprite)
		if Launcher.Screen.BeginScene() then
			Launcher.Screen.Clear(0x00ffffff)
			Launcher.Sprite.Draw(IceDarkSprite,0,0)
			Launcher.Sprite.Scale(LogoBWSprite,Scale,Scale)
			if Launcher.Sprite.Begin(LogoBWSprite) then
				Launcher.Screen.SetRenderState(D3DRS_ALPHABLENDENABLE,1) --Alphablendenable
				Launcher.Screen.SetRenderState(D3DRS_BLENDOP,D3DBLENDOP_ADD  ) -- BlendOp
				Launcher.Screen.SetRenderState(D3DRS_SRCBLEND ,D3DBLEND_DESTALPHA) -- Srcblend
				Launcher.Screen.SetRenderState(D3DRS_DESTBLEND ,D3DBLEND_ONE) -- Destblend
				Launcher.Screen.SetRenderState(D3DRS_ALPHATESTENABLE ,1);
				if Launcher.Game.PlayStopped() then
					for k,v in pairs(Light) do
						
							v.rotation = v.rotation + 0.15
							v.rotation = v.rotation % 360
							v.angle = v.angle + 2
							v.angle = v.angle % 360
							Launcher.Sprite.Draw(LogoBWSprite,(v.x - Launcher.Sprite.Width(LogoBWSprite) / 2) + math.cos(v.angle * 0.0174532925) * v.distance,(v.y - Launcher.Sprite.Height(LogoBWSprite) / 2) + math.sin(v.angle * 0.0174532925) * v.distance  * -1 ,v.rotation)
						
					end
				else
					Launcher.Sprite.Draw(LogoBWSprite,1024-Launcher.Sprite.Width(LogoBWSprite)/2,512-Launcher.Sprite.Height(LogoBWSprite)/2)
				end
                Launcher.Sprite.End(LogoBWSprite)
            end
			Launcher.Screen.EndScene()
		end
		Launcher.Screen.SetRenderTarget(0,IceTexture)
		if Launcher.Screen.BeginScene() then
			Launcher.Sprite.Draw(IceSprite,0,0)
			Launcher.Sprite.Begin(BufferSprite)
				Launcher.Screen.SetRenderState(D3DRS_ALPHABLENDENABLE,1)
				Launcher.Screen.SetRenderState(D3DRS_BLENDOP,D3DBLENDOP_ADD  ) -- BlendOp
				Launcher.Screen.SetRenderState(D3DRS_SRCBLEND ,D3DBLEND_ZERO) -- Srcblend
				Launcher.Screen.SetRenderState(D3DRS_DESTBLEND ,D3DBLEND_SRCCOLOR) -- Destblend
				Launcher.Screen.SetRenderState(D3DRS_ALPHATESTENABLE ,1);					
				Launcher.Sprite.Draw(BufferSprite,0,0)
				

			Launcher.Sprite.End(BufferSprite)
			Launcher.Screen.EndScene()
		end
		Launcher.Screen.ResetRenderTarget()
	end
end
function CenterTimer()
    Launcher.Callback.Remove("Tick")
	Launcher.Screen.ResetRenderTarget()
    Launcher.Texture.Inject(0,0,TextureCRC[TeamID])
	AniTimer = nil
end
function PlayStartedCallback()
	Launcher.Callback.Remove("PlayStarted")
	AniTimer = Launcher.Timer.SetTimeout(100,CenterTimer)
	RenderTimer = 0
	TickCallback()
end
function DeviceReleasedCallback()
	Launcher.Callback.Remove("Tick")
	Launcher.Callback.Remove("PlayStarted")
	Launcher.Callback.Remove("DeviceRecovered")
	if AniTimer ~= nil then
		Launcher.Timer.Release(AniTimer)
		AniTimer = nil
	end
end


Launcher.Callback.Register("DeviceReleased",DeviceReleasedCallback)
Launcher.Callback.Register("LoadingComplete",LoadingCompleteCallback)
