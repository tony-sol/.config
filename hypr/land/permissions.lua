---@diagnostic disable:undefined-global
local permission = hl.permission
---@diagnostic enable:undefined-global

permission('/usr/lib(|exec|64)/xdg-desktop-portal-hyprland', 'screencopy', 'allow')
permission('/usr/(|local/)bin/grim', 'screencopy', 'allow')
permission('/usr/(|local/)bin/hyprpm', 'plugin', 'allow')
permission('/usr/(|local/)bin/quickshell', 'screencopy', 'allow')
permission('/usr/(|local/)bin/noctalia', 'screencopy', 'allow')
