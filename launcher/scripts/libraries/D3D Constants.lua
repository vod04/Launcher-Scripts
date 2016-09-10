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


D3D_OK = 0

D3DBLEND_ZERO               = 1
D3DBLEND_ONE                = 2
D3DBLEND_SRCCOLOR           = 3
D3DBLEND_INVSRCCOLOR        = 4
D3DBLEND_SRCALPHA           = 5
D3DBLEND_INVSRCALPHA        = 6
D3DBLEND_DESTALPHA          = 7
D3DBLEND_INVDESTALPHA       = 8
D3DBLEND_DESTCOLOR          = 9
D3DBLEND_INVDESTCOLOR       = 10
D3DBLEND_SRCALPHASAT        = 11
D3DBLEND_BOTHSRCALPHA       = 12
D3DBLEND_BOTHINVSRCALPHA    = 13



D3DBLENDOP_ADD              = 1
D3DBLENDOP_SUBTRACT         = 2
D3DBLENDOP_REVSUBTRACT      = 3
D3DBLENDOP_MIN              = 4
D3DBLENDOP_MAX              = 5

D3DRS_ZENABLE                   = 7    -- D3DZBUFFERTYPE (or TRUE/FALSE for legacy)
D3DRS_FILLMODE                  = 8    -- D3DFILLMODE
D3DRS_SHADEMODE                 = 9    -- D3DSHADEMODE
D3DRS_LINEPATTERN               = 10   -- D3DLINEPATTERN
D3DRS_ZWRITEENABLE              = 14   -- TRUE to enable z writes
D3DRS_ALPHATESTENABLE           = 15   -- TRUE to enable alpha tests
D3DRS_LASTPIXEL                 = 16   -- TRUE for last-pixel on lines
D3DRS_SRCBLEND                  = 19   -- D3DBLEND
D3DRS_DESTBLEND                 = 20   -- D3DBLEND
D3DRS_CULLMODE                  = 22   -- D3DCULL
D3DRS_ZFUNC                     = 23   -- D3DCMPFUNC
D3DRS_ALPHAREF                  = 24   -- D3DFIXED
D3DRS_ALPHAFUNC                 = 25   -- D3DCMPFUNC
D3DRS_DITHERENABLE              = 26   -- TRUE to enable dithering
D3DRS_ALPHABLENDENABLE          = 27   -- TRUE to enable alpha blending
D3DRS_FOGENABLE                 = 28   -- TRUE to enable fog blending
D3DRS_SPECULARENABLE            = 29   -- TRUE to enable specular
D3DRS_ZVISIBLE                  = 30   -- TRUE to enable z checking
D3DRS_FOGCOLOR                  = 34   -- D3DCOLOR
D3DRS_FOGTABLEMODE              = 35   -- D3DFOGMODE
D3DRS_FOGSTART                  = 36   -- Fog start (for both vertex and pixel fog)
D3DRS_FOGEND                    = 37   -- Fog end     
D3DRS_FOGDENSITY                = 38   -- Fog density 
D3DRS_EDGEANTIALIAS             = 40   -- TRUE to enable edge antialiasing
D3DRS_ZBIAS                     = 47   -- LONG Z bias
D3DRS_RANGEFOGENABLE            = 48   -- Enables range-based fog
D3DRS_STENCILENABLE             = 52   -- BOOL enable/disable stenciling
D3DRS_STENCILFAIL               = 53   -- D3DSTENCILOP to do if stencil test fails
D3DRS_STENCILZFAIL              = 54   -- D3DSTENCILOP to do if stencil test passes and Z test fails
D3DRS_STENCILPASS               = 55   -- D3DSTENCILOP to do if both stencil and Z tests pass
D3DRS_STENCILFUNC               = 56   -- D3DCMPFUNC fn.  Stencil Test passes if ((ref & mask) stencilfn (stencil & mask)) is true
D3DRS_STENCILREF                = 57   -- Reference value used in stencil test
D3DRS_STENCILMASK               = 58   -- Mask value used in stencil test
D3DRS_STENCILWRITEMASK          = 59   -- Write mask applied to values written to stencil buffer
D3DRS_TEXTUREFACTOR             = 60   -- D3DCOLOR used for multi-texture blend
D3DRS_WRAP0                     = 128  -- wrap for 1st texture coord. set
D3DRS_WRAP1                     = 129  -- wrap for 2nd texture coord. set
D3DRS_WRAP2                     = 130  -- wrap for 3rd texture coord. set
D3DRS_WRAP3                     = 131  -- wrap for 4th texture coord. set
D3DRS_WRAP4                     = 132  -- wrap for 5th texture coord. set
D3DRS_WRAP5                     = 133  -- wrap for 6th texture coord. set
D3DRS_WRAP6                     = 134  -- wrap for 7th texture coord. set
D3DRS_WRAP7                     = 135  -- wrap for 8th texture coord. set
D3DRS_CLIPPING                  = 136
D3DRS_LIGHTING                  = 137
D3DRS_AMBIENT                   = 139
D3DRS_FOGVERTEXMODE             = 140
D3DRS_COLORVERTEX               = 141
D3DRS_LOCALVIEWER               = 142
D3DRS_NORMALIZENORMALS          = 143
D3DRS_DIFFUSEMATERIALSOURCE     = 145
D3DRS_SPECULARMATERIALSOURCE    = 146
D3DRS_AMBIENTMATERIALSOURCE     = 147
D3DRS_EMISSIVEMATERIALSOURCE    = 148
D3DRS_VERTEXBLEND               = 151
D3DRS_CLIPPLANEENABLE           = 152
D3DRS_SOFTWAREVERTEXPROCESSING  = 153
D3DRS_POINTSIZE                 = 154   -- float point size
D3DRS_POINTSIZE_MIN             = 155   -- float point size min threshold
D3DRS_POINTSPRITEENABLE         = 156   -- BOOL point texture coord control
D3DRS_POINTSCALEENABLE          = 157   -- BOOL point size scale enable
D3DRS_POINTSCALE_A              = 158   -- float point attenuation A value
D3DRS_POINTSCALE_B              = 159   -- float point attenuation B value
D3DRS_POINTSCALE_C              = 160   -- float point attenuation C value
D3DRS_MULTISAMPLEANTIALIAS      = 161  -- BOOL - set to do FSAA with multisample buffer
D3DRS_MULTISAMPLEMASK           = 162  -- DWORD - per-sample enable/disable
D3DRS_PATCHEDGESTYLE            = 163  -- Sets whether patch edges will use float style tessellation
D3DRS_PATCHSEGMENTS             = 164  -- Number of segments per edge when drawing patches
D3DRS_DEBUGMONITORTOKEN         = 165  -- DEBUG ONLY - token to debug monitor
D3DRS_POINTSIZE_MAX             = 166   -- float point size max threshold
D3DRS_INDEXEDVERTEXBLENDENABLE  = 167
D3DRS_COLORWRITEENABLE          = 168  -- per-channel write enable
D3DRS_TWEENFACTOR               = 170   -- float tween factor
D3DRS_BLENDOP                   = 171   -- D3DBLENDOP setting
D3DRS_POSITIONORDER             = 172   -- NPatch position interpolation order. D3DORDER_LINEAR or D3DORDER_CUBIC (default)
D3DRS_NORMALORDER               = 173   -- NPatch normal interpolation order. D3DORDER_LINEAR (default) or D3DORDER_QUADRATIC

function ARGB(A, R, G, B)
	return bit32.bor(bit32.lshift(bit32.band(math.floor(A),0xFF),24) , bit32.lshift(bit32.band(math.floor(R),0xFF),16) , bit32.lshift(bit32.band(math.floor(G) , 0xFF),8) , bit32.band(math.floor(B) , 0xFF))
end
function RGBA(R, G, B, A)
	return ARGB(A, R, G, B)
end

function Alpha(Color)
    return bit32.band(bit32.rshift(Color,24),0xFF);
end
function Red(Color)
    return bit32.band(bit32.rshift(Color,16),0xFF);
end
function Green(Color)
    return bit32.band(bit32.rshift(Color,8),0xFF);
end
function Blue(Color)
    return bit32.band(Color,0xFF);
end
