return {
	'kevinhwang91/nvim-ufo',
	dependencies = {
		{
			'kevinhwang91/promise-async',
		},
	},
	config       = function()
		---@diagnostic disable-next-line: undefined-global
		local fn      = vim.fn
		local fchars  = require('utils').defaultFillchars()
		local schars  = require('utils').specialChars()
		local promise = require('promise')
		local ufo     = require('ufo')
		ufo.setup {
			preview = {
				win_config = {
					border   = {
						'',
						fchars.horiz,
						'',
						'',
						'',
						fchars.horiz,
						'',
						'',
					},
					winblend = 0,
				},
				mappings   = {
					scrollU = '<C-u>',
					scrollD = '<C-d>',
					jumpTop = '[',
					jumpBot = ']',
				}
			},
			---@diagnostic disable: unused-local
			provider_selector = function(bufnr, filetype, buftype)
				return function(_bufnr)
					return ufo.getFolds(_bufnr, 'lsp')
						:catch(function(err)
							return ufo.getFolds(_bufnr, 'treesitter')
						end)
						:catch(function(err)
							return ufo.getFolds(_bufnr, 'indent')
						end)
						:catch(function(err)
							return promise.reject(err)
						end)
				end
			end,
			---@diagnostic enable: unused-local
			fold_virt_text_handler = function(virtText, lnum, endLnum, width, truncate)
				local newVirtText = {}
				local suffix      = (' %s %d '):format(schars.arrow_ext.bottomleft, endLnum - lnum)
				local sufWidth    = fn.strdisplaywidth(suffix)
				local targetWidth = width - sufWidth
				local curWidth    = 0
				for _, chunk in ipairs(virtText) do
					local chunkText  = chunk[1]
					local chunkWidth = fn.strdisplaywidth(chunkText)
					if targetWidth > curWidth + chunkWidth then
						table.insert(newVirtText, chunk)
					else
						chunkText = truncate(chunkText, targetWidth - curWidth)
						local hlGroup = chunk[2]
						table.insert(newVirtText, { chunkText, hlGroup })
						chunkWidth = fn.strdisplaywidth(chunkText)
						-- str width returned from truncate() may less than 2nd argument, need padding
						if curWidth + chunkWidth < targetWidth then
							suffix = suffix .. (' '):rep(targetWidth - curWidth - chunkWidth)
						end
						break
					end
					curWidth = curWidth + chunkWidth
				end
				table.insert(newVirtText, { suffix })
				return newVirtText
			end,
		}
	end
}
