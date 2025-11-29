local keymap = require('nl.keymap')
local ignore = require('nl.ignore')

vim.keymap.set('n', keymap.telescope_find_files, ':Telescope find_files<CR>', { noremap = true, silent = true })
vim.keymap.set('n', keymap.telescope_live_grep, ':Telescope live_grep<CR>', { noremap = true, silent = true })

local config_telescope = {
    defaults = {
        file_ignore_patterns = ignore.load_project_ignore_patterns(),
    },
}

require("telescope").setup(config_telescope)

-- reload after ignore file changed

vim.api.nvim_create_user_command("TelescopeReloadIgnore", function()
    config_telescope.defaults.file_ignore_patterns = ignore.load_project_ignore_patterns()
    require("telescope").setup(config_telescope)
    print("Telescope ignore patterns reloaded")
end, {})

vim.api.nvim_create_autocmd("BufWritePost", {
    pattern = ".nvimignore",
    callback = function()
        vim.cmd("TelescopeReloadIgnore")
    end,
})
