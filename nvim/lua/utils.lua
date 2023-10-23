local M = {}

---@return 'dark' | 'light'
function M.appearance()
	local style, os_uname = 'Dark', vim.loop.os_uname()
	if os_uname.sysname == 'Darwin' then
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
	return 40
end

---@param table1 table
---@param table2 table
---@return table
function M.merge(table1, table2)
	return vim.tbl_deep_extend('force', table1, table2)
end

---@return number
function M.getWidth()
	return vim.api.nvim_get_option('columns')
end

---@return number
function M.getHeight()
	return vim.api.nvim_get_option('lines')
end

return M
