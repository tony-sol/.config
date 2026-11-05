---@diagnostic disable:undefined-global
local permission = hl.permission
---@diagnostic enable:undefined-global

local prefix = '(|/usr)(|/local)/bin/'

permission({ binary = '/usr/lib(|exec|64)/xdg-desktop-portal-hyprland', type = 'screencopy', mode = 'allow' })

permission({ binary = prefix .. 'hyprpm', type = 'plugin', mode = 'allow' })
permission({ binary = prefix .. 'quickshell', type = 'screencopy', mode = 'allow' })
permission({ binary = prefix .. 'noctalia', type = 'screencopy', mode = 'allow' })
