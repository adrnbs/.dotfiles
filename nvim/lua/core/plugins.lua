-- [[ plugins.lua ]]

return require('packer').startup(function(use)

  -- #initialize -- required for packer to manage itself
  use 'wbthomason/packer.nvim'
  -- #initialize

  use 'williamboman/mason.nvim'
  use 'williamboman/mason-lspconfig.nvim'
  use 'neovim/nvim-lspconfig'
  use 'hrsh7th/nvim-cmp'
  use 'hrsh7th/cmp-nvim-lsp'
  use 'nvim-tree/nvim-tree.lua'
  use 'nvim-tree/nvim-web-devicons'
  use 'nvim-lualine/lualine.nvim'
  use 'mhinz/vim-startify'
  use 'danilamihailov/beacon.nvim'

  use {
      'nvim-treesitter/nvim-treesitter',
      run = function() require('nvim-treesitter.install').update({ with_sync = true }) end,
  }

  use {
    'nvim-telescope/telescope.nvim',
    tag = '0.1.0',
    requires = {{ 'nvim-lua/plenary.nvim' }}
  }

  use {                                              -- latte, frappe, macchiato, mocha
  	"catppuccin/nvim",
	as = "catppuccin",
	config = function()
		vim.g.catppuccin_flavour = "mocha"
		require("catppuccin").setup()
		vim.api.nvim_command "colorscheme catppuccin"
	end
  }

  use({
    "iamcco/markdown-preview.nvim",
    run = function() vim.fn["mkdp#util#install"]() end,
  })

end)
