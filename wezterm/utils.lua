local wezterm = require('wezterm')

local M       = {}

---Check is running on macos
---@return boolean
M.is_darwin   = wezterm.target_triple:find('darwin') ~= nil

---Check is running on linux
---@return boolean
M.is_linux    = wezterm.target_triple:find('linux') ~= nil

---Check is running on windows
---@return boolean
M.is_windows  = wezterm.target_triple:find('windows') ~= nil

---Colorscheme name
---@return 'dark' | 'light' | nil
function M.appearance()
	return wezterm.gui and wezterm.gui.get_appearance():gsub('HighContrast', ''):lower() or nil
end

return M
