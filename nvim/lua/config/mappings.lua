-- Leader key
vim.g.mapleader = ' '

-- To back out to file view
vim.keymap.set('n', '-', vim.cmd.Ex)

-- Telescope
vim.keymap.set('n', '<leader>=', "<cmd>lua require'telescope.builtin'.find_files({ find_command = {'rg', '--files', '--hidden', '-g', '!.git' }})<cr>",  { desc = 'Telescope find files' })
vim.keymap.set('n', '<leader>g', "<cmd>lua require'telescope.builtin'.live_grep()<cr>", { desc = 'Telescope live grep' })

-- Diagnostics
vim.keymap.set('n', '<leader>d', vim.diagnostic.open_float, { desc = 'Show line diagnostics' })
