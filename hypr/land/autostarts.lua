---@diagnostic disable-next-line:undefined-global
local hyprland = hl

hyprland.on("hyprland.start", function()
	hyprland.exec_cmd("quickshell")
	hyprland.exec_cmd("systemctl --user start hyprpolkitagent")
	hyprland.exec_cmd("systemctl --user start hyprpaper")
	hyprland.exec_cmd("systemctl --user start hypridle")
	hyprland.exec_cmd("hyprlauncher -d")
	hyprland.exec_cmd("hyprpm reload")
end)
