-- Configuration settings
local tabWidth = 2
local lineNumbers = true
local vimLeader = " " -- space

-- Constants for keybindings
local keybindings = {
  nvim_tree_toggle = '<leader>e',
  telescope_find_files = '<leader>ff',
  telescope_live_grep = '<leader>fg',
  dap_continue = '<F5>',
  dap_step_over = '<F10>',
  dap_step_into = '<F11>',
  dap_step_out = '<F12>',
  dap_toggle_breakpoint = '<leader>b',
  cmp_scroll_docs_up = '<C-b>',
  cmp_scroll_docs_down = '<C-f>',
  cmp_complete = '<C-Space>',
  cmp_close = '<C-e>',
  cmp_confirm = '<CR>',
  split_vertically = '<leader>v', -- Split window vertically
  split_horizontally = '<leader>h', -- Split window horizontally
  switch_buffer_next = '<leader><TAB>', -- Move to next buffer
  switch_buffer_prev = '<leader><S-TAB>', -- Move to previous buffer
  switch_window_next = '<TAB>', -- Move to next window split
}

-- Function to set keybindings
local function setKeybindings()
  vim.api.nvim_set_keymap('n', keybindings.nvim_tree_toggle, ':NvimTreeToggle<CR>', { noremap = true, silent = true })
  vim.api.nvim_set_keymap('n', keybindings.telescope_find_files, ':Telescope find_files<CR>', { noremap = true, silent = true })
  vim.api.nvim_set_keymap('n', keybindings.telescope_live_grep, ':Telescope live_grep<CR>', { noremap = true, silent = true })
  vim.api.nvim_set_keymap('n', keybindings.dap_continue, ':lua require"dap".continue()<CR>', { noremap = true, silent = true })
  vim.api.nvim_set_keymap('n', keybindings.dap_step_over, ':lua require"dap".step_over()<CR>', { noremap = true, silent = true })
  vim.api.nvim_set_keymap('n', keybindings.dap_step_into, ':lua require"dap".step_into()<CR>', { noremap = true, silent = true })
  vim.api.nvim_set_keymap('n', keybindings.dap_step_out, ':lua require"dap".step_out()<CR>', { noremap = true, silent = true })
  vim.api.nvim_set_keymap('n', keybindings.dap_toggle_breakpoint, ':lua require"dap".toggle_breakpoint()<CR>', { noremap = true, silent = true })
  vim.api.nvim_set_keymap('n', keybindings.split_vertically, ':vsplit<CR>', { noremap = true, silent = true })
  vim.api.nvim_set_keymap('n', keybindings.split_horizontally, ':split<CR>', { noremap = true, silent = true })
  vim.api.nvim_set_keymap('n', keybindings.switch_buffer_next, ':bnext<CR>', { noremap = true, silent = true })
  vim.api.nvim_set_keymap('n', keybindings.switch_buffer_prev, ':bprevious<CR>', { noremap = true, silent = true })
  vim.api.nvim_set_keymap('n', keybindings.switch_window_next, '<C-w>w', { noremap = true, silent = true })
end

-- Function to setup basic Vim configuration
local function setupVimConfig()
  vim.g.mapleader = vimLeader
  vim.g.maplocalleader = vimLeader
  vim.opt.tabstop = tabWidth
  vim.opt.softtabstop = tabWidth
  vim.opt.shiftwidth = tabWidth
  vim.wo.number = lineNumbers
  vim.cmd [[
    highlight LineNr guifg=#5eacd3 guibg=#1e1e1e
    highlight CursorLineNr guifg=#ff8800 guibg=#1e1e1e
  ]]
end

-- Function to initialize plugin manager
local function initPluginManager(use)
  use 'wbthomason/packer.nvim'
end

-- Function to initialize tree view
local function initTreeView(use)
  use {
    'kyazdani42/nvim-tree.lua',
    requires = 'kyazdani42/nvim-web-devicons',
    config = function()
      require('nvim-tree').setup {}
    end
  }

  require('nvim-treesitter.configs').setup {
    ensure_installed = {"cpp", "lua", "python", "javascript"}, -- Specify languages explicitly
    highlight = {
      enable = true,
      additional_vim_regex_highlighting = false,
    },
  }
end

-- Function to initialize syntax highlighting
local function initSyntaxHighlighting(use)
  use {
    'nvim-treesitter/nvim-treesitter',
    run = ':TSUpdate'
  }
end

-- Function to initialize intellisense
local function initIntellisense(use)
  use 'neovim/nvim-lspconfig'
  use 'hrsh7th/nvim-cmp'
  use 'hrsh7th/cmp-nvim-lsp'
  use 'hrsh7th/cmp-buffer'
  use 'hrsh7th/cmp-path'
  use 'hrsh7th/cmp-cmdline'
  use 'L3MON4D3/LuaSnip'

  local nvim_lsp = require('lspconfig')
  local cmp = require'cmp'

  cmp.setup({
    snippet = {
      expand = function(args)
        require('luasnip').lsp_expand(args.body)
      end,
    },
    mapping = {
      [keybindings.cmp_scroll_docs_up] = cmp.mapping.scroll_docs(-4),
      [keybindings.cmp_scroll_docs_down] = cmp.mapping.scroll_docs(4),
      [keybindings.cmp_complete] = cmp.mapping.complete(),
      [keybindings.cmp_close] = cmp.mapping.close(),
      [keybindings.cmp_confirm] = cmp.mapping.confirm({ select = true }),
    },
    sources = {
      { name = 'nvim_lsp' },
      { name = 'buffer' },
      { name = 'path' },
    }
  })

	vim.diagnostic.config({
		virtual_text = false, -- Disable inline diagnostics
		signs = true,         -- Keep signs in the sign column
		underline = true,     -- Keep underlining of diagnostics
		update_in_insert = false, -- Disable updates in insert mode
		severity_sort = true,
	})

	-- Ensure this is added after setting up the LSP server
	require('lspconfig').clangd.setup {
		capabilities = require('cmp_nvim_lsp').default_capabilities(vim.lsp.protocol.make_client_capabilities()),
		on_attach = function(client, bufnr)
			vim.diagnostic.disable(bufnr) -- Disable diagnostics for this buffer
		end,
	}
