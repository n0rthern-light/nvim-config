local IGNORE_FILE_NAME = ".nvimignore"

local function get_project_root()
    local found = vim.fs.find({ IGNORE_FILE_NAME, ".git" }, { upward = true, type = "file" })
    if found and #found > 0 then
        return vim.fs.dirname(found[1])
    end
    return nil
end

local function load_project_ignore_patterns()
    local root = get_project_root()
    if not root then
        return {}
    end

    local ignore_path = root .. "/" .. IGNORE_FILE_NAME
    local f = io.open(ignore_path, "r")
    if not f then
        return {}
    end

    local patterns = {}
    for line in f:lines() do
        line = vim.trim(line)
        if line ~= "" and not line:match("^#") then
            line = line:gsub("%.", "%%."):gsub("%*", ".*")
            table.insert(patterns, line)
        end
    end

    f:close()
    return patterns
end

local function nvim_tree_custom_filter(absolute_path)
    local patterns = load_project_ignore_patterns()
    for _, pattern in ipairs(patterns) do
        if absolute_path:match(pattern) then
            return true -- hide this file/folder
        end
    end
    return false -- show it
end

local M = {}
M.nvim_tree_custom_filter = nvim_tree_custom_filter
M.load_project_ignore_patterns = load_project_ignore_patterns
return M
