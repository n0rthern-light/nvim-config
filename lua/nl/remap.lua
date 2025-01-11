local keymap = require('nl.keymap')
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

vim.keymap.set("x", keymap.uber_paste, "\"_dP")

vim.diagnostic.config({
  underline = {
    severity = { min = vim.diagnostic.severity.ERROR }
  },
  virtual_text = {
    severity = { min = vim.diagnostic.severity.ERROR }
  }
})
