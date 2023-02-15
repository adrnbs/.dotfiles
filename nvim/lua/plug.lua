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

  use {
    'nvim-treesitter/nvim-treesitter',
    run = ':TSUpdate'
  }

  use {
    "nvim-neorg/neorg",
    tag = "*",
    after = "nvim-treesitter", -- You may want to specify Telescope here as well
    config = function()
        require('neorg').setup {
            load = {
                ["core.defaults"] = {}, -- Loads default behaviour
                ["core.norg.concealer"] = {}, -- Adds pretty icons to your documents
                ["core.norg.dirman"] = { -- Manages Neorg workspaces
                    config = {
                        workspaces = {
                            notes = "~/Documents/work/notes",
                        },
                    },
                },
            },
        }
    end,
    run = ":Neorg sync-parsers",
    requires = "nvim-lua/plenary.nvim",

}

-- MarkdownPreview
-- install without yarn or npm
use({
    "iamcco/markdown-preview.nvim",
    run = function() vim.fn["mkdp#util#install"]() end,
})

use({ "iamcco/markdown-preview.nvim", run = "cd app && npm install", setup = function() vim.g.mkdp_filetypes = { "markdown" } end, ft = { "markdown" }, })

end)
