local actions = require('wezterm').action
local utils   = require('utils')

local M       = {}

---@return string
local function mainKey()
	return utils.is_darwin and 'SUPER' or 'CTRL'
end

---@return table
function M.leader()
	return { key = 'k', mods = mainKey(), timeout_milliseconds = 1000 }
end

---@return table
function M.list()
	local main = mainKey()

	return {
		-- window control
		{ key = 'f',   mods = 'LEADER|' .. main, action = actions.ToggleFullScreen },
		{ key = 'q',   mods = 'LEADER|' .. main, action = actions.QuitApplication },
		{ key = 'h',   mods = 'LEADER|' .. main, action = actions.Hide },
		{ key = 'h',   mods = 'LEADER|' .. main, action = actions.HideApplication },
		-- font size
		{ key = '0',   mods = 'LEADER|' .. main, action = actions.ResetFontSize },
		{ key = '-',   mods = 'LEADER|' .. main, action = actions.DecreaseFontSize },
		{ key = '=',   mods = 'LEADER|' .. main, action = actions.IncreaseFontSize },
		-- clipboard
		{ key = 'c',   mods = 'LEADER|' .. main, action = actions.CopyTo 'Clipboard' },
		{ key = 'v',   mods = 'LEADER|' .. main, action = actions.PasteFrom 'Clipboard' },
		-- menus
		{ key = 'p',   mods = 'LEADER',          action = actions.ActivateCommandPalette },
		{ key = 'F2',  mods = 'LEADER',          action = actions.ShowLauncherArgs({ flags = 'COMMANDS' }) },
		{ key = 'F3',  mods = 'LEADER',          action = actions.ShowLauncherArgs({ flags = 'LAUNCH_MENU_ITEMS' }) },
		{ key = 'F4',  mods = 'LEADER',          action = actions.ShowLauncherArgs({ flags = 'TABS' }) },
		{ key = 'F5',  mods = 'LEADER',          action = actions.ShowLauncherArgs({ flags = 'DOMAINS' }) },
		{ key = 'F6',  mods = 'LEADER',          action = actions.ShowLauncherArgs({ flags = 'WORKSPACES' }) },
		{ key = 'F12', mods = 'LEADER',          action = actions.ShowDebugOverlay },
	}
end

return M
