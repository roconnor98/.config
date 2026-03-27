return {
   {
      'nvim-treesitter/nvim-treesitter',
      build = ':TSUpdate',
      config = function()
	 require'nvim-treesitter'.setup {
	    ensure_installed = { "c", "lua", "vim", "vimdoc", "query", "markdown", "markdown_inline", "json", "typescript", "tsx" },
	 }
	 vim.treesitter.language.register('markdown', 'vimwiki')
	 vim.api.nvim_create_autocmd("FileType", {
	    callback = function()
	       pcall(vim.treesitter.start)
	    end,
	 })
      end,
   }
}
