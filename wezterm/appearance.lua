local utils    = require('utils')

local M        = {}

-- @note On X11 and Wayland, the windowing system may override the window decorations
---@type string
M.decorations  = utils.is_darwin and 'RESIZE' or 'TITLE|RESIZE'

---@type string
M.color_scheme = (os.getenv('COLORTHEME') or 'tokyonight') .. '-' .. (utils.appearance() or 'dark')

return M
