---@diagnostic disable:undefined-global
local on   = hl.on
local exec = hl.exec_cmd
---@diagnostic enable:undefined-global

on('hyprland.start', function()
	-- exec('quickshell')
	exec('noctalia')
	exec('systemctl --user start hyprpolkitagent')
	exec('hyprpm reload')
end)
