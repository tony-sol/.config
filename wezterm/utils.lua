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

---Colors scheme name with `-dark` or `-light` suffix based on system appearance
---Requires `${name}-dark` and `${name}-light` color files in ./colors/
---@param name string
---@return string
function M.get_appearance(name)
	local appearance = wezterm.gui and wezterm.gui.get_appearance() or 'Dark'
	return name .. (appearance:find('Dark') and '-dark' or '-light')
end

return M
