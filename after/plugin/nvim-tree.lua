local keymap = require('nl.keymap')
local ignore = require('nl.ignore')

vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1
vim.opt.termguicolors = true

require("nvim-tree").setup({
    sort = {
        sorter = "case_sensitive",
    },
    view = {
        width = 30,
    },
    renderer = {
        group_empty = true,
    },
    filters = {
        dotfiles = false,
        custom = ignore.nvim_tree_custom_filter
    },
})

vim.api.nvim_set_keymap('n', keymap.nvim_tree_toggle, ':NvimTreeToggle<CR>', { noremap = true, silent = true })

