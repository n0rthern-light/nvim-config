local keymap = require('nl.keymap')
local diagnostics_toggle = require('nl.diagnostics')
local tabWidth = 4
local lineNumbers = true
local vimLeader = " "

vim.g.mapleader = vimLeader
vim.g.maplocalleader = vimLeader

vim.opt.autoindent = true
vim.opt.smartindent = true

vim.opt.clipboard = 'unnamedplus' -- yank to clipboard
vim.opt.expandtab = true
vim.opt.tabstop = tabWidth
vim.opt.softtabstop = tabWidth
vim.opt.shiftwidth = tabWidth
vim.wo.number = lineNumbers
vim.opt.number = true
vim.opt.relativenumber = true

vim.api.nvim_create_autocmd("VimEnter", {
  command = "silent! lcd %:p:h"
})

vim.keymap.set('n', keymap.navigate_jump_back, '<C-o>', { noremap = true, silent = true })
vim.keymap.set('n', keymap.navigate_jump_forward, '<C-i>', { noremap = true, silent = true })
vim.keymap.set('n', keymap.split_vertically, ':vsplit<CR>', { noremap = true, silent = true })
vim.keymap.set('n', keymap.split_horizontally, ':split<CR>', { noremap = true, silent = true })
vim.keymap.set('n', keymap.close_buffer, ':bd<CR>', { noremap = true, silent = true })
vim.keymap.set('n', keymap.close_window, ':close<CR>', { noremap = true, silent = true })
vim.keymap.set('n', keymap.switch_window_left, '<C-w>h', { noremap = true, silent = true })
vim.keymap.set('n', keymap.switch_window_below, '<C-w>j', { noremap = true, silent = true })
vim.keymap.set('n', keymap.switch_window_above, '<C-w>k', { noremap = true, silent = true })
vim.keymap.set('n', keymap.switch_window_right, '<C-w>l', { noremap = true, silent = true })
vim.keymap.set('n', keymap.toggle_gitblame, ':BlameLineToggle<CR>', { noremap = true, silent = true })
vim.keymap.set('n', keymap.replace_in_files, function()
  require('spectre').open()
end, { desc = "Open Spectre" })
vim.keymap.set("x", keymap.uber_paste, "\"_dP") -- paste without loosing yanked stuff
vim.keymap.set("n", "<leader>dg", diagnostics_toggle, { desc = "Toggle diagnostics", noremap = true, silent = true })
