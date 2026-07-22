---@diagnostic disable-next-line:undefined-global
local hyprland       = hl

local terminal       = "wezterm"
local browser        = "flatpak run com.google.Chrome"
local explorer       = "dolphin"
local runner         = "hyprlauncher"
local locker         = "hyprlock"
local screenshotFull = "hyprshot --mode output"
local screenshotWin  = "hyprshot --mode window"
local screenshotReg  = "hyprshot --mode region"

local mainMod        = "SUPER" -- Sets "Windows" key as main modifier

-- Example binds, see https://wiki.hypr.land/Configuring/Basics/Binds/ for more
hyprland.bind(mainMod .. " + T", hyprland.dsp.exec_cmd(terminal))
hyprland.bind(mainMod .. " + B", hyprland.dsp.exec_cmd(browser))
hyprland.bind(mainMod .. " + E", hyprland.dsp.exec_cmd(explorer))
hyprland.bind(mainMod .. " + R", hyprland.dsp.exec_cmd(runner))
hyprland.bind(mainMod .. " + L", hyprland.dsp.exec_cmd(locker))
hyprland.bind(mainMod .. " + Q", hyprland.dsp.window.close())
hyprland.bind(mainMod .. " + M",
	hyprland.dsp.exec_cmd(
		"command -v hyprshutdown >/dev/null 2>&1 && hyprshutdown || hyprctl dispatch 'hyprland.dsp.exit()'"))
hyprland.bind(mainMod .. " + V", hyprland.dsp.window.float({ action = "toggle" }))
hyprland.bind(mainMod .. " + F", hyprland.dsp.window.fullscreen({ action = "toggle" }))
hyprland.bind(mainMod .. " + P", hyprland.dsp.window.pseudo())
hyprland.bind(mainMod .. " + J", hyprland.dsp.layout("togglesplit")) -- dwindle only

-- Move focus with mainMod + arrow keys
hyprland.bind(mainMod .. " + left", hyprland.dsp.focus({ direction = "left" }))
hyprland.bind(mainMod .. " + right", hyprland.dsp.focus({ direction = "right" }))
hyprland.bind(mainMod .. " + up", hyprland.dsp.focus({ direction = "up" }))
hyprland.bind(mainMod .. " + down", hyprland.dsp.focus({ direction = "down" }))
hyprland.bind(mainMod .. " + TAB", function()
	hyprland.dispatch(hyprland.dsp.window.cycle_next())
	hyprland.dispatch(hyprland.dsp.window.bring_to_top())
end)
-- 	bind = $mainMod, grave, hyprexpo:expo, toggle
-- hyprland.bind(mainMod .. " + `", hyprland.dsp.focus({ direction = "down" }))

-- Switch workspaces with mainMod + [0-9]
-- Move active window to a workspace with mainMod + SHIFT + [0-9]
for i = 1, 10 do
	local key = i % 10 -- 10 maps to key 0
	hyprland.bind(mainMod .. " + " .. key, hyprland.dsp.focus({ workspace = i }))
	hyprland.bind(mainMod .. " + SHIFT + " .. key, hyprland.dsp.window.move({ workspace = i }))
end

-- Screenshots
hyprland.bind("PRINT", hyprland.dsp.exec_cmd(screenshotFull))
hyprland.bind("ALT + PRINT", hyprland.dsp.exec_cmd(screenshotWin))
hyprland.bind("CTRL + PRINT", hyprland.dsp.exec_cmd(screenshotReg))

-- Example special workspace (scratchpad)
hyprland.bind(mainMod .. " + S", hyprland.dsp.workspace.toggle_special("magic"))
hyprland.bind(mainMod .. " + SHIFT + S", hyprland.dsp.window.move({ workspace = "special:magic" }))

-- Scroll through existing workspaces with mainMod + scroll
hyprland.bind(mainMod .. " + mouse_down", hyprland.dsp.focus({ workspace = "e+1" }))
hyprland.bind(mainMod .. " + mouse_up", hyprland.dsp.focus({ workspace = "e-1" }))

-- Move/resize windows with mainMod + LMB/RMB and dragging
hyprland.bind(mainMod .. " + mouse:272", hyprland.dsp.window.drag(), { mouse = true })
hyprland.bind(mainMod .. " + mouse:273", hyprland.dsp.window.resize(), { mouse = true })

-- Laptop multimedia keys for volume and LCD brightness
hyprland.bind("XF86AudioRaiseVolume", hyprland.dsp.exec_cmd("wpctl set-volume -l 1 @DEFAULT_AUDIO_SINK@ 5%+"),
	{ locked = true, repeating = true })
hyprland.bind("XF86AudioLowerVolume", hyprland.dsp.exec_cmd("wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-"),
	{ locked = true, repeating = true })
hyprland.bind("XF86AudioMute", hyprland.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"),
	{ locked = true, repeating = true })
hyprland.bind("XF86AudioMicMute", hyprland.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle"),
	{ locked = true, repeating = true })
hyprland.bind("XF86MonBrightnessUp", hyprland.dsp.exec_cmd("brightnessctl -e4 -n2 set 5%+"),
	{ locked = true, repeating = true })
hyprland.bind("XF86MonBrightnessDown", hyprland.dsp.exec_cmd("brightnessctl -e4 -n2 set 5%-"),
	{ locked = true, repeating = true })

-- Requires playerctl
hyprland.bind("XF86AudioNext", hyprland.dsp.exec_cmd("playerctl next"), { locked = true })
hyprland.bind("XF86AudioPause", hyprland.dsp.exec_cmd("playerctl play-pause"), { locked = true })
hyprland.bind("XF86AudioPlay", hyprland.dsp.exec_cmd("playerctl play-pause"), { locked = true })
hyprland.bind("XF86AudioPrev", hyprland.dsp.exec_cmd("playerctl previous"), { locked = true })
