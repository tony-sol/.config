return {
	'kevinhwang91/nvim-ufo',
	dependencies = {
		{
			'kevinhwang91/promise-async',
		},
	},
	config       = function()
		local fn      = vim.fn
		local promise = require('promise')
		local ufo     = require('ufo')
		ufo.setup {
			preview = {
				win_config = {
					border   = { '', '─', '', '', '', '─', '', '' },
					winblend = 0,
				},
				mappings   = {
					scrollU = '<C-u>',
					scrollD = '<C-d>',
					jumpTop = '[',
					jumpBot = ']',
				}
			},
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
			fold_virt_text_handler = function(virtText, lnum, endLnum, width, truncate)
				local newVirtText = {}
				local suffix      = (' 󰁂 %d '):format(endLnum - lnum)
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
