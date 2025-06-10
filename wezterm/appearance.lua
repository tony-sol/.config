local utils    = require('utils')
local M        = {}

-- @note On X11 and Wayland, the windowing system may override the window decorations
M.decorations  = utils.is_darwin and 'RESIZE' or 'TITLE|RESIZE'

M.color_scheme = utils.get_appearance(os.getenv('COLORTHEME') or 'tokyonight')

return M
