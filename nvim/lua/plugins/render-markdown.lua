return {
   'MeanderingProgrammer/render-markdown.nvim',
   dependencies = { 'nvim-treesitter/nvim-treesitter', 'nvim-tree/nvim-web-devicons' },
   ft = { 'markdown', 'vimwiki' },
   ---@module 'render-markdown'
   ---@type render.md.UserConfig
   opts = {
      latex = { enabled = false },
      file_types = { 'markdown', 'vimwiki' },
   },
}
