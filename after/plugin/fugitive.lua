local keymap = require('nl.keymap')

vim.keymap.set("n", keymap.toggle_git_manager, vim.cmd.Git)
