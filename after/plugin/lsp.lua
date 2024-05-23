local keymap = require('nl.keymap')
local lsp = require('lsp-zero')

lsp.preset('recommended')
lsp.setup()

require('mason').setup({})
require('mason-lspconfig').setup({
	-- Replace the language servers listed here 
	-- with the ones you want to install
	ensure_installed = {'clangd', 'eslint', 'lua_ls', 'intelephense', 'phpactor', 'html', 'tsserver', 'vuels', 'cssls', 'css_variables'},
	handlers = {
		function(server_name)
			require('lspconfig')[server_name].setup({})
		end,
	},
})

local cmp = require('cmp')
local cmp_select = { behavior = cmp.SelectBehavior.Select }

cmp.setup({
	window = {
		completion = cmp.config.window.bordered(),
		documentation = cmp.config.window.bordered(),
	},
	mapping = cmp.mapping.preset.insert({
		[keymap.lsp_cmp_select_prev] = cmp.mapping.select_prev_item(cmp_select),
		[keymap.lsp_cmp_select_next] = cmp.mapping.select_next_item(cmp_select),
		[keymap.lsp_cmp_confirm] = cmp.mapping.confirm({ select = true }),
		[keymap.lsp_cmp_complete] = cmp.mapping.complete(),
	}),
	snippet = {
		expand = function(args)
			require('luasnip').lsp_expand(args.body)
		end,
	},
})

lsp.set_preferences({
	sign_icons = { }
})

lsp.on_attach(function(client, bufnr)
	local opts = {buffer = bufnr, remap = false}

	vim.keymap.set("n", keymap.lsp_jump_to_def, function() vim.lsp.buf.definition() end, opts)
	vim.keymap.set("n", keymap.lsp_jump_to_impl, function() vim.lsp.buf.implementation() end, opts)
	vim.keymap.set("n", keymap.lsp_list_xrefs, function() vim.lsp.buf.references() end, opts)
	vim.keymap.set("n", keymap.lsp_hover, function() vim.lsp.buf.hover() end, opts)
	vim.keymap.set("n", keymap.lsp_rename_symbol, function() vim.lsp.buf.rename() vim.cmd('silent! wa') end, opts)
end)
