-- Leader key
vim.g.mapleader = ' '

-- To back out to file view
vim.keymap.set('n', '-', vim.cmd.Ex)

-- Telescope find files
local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>=', builtin.find_files, { desc = 'Telescope find files' })