end

-- Function to initialize file finder
local function initFileFinder(use)
  use {
    'nvim-telescope/telescope.nvim',
    requires = { {'nvim-lua/plenary.nvim'} }
  }
end

-- Function to initialize tabs
local function initTabs(use)
  use {
    'akinsho/bufferline.nvim',
    requires = 'kyazdani42/nvim-web-devicons',
    config = function()
      require('bufferline').setup {}
    end
  }

  vim.opt.termguicolors = true
  require("bufferline").setup{}
end

-- Function to initialize debugger
local function initDebugger(use)
  use 'mfussenegger/nvim-dap'
  use 'rcarriga/nvim-dap-ui'
  use 'nvim-neotest/nvim-nio'

  local dap = require('dap')
  local dapui = require('dapui')
  dapui.setup()

  dap.adapters.lldb = {
    id = 'lldb',
    type = 'executable',
    command = '/usr/bin/lldb'
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
end

local function initTheme(use)
		use { "ellisonleao/gruvbox.nvim" }
		use { "projekt0n/github-nvim-theme" }
    vim.o.background = "dark"
		-- available: gruvbox | github_dark
		vim.cmd([[colorscheme github_dark]])
end

-- Function to initialize plugins
local function initPlugins()
  vim.cmd [[packadd packer.nvim]]

  return require('packer').startup(function(use)
    initPluginManager(use)
    initTreeView(use)
    initSyntaxHighlighting(use)
    initIntellisense(use)
    initFileFinder(use)
    --initTabs(use)
    initDebugger(use)
		initTheme(use)

    if packer_bootstrap then
      require('packer').sync()
    end
  end)
end

-- Function to display load message and usage crash course
local function onLoadMessage()
  print([[
Lua config loaded: ~/.config/nvim/init.lua
In order to install plugins call :PackerInstall | :PackerUpdate | :TSUpdate

Crash Course on Usage:

Keybindings:
  - ]] .. keybindings.nvim_tree_toggle .. [[ : Toggle file explorer (nvim-tree)
  - ]] .. keybindings.telescope_find_files .. [[ : Find files (telescope)
  - ]] .. keybindings.telescope_live_grep .. [[ : Search text in project (telescope)
  - ]] .. keybindings.dap_continue .. [[ : Start/continue debugging (nvim-dap)
  - ]] .. keybindings.dap_step_over .. [[ : Step over during debugging (nvim-dap)
  - ]] .. keybindings.dap_step_into .. [[ : Step into during debugging (nvim-dap)
  - ]] .. keybindings.dap_step_out .. [[ : Step out during debugging (nvim-dap)
  - ]] .. keybindings.dap_toggle_breakpoint .. [[ : Toggle breakpoint (nvim-dap)
  - ]] .. keybindings.split_vertically .. [[ : Split window vertically
  - ]] .. keybindings.split_horizontally .. [[ : Split window horizontally
  - ]] .. keybindings.switch_buffer_next .. [[ : Move to next buffer
  - ]] .. keybindings.switch_buffer_prev .. [[ : Move to previous buffer
  - ]] .. keybindings.switch_window_next .. [[ : Move to next window split

Plugins:
  - nvim-tree.lua: File explorer to navigate your project directory.
  - nvim-treesitter: Enhanced syntax highlighting.
  - nvim-lspconfig: Configurations for built-in LSP (Language Server Protocol).
  - nvim-cmp: Autocompletion plugin with LSP support.
  - telescope.nvim: Fuzzy finder and file searcher.
  - bufferline.nvim: Enhanced buffer/tab line.
  - nvim-dap: Debug Adapter Protocol for debugging.
  - nvim-dap-ui: UI for nvim-dap.

Example Workflow:
  1. Start Neovim and open your project directory.
  2. Use ]] .. keybindings.nvim_tree_toggle .. [[ to toggle the file explorer and navigate your project files.
  3. Use ]] .. keybindings.telescope_find_files .. [[ to quickly find and open files.
  4. Use ]] .. keybindings.telescope_live_grep .. [[ to search for specific text within your project.
  5. Edit your code with autocompletion and LSP support.
  6. Set breakpoints using ]] .. keybindings.dap_toggle_breakpoint .. [[.
  7. Start debugging your project using ]] .. keybindings.dap_continue .. [[.
  8. Step through your code using ]] .. keybindings.dap_step_over .. [[, ]] .. keybindings.dap_step_into .. [[, and ]] .. keybindings.dap_step_out .. [[.

]])
end

onLoadMessage()
setupVimConfig()
initPlugins()
setKeybindings()

