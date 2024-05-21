local keymap = require("nl.keymap")
local mark = require("harpoon.mark")
local ui = require("harpoon.ui")

vim.keymap.set("n", keymap.buffer_list_add, mark.add_file)
vim.keymap.set("n", keymap.buffer_list_toggle, ui.toggle_quick_menu)

vim.keymap.set("n", keymap.switch_buffer_next, function() ui.nav_next() end)
vim.keymap.set("n", keymap.switch_buffer_prev, function() ui.nav_prev() end)

