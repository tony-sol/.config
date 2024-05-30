---Colors scheme name with `-dark` or `-light` suffix based on system appearance
---Requires `${name}-dark` and `${name}-light` color files in ./colors/
---@param name string
---@return string
return function(name)
	local wezterm    = require('wezterm')
	local appearance = wezterm.gui and wezterm.gui.get_appearance() or 'Dark'
	return name .. (appearance:find('Dark') and '-dark' or '-light')
end
