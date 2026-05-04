return {
  "vimwiki/vimwiki",
  -- The event that triggers the plugin
  event = "BufEnter *.md",
  -- The keys that trigger the plugin
  keys = { "<leader>ww", "<leader>wt", "<leader>w<leader>w", "<leader>w<leader>i" },
  -- The configuration for the plugin
  init = function()
    vim.g.vimwiki_list = {
      {
        path = "~/vimwiki/",
        diary_rel_path = "",
        syntax = "markdown",
        ext = "md",
      },
    }
    vim.g.vimwiki_ext2syntax = { ['.md'] = 'markdown' }
  end,
}
