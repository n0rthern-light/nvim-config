local keymap = require('nl.keymap')

local dap = require('dap')
local dapui = require('dapui')

dapui.setup()

dap.listeners.after.event_initialized["dapui_config"] = function()
	dapui.open()
end
dap.listeners.before.event_terminated["dapui_config"] = function()
	dapui.close()
end
dap.listeners.before.event_exited["dapui_config"] = function()
	dapui.close()
end

dap.adapters.lldb = {
	id = 'lldb',
	type = 'executable',
	command = "lldb-dap",
}

dap.configurations.cpp = {
	{
		name = "Launch file",
		type = "lldb",
		request = "launch",
		program = function()
			return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/', 'file')
		end,
		cwd = '${workspaceFolder}',
		stopOnEntry = false,
		setupCommands = {
			{
				text = '-enable-pretty-printing',
				description = 'enable pretty printing',
				ignoreFailures = false
			}
		},
	},
}

vim.cmd [[
command! -nargs=0 DapDebugInfo lua print(vim.inspect(require('dap').adapters))
]]

vim.api.nvim_set_keymap('n', keymap.dap_continue, ':lua require"dap".continue()<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', keymap.dap_step_over, ':lua require"dap".step_over()<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', keymap.dap_step_into, ':lua require"dap".step_into()<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', keymap.dap_step_out, ':lua require"dap".step_out()<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', keymap.dap_terminate, ':lua require"dap".terminate()<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', keymap.dap_toggle_breakpoint, ':lua require"dap".toggle_breakpoint()<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', keymap.dap_clear_all_breakpoints, ':lua require"dap".clear_breakpoints()<CR>', { noremap = true, silent = true })

