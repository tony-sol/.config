appearance = function ()
	return vim.fn.system({'defaults', 'read', '-g', 'AppleInterfaceStyle'})
end

defaultModalSize = function ()
	return {
		width  = 0.6,
		height = 0.8,
	}
end

merge = function (table1, table2)
	return vim.tbl_deep_extend('force', table1, table2)
end
