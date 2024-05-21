local keymap = require('nl.keymap')

vim.keymap.set("n", keymap.toggle_undo_tree, vim.cmd.UndotreeToggle)

