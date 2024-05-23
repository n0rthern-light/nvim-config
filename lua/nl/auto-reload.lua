-- Autoreload files when they change on disk
vim.api.nvim_create_autocmd({"BufEnter", "FocusGained", "BufWritePost", "TextChanged"}, {
    pattern = "*",
    command = "checktime"
})

-- Notify user when a file has changed and is reloaded
vim.api.nvim_create_autocmd("FileChangedShellPost", {
    pattern = "*",
    callback = function()
        vim.notify("File changed on disk. Buffer reloaded.", vim.log.levels.INFO)
    end
})
