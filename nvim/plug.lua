-- [[ plug.lua ]]

return require('packer').startup(function(use)
  -- [[ Plugins Go Here ]]
  use 'wbthomason/packer.nvim'
  use { "williamboman/mason.nvim" }
  use {
      'nvim-treesitter/nvim-treesitter',
      run = function() require('nvim-treesitter.install').update({ with_sync = true }) end,
  }

  use 'neovim/nvim-lspconfig' -- Collection of configurations for built-in LSP client
 
  use {                                              -- filesystem navigation
    'kyazdani42/nvim-tree.lua',
    requires = 'kyazdani42/nvim-web-devicons'        -- filesystem icons
  }
  
  -- [[ Theme ]]
  use { "mhinz/vim-startify" }
  use { 'danilamihailov/beacon.nvim' }               -- cursor jump
  use {
      'nvim-lualine/lualine.nvim',                   -- statusline
      requires = 'kyazdani42/nvim-web-devicons'
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

-- MarkdownPreview
-- install without yarn or npm
use({
    "iamcco/markdown-preview.nvim",
    run = function() vim.fn["mkdp#util#install"]() end,
})

use({ "iamcco/markdown-preview.nvim", run = "cd app && npm install", setup = function() vim.g.mkdp_filetypes = { "markdown" } end, ft = { "markdown" }, })

end)
