local keymap = require('nl.keymap')

vim.keymap.set('n', keymap.telescope_find_files, ':Telescope find_files<CR>', { noremap = true, silent = true })
vim.keymap.set('n', keymap.telescope_live_grep, ':Telescope live_grep<CR>', { noremap = true, silent = true })

