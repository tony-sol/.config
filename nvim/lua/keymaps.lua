local keymap = vim.keymap -- keymaps

keymap.set({ 'n', 'v' }, ']b', '<plug>(CybuNext)')
keymap.set({ 'n', 'v' }, '[b', '<plug>(CybuPrev)')
keymap.set({ 'n' }, '<leader>ga', '<cmd>lua require("cosmic-ui").code_actions()<cr>')
keymap.set({ 'v' }, '<leader>ga', '<cmd>lua require("cosmic-ui").range_code_actions()<cr>')
