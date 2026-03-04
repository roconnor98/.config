-- Relative line numbers with current line number
vim.wo.relativenumber = true
vim.wo.number = true

-- Number of lines to keep at the top/bottom of screen
vim.opt.scrolloff = 20

-- Disable swap files
vim.opt.swapfile = false

-- Transparent background
vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })

-- Tab spacing
vim.opt.tabstop = 8
vim.opt.softtabstop = 3
vim.opt.shiftwidth = 3

-- Clipboard copying
vim.opt.clipboard = "unnamedplus"
