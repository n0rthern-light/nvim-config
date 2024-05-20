local tabWidth = 2
local lineNumbers = true
local vimLeader = " "

vim.g.mapleader = vimLeader
vim.g.maplocalleader = vimLeader

vim.opt.tabstop = tabWidth
vim.opt.softtabstop = tabWidth
vim.opt.shiftwidth = tabWidth
vim.wo.number = lineNumbers

-- set :cd to current dir
vim.api.nvim_create_autocmd("VimEnter", {
  command = "silent! lcd %:p:h"
})
