PLAYER_ATTRIB_SPEED = 0
PLAYER_ATTRIB_ACCELERATION = 1
PLAYER_ATTRIB_AGILITY = 2
Launcher.Player.FirstName = function (PlayerID)
	local Address
	local Team = 0
	if PlayerID == -1 then
		return nil
	end
	if PlayerID > 19 then
		Team = 1
	end
	Address = 0x7A8808 + Team * 0x6A8 + 0x4C * PlayerID + 0x8
	return Launcher.Mem.String(Address)
end
Launcher.Player.LastName = function (PlayerID)
	local Address
	local Team = 0
	if PlayerID == -1 then
		return nil
	end
	if PlayerID > 19 then
		Team = 1
	end
	Address = 0x7A8808 + Team * 0x6A8 + 0x4C * PlayerID + 0x18
	return Launcher.Mem.String(Address)
end
Launcher.Player.Number = function (PlayerID)
    local Pointer = Launcher.Mem.Long(0x79C310+PlayerID*4) + 0x78
end
Launcher.Player.Attribute = function (PlayerID,Attribute)
    local Pointer = Launcher.Mem.Long(0x79C310+PlayerID*4) + 0x7C
    return Launcher.Mem.Byte(Pointer+Attribute)
end