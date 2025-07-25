vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
	use 'wbthomason/packer.nvim'

	use {
		'nvim-telescope/telescope.nvim', tag = '0.1.6',
		-- or                            , branch = '0.1.x',
		requires = { {'nvim-lua/plenary.nvim'} }
	}

	use({ 'rose-pine/neovim', as = 'rose-pine' })
	use({ "ellisonleao/gruvbox.nvim", as = 'gruvbox' })
	use { "catppuccin/nvim", as = "catppuccin" }

	use({ 'nvim-treesitter/nvim-treesitter', {run = ':TSUpdate'}})
	use('theprimeagen/harpoon')
	use('mbbill/undotree')
	use('tpope/vim-fugitive')

    use {
        'nvim-pack/nvim-spectre',
        requires = { 'nvim-lua/plenary.nvim' }
    }

	use {
		'VonHeikemen/lsp-zero.nvim',
		branch = 'v3.x',
		requires = {
			 {'williamboman/mason.nvim'},
			 {'williamboman/mason-lspconfig.nvim'},

			{'neovim/nvim-lspconfig'},
			{'hrsh7th/nvim-cmp'},
			{'hrsh7th/cmp-nvim-lsp'},
			{'L3MON4D3/LuaSnip'},
		}
	}

    use {
        "robitx/gp.nvim",
        config = function()
            local conf = require("nl.ai")
            require("gp").setup(conf)

            -- Setup shortcuts here (see Usage > Shortcuts in the Documentation/Readme)
        end,
    }

	use {
    'kyazdani42/nvim-tree.lua',
    requires = 'kyazdani42/nvim-web-devicons',
    config = function()
      require('nvim-tree').setup {}
    end
  }

	use('mfussenegger/nvim-dap')
	use('rcarriga/nvim-dap-ui')
	use('nvim-neotest/nvim-nio')
    use('braxtons12/blame_line.nvim')

    use({ 'Pocco81/auto-save.nvim',  as = 'auto-save' })
end)

