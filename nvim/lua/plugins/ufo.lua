return {
	'kevinhwang91/nvim-ufo',
	dependencies = {
		{
			'kevinhwang91/promise-async',
		},
	},
	config = function ()
		local ufo, promise = require('ufo'), require('promise')
		local function customizeSelector(bufnr)
			return ufo.getFolds(bufnr, 'lsp')
				:catch(function (err)
					return ufo.getFolds(bufnr, 'treesitter')
				end)
				:catch(function (err)
					return ufo.getFolds(bufnr, 'indent')
				end)
				:catch(function (err)
					return promise.reject(err)
				end)
		end
		ufo.setup {
			provider_selector = function (bufnr, filetype, buftype)
				return customizeSelector
			end
		}
	end
}
