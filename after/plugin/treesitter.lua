require'nvim-treesitter.configs'.setup {
  ensure_installed = { "c", "cpp", "asm", "lua", "vim", "vimdoc", "query", "php", "html", "javascript", "typescript", "css", "scss", "vue" },
  sync_install = false,
  auto_install = true,
  highlight = {
    enable = true,
    additional_vim_regex_highlighting = false,
  },
	indent = {
			enable = true,
	},
}
