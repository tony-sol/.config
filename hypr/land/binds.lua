---@diagnostic disable:undefined-global
local bind    = hl.bind
local dsp     = hl.dsp
---@diagnostic enable:undefined-global

local ipc     = 'noctalia msg '
local run     = 'flatpak run '

local mainMod = 'SUPER' -- Sets 'Windows' key as main modifier

bind(mainMod .. ' + T', dsp.exec_cmd('wezterm'))
bind(mainMod .. ' + E', dsp.exec_cmd('wezterm start mise exec -- spf'))
bind(mainMod .. ' + B', dsp.exec_cmd(run .. 'com.google.Chrome'))
bind(mainMod .. ' + L', dsp.exec_cmd(ipc .. 'session lock'))
bind(mainMod .. ' + M', dsp.exec_cmd(ipc .. 'session logout'))
bind(mainMod .. ' + Q', dsp.window.close())
bind(mainMod .. ' + V', dsp.window.float())
bind(mainMod .. ' + P', dsp.window.pseudo())
bind(mainMod .. ' + F', dsp.window.fullscreen({ mode = 'maximized', layout_aware = false }))
bind(mainMod .. ' + SHIFT + F', dsp.window.fullscreen({ mode = 'fullscreen', layout_aware = false }))
bind(mainMod .. ' + J', dsp.layout('fit_into_view'))
bind(mainMod .. ' + BRACKETLEFT', dsp.layout('swapcol l'))
bind(mainMod .. ' + BRACKETRIGHT', dsp.layout('swapcol r'))
bind(mainMod .. ' + ALT + SPACE', dsp.exec_cmd(ipc .. 'panel-toggle launcher'))

-- Screenshots
bind('PRINT', dsp.exec_cmd(ipc .. 'screenshot-fullscreen --annotate'))
bind('ALT + PRINT', dsp.exec_cmd(ipc .. 'screenshot-window --annotate'))
bind('CTRL + PRINT', dsp.exec_cmd(ipc .. 'screenshot-region --annotate'))

-- Clipboard
bind(mainMod .. ' + SHIFT + V', dsp.exec_cmd(ipc .. 'panel-toggle clipboard'))

-- Noctalia's control center

-- Move focus with mainMod + arrow keys
for _, direction in ipairs({ 'left', 'right', 'up', 'down' }) do
	bind(mainMod .. ' + ' .. direction, dsp.focus({ direction = direction }))
end

-- Switch windows with mainMod + Tab
bind(mainMod .. ' + TAB', dsp.exec_cmd(ipc .. 'window-switcher hold'))

-- Switch workspaces with mainMod + [0-9]
-- Move active window to a workspace with mainMod + SHIFT + [0-9]
for i = 1, 10 do
	local key = i % 10 -- 10 maps to key 0
	bind(mainMod .. ' + ' .. key, dsp.focus({ workspace = i }))
	bind(mainMod .. ' + SHIFT + ' .. key, dsp.window.move({ workspace = i }))
end

-- Example special workspace (scratchpad)
bind(mainMod .. ' + S', dsp.workspace.toggle_special('magic'))
bind(mainMod .. ' + SHIFT + S', dsp.window.move({ workspace = 'special:magic' }))

-- Scroll through existing workspaces with mainMod + SHIFT + arrow keys
bind(mainMod .. ' + SHIFT + left', dsp.focus({ workspace = 'e-1' }))
bind(mainMod .. ' + SHIFT + right', dsp.focus({ workspace = 'e+1' }))

-- Scroll through existing workspaces with mainMod + scroll
bind(mainMod .. ' + mouse_down', dsp.focus({ workspace = 'e+1' }))
bind(mainMod .. ' + mouse_up', dsp.focus({ workspace = 'e-1' }))

-- Move/resize windows with mainMod + LMB/RMB and dragging
bind(mainMod .. ' + mouse:272', dsp.window.drag(), { mouse = true })
bind(mainMod .. ' + mouse:273', dsp.window.resize(), { mouse = true })

-- Multimedia keys for volume and LCD brightness
-- @see https://docs.noctalia.dev/noctalia/v5.4.1/ipc/system-controls/?section=volume#volume
-- noctalia msg volume-up 5   == wpctl set-volume -l 1 @DEFAULT_AUDIO_SINK@ 5%+
-- noctalia msg volume-down 5 == wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-
-- noctalia msg volume-mute   == wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle
-- noctalia msg mic-mute      == wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle
bind('XF86AudioRaiseVolume', dsp.exec_cmd(ipc .. 'volume-up 5'), { locked = true, repeating = true })
bind('XF86AudioLowerVolume', dsp.exec_cmd(ipc .. 'volume-down 5'), { locked = true, repeating = true })
bind('XF86AudioMute', dsp.exec_cmd(ipc .. 'volume-mute'), { locked = true, repeating = false })
bind('XF86AudioMicMute', dsp.exec_cmd(ipc .. 'mic-mute'), { locked = true, repeating = false })
-- noctalia msg brightness-up   == brightnessctl -e4 -n2 set 5%+
-- noctalia msg brightness-down == brightnessctl -e4 -n2 set 5%-
bind('XF86MonBrightnessUp', dsp.exec_cmd(ipc .. 'brightness-up'), { locked = true, repeating = true })
bind('XF86MonBrightnessDown', dsp.exec_cmd(ipc .. 'brightness-down'), { locked = true, repeating = true })
-- noctalia msg media play     == playerctl play-pause
-- noctalia msg media pause    == playerctl play-pause
-- noctalia msg media next     == playerctl next
-- noctalia msg media previous == playerctl previous
bind('XF86AudioPlay', dsp.exec_cmd('noctalia msg media play'), { locked = true })
bind('XF86AudioPause', dsp.exec_cmd('playerctl play-pause'), { locked = true })
bind('XF86AudioNext', dsp.exec_cmd('playerctl next'), { locked = true })
bind('XF86AudioPrev', dsp.exec_cmd('playerctl previous'), { locked = true })
