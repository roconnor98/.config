-- Leader key
vim.g.mapleader = ' '

-- To back out to file view
vim.keymap.set('n', '-', vim.cmd.Ex)

-- Telescope
vim.keymap.set('n', '<leader>=', "<cmd>lua require'telescope.builtin'.find_files({ find_command = {'rg', '--files', '--hidden', '-g', '!.git' }})<cr>",  { desc = 'Telescope find files' })
vim.keymap.set('n', '<leader>g', "<cmd>lua require'telescope.builtin'.live_grep()<cr>", { desc = 'Telescope live grep' })

-- Diagnostics
vim.keymap.set('n', '<leader>e', vim.diagnostic.open_float, { desc = 'Show line diagnostics' })

-- Harpoon
vim.keymap.set("n", "<leader>a", function() require('harpoon'):list():add() end)
vim.keymap.set("n", "<M-e>", function() require('harpoon').ui:toggle_quick_menu(require('harpoon'):list()) end)

vim.keymap.set("n", "<M-1>", function() require('harpoon'):list():select(1) end)
vim.keymap.set("n", '<M-2>', function() require('harpoon'):list():select(2) end)
vim.keymap.set("n", "<M-3>", function() require('harpoon'):list():select(3) end)
vim.keymap.set("n", "<M-4>", function() require('harpoon'):list():select(4) end)

-- lsp
vim.keymap.set("n", "<leader>d", function () vim.lsp.buf.hover() end)
vim.keymap.set("n", "gd", function () vim.lsp.buf.definition() end)
