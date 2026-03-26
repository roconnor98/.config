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
vim.keymap.set("n", "<C-e>", function() require('harpoon').ui:toggle_quick_menu(require('harpoon'):list()) end)

vim.keymap.set("n", "<C-h>", function() require('harpoon'):list():select(1) end)
vim.keymap.set("n", "<C-t>", function() require('harpoon'):list():select(2) end)
vim.keymap.set("n", "<C-n>", function() require('harpoon'):list():select(3) end)
vim.keymap.set("n", "<C-s>", function() require('harpoon'):list():select(4) end)

-- Toggle previous & next buffers stored within Harpoon list
vim.keymap.set("n", "<C-S-P>", function() require('harpoon'):list():prev() end)
vim.keymap.set("n", "<C-S-N>", function() require('harpoon'):list():next() end)

-- lsp
vim.keymap.set("n", "gd", function () vim.lsp.buf.hover() end)
vim.keymap.set("n", "<leader>d", function () vim.lsp.buf.definition() end)
