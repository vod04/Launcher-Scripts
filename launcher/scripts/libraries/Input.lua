KEY_ACTION_UP = 0
KEY_ACTION_DOWN = 1
KEY_ACTION_LEFT = 2
KEY_ACTION_RIGHT = 3
KEY_ACTION_PASS = 4
KEY_ACTION_SAUCER = 5
KEY_ACTION_SHOOT = 6
KEY_ACTION_DEKE = 7
KEY_ACTION_PAUSE = 8
KEY_ACTION_FIGHT = 9
KEY_ACTION_HOOK = 10
KEY_ACTION_BURST = 13
KEY_ACTION_MODIFIER = 14
KEY_ACTION_LINECHANGE = 15
KEY_ACTION_SHOOTDEKE = 16




Launcher.Input.DefineKey = function(Key,Action)
    Launcher.Mem.WriteShort(0x78ecf0 + Action * 2,Key)
end
Launcher.Input.DefineButton = function(Button,Action)
    Launcher.Mem.WriteShort(0x752c78 + Button * 2,Action)
end
Launcher.Input.GetButton = function(Button)
    return Launcher.Mem.Short(0x752c78 + Button * 2)
end