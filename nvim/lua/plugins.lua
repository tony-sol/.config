vim.cmd [[packadd packer.nvim]]
vim.opt.list = true
vim.opt.listchars:append("space:⋅")

return require('packer').startup(function()
    use 'wbthomason/packer.nvim'
    use {
        'numToStr/Comment.nvim',
        config = function()
            require('Comment').setup {}
        end
    }
    use {
        'lukas-reineke/indent-blankline.nvim',
        requires = {
            'nvim-treesitter/nvim-treesitter'
        },
        require('indent_blankline').setup {
            show_current_context = true,
            show_current_context_start = true,
        }
    }
    use {
        "hrsh7th/nvim-cmp", -- completion
        require('cmp').setup {
            mapping = {
                ['<Tab>'] = function(fallback)
                    if require('cmp').visible() then
                        require('cmp').select_next_item()
--                  elseif luasnip.expand_or_jumpable() then
--                      luasnip.expand_or_jump()
                    else
                        fallback()
                    end
                end,
                ['<S-Tab>'] = function(fallback)
                    if require('cmp').visible() then
                        require('cmp').select_prev_item()
--                  elseif luasnip.jumpable(-1) then
--                      luasnip.jump(-1)
                    else
                        fallback()
                    end
                end,
                ['<CR>'] = require('cmp').mapping.confirm {
                    behavior = require('cmp').ConfirmBehavior.Replace,
                    select = true
                }
            },
            sources = {
                { name = 'cmp_tabnine' }
            }
        }
    }
    use {
        'tzachar/cmp-tabnine',
        run = './install.sh',
        requires = {
            'hrsh7th/nvim-cmp'
        }
    }
    use {
        'kyazdani42/nvim-tree.lua',
        requires = {
          'kyazdani42/nvim-web-devicons' -- optional, for file icon
        },
        config = function()
            require('nvim-tree').setup {
            }
        end
    }
    use {
        'nvim-telescope/telescope.nvim',
        requires = {
            'nvim-lua/plenary.nvim'
        }
    }
    use {
        'lewis6991/gitsigns.nvim',
        requires = {
            'nvim-lua/plenary.nvim'
        },
        config = function()
            require('gitsigns').setup {
                signs = {
                    add          = {hl = 'GitSignsAdd'   , text = '│', numhl='GitSignsAddNr'   , linehl='GitSignsAddLn'},
                    change       = {hl = 'GitSignsChange', text = '│', numhl='GitSignsChangeNr', linehl='GitSignsChangeLn'},
                    delete       = {hl = 'GitSignsDelete', text = '_', numhl='GitSignsDeleteNr', linehl='GitSignsDeleteLn'},
                    topdelete    = {hl = 'GitSignsDelete', text = '‾', numhl='GitSignsDeleteNr', linehl='GitSignsDeleteLn'},
                    changedelete = {hl = 'GitSignsChange', text = '~', numhl='GitSignsChangeNr', linehl='GitSignsChangeLn'},
                },
                signcolumn = true,  -- Toggle with `:Gitsigns toggle_signs`
                numhl      = true,  -- Toggle with `:Gitsigns toggle_numhl`
                linehl     = true,  -- Toggle with `:Gitsigns toggle_linehl`
                word_diff  = true, -- Toggle with `:Gitsigns toggle_word_diff`
                keymaps = {
                    -- Default keymap options
                    noremap = true,

                    ['n ]c'] = { expr = true, "&diff ? ']c' : '<cmd>Gitsigns next_hunk<CR>'"},
                    ['n [c'] = { expr = true, "&diff ? '[c' : '<cmd>Gitsigns prev_hunk<CR>'"},

                    ['n <leader>hs'] = '<cmd>Gitsigns stage_hunk<CR>',
                    ['v <leader>hs'] = ':Gitsigns stage_hunk<CR>',
                    ['n <leader>hu'] = '<cmd>Gitsigns undo_stage_hunk<CR>',
                    ['n <leader>hr'] = '<cmd>Gitsigns reset_hunk<CR>',
                    ['v <leader>hr'] = ':Gitsigns reset_hunk<CR>',
                    ['n <leader>hR'] = '<cmd>Gitsigns reset_buffer<CR>',
                    ['n <leader>hp'] = '<cmd>Gitsigns preview_hunk<CR>',
                    ['n <leader>hb'] = '<cmd>lua require"gitsigns".blame_line{full=true}<CR>',
                    ['n <leader>hS'] = '<cmd>Gitsigns stage_buffer<CR>',
                    ['n <leader>hU'] = '<cmd>Gitsigns reset_buffer_index<CR>',

                    -- Text objects
                    ['o ih'] = ':<C-U>Gitsigns select_hunk<CR>',
                    ['x ih'] = ':<C-U>Gitsigns select_hunk<CR>'
                },
                watch_gitdir = {
                    interval = 1000,
                    follow_files = true
                },
                attach_to_untracked = true,
                current_line_blame = false, -- Toggle with `:Gitsigns toggle_current_line_blame`
                current_line_blame_opts = {
                    virt_text = true,
                    virt_text_pos = 'eol', -- 'eol' | 'overlay' | 'right_align'
                    delay = 1000,
                    ignore_whitespace = false,
                },
                current_line_blame_formatter_opts = {
                    relative_time = false
                },
                sign_priority = 6,
                update_debounce = 100,
                status_formatter = nil, -- Use default
                max_file_length = 40000,
                preview_config = {
                    border = 'single',
                    style = 'minimal',
                    relative = 'cursor',
                    row = 0,
                    col = 1
                },
                yadm = {
                    enable = false
                }
            }
        end
    }
end)
