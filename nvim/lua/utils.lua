local M = {}

---@return 'dark' | 'light'
function M.appearance()
	---@diagnostic disable-next-line: undefined-global
	local style, os_uname = 'Dark', vim.loop.os_uname()
	if os_uname.sysname == 'Darwin' then
		---@diagnostic disable-next-line: undefined-global
		style = vim.fn.system({ 'defaults', 'read', '-g', 'AppleInterfaceStyle' }):find(style) and style or 'Light'
	end
	return string.lower(style)
end

---@return {width: number, height: number}
function M.defaultModalSize()
	return {
		width  = 0.6,
		height = 0.8,
	}
end

---@return number
function M.defaultSidebarSize()
	---@diagnostic disable-next-line: undefined-global
	return math.min(math.floor(vim.api.nvim_get_option('columns') / 5), 40)
end

---@return {wbr: string, vert: string, vertleft: string, vertright: string, verthoriz: string, horiz: string, horizup: string, horizdown: string, foldopen: string, foldclose: string, foldsep: string, diff: string, msgsep: string, eob: string, lastline: string}
function M.defaultFillchars()
	return {
		wbr       = ' ',
		vert      = '│',
		vertleft  = '┤',
		vertright = '├',
		verthoriz = '┼',
		horiz     = '─',
		horizup   = '┴',
		horizdown = '┬',
		foldopen  = '',
		foldclose = '',
		foldsep   = '│',
		diff      = '-',
		msgsep    = ' ',
		eob       = '~',
		lastline  = '@',
	}
end

---@return {arrow: {up: string, right: string, down: string, left: string}, arrow_ext: {topright: string, bottomright: string, bottomleft: string, topleft: string}, corner: {upright: string, upleft: string, downright: string, downleft: string}, dashed:{vert: string, horiz: string}, top: string, bottom: string}
function M.specialChars()
	return {
		arrow     = {
			up    = '󰁝',
			right = '󰁔',
			down  = '󰁅',
			left  = '󰁍',
		},
		arrow_ext = {
			topright    = '󰁜',
			bottomright = '󰁃',
			bottomleft  = '󰁂',
			topleft     = '󰁛',
		},
		corner    = {
			upright   = '└',
			upleft    = '┘',
			downright = '┌',
			downleft  = '┐',
		},
		dashed    = {
			vert  = '┆',
			horiz = '┄',
		},
		top       = '‾',
		bottom    = '_',
	}
end

---@return {tab: string, trail: string, nbsp: string, space: string, eol:string}
function M.defaultListchars()
	return {
		tab   = ' ',
		trail = '-',
		nbsp  = '+',
		space = '·',
		eol   = '↴',
	}
end

---@param table1 table
---@param table2 table
---@return table
function M.merge(table1, table2)
	---@diagnostic disable-next-line: undefined-global
	return vim.tbl_deep_extend('force', table1, table2)
end

---@param data table
---@param ... any
---@return table
function M.push(data, ...)
	---@diagnostic disable-next-line: undefined-global
	local copy = vim.deepcopy(data)
	for _, value in pairs({ ... }) do
		table.insert(copy, value)
	end
	return copy
end

---@return number
function M.getWidth()
	---@diagnostic disable-next-line: undefined-global
	return vim.api.nvim_get_option('columns')
end

---@return number
function M.getHeight()
	---@diagnostic disable-next-line: undefined-global
	return vim.api.nvim_get_option('lines')
end

return M
