-- [[ plug.lua ]]

return require('packer').startup(function(use)
  -- [[ Plugins Go Here ]]
  use 'wbthomason/packer.nvim'

  use {                                              -- filesystem navigation
    'kyazdani42/nvim-tree.lua',
    requires = 'kyazdani42/nvim-web-devicons'        -- filesystem icons
  }

  -- [[ Theme ]]
  use { 'mhinz/vim-startify' }                       -- start screen
  use { 'danilamihailov/beacon.nvim' }               -- cursor jump
  use {
      'nvim-lualine/lualine.nvim',                   -- statusline
      requires = 'kyazdani42/nvim-web-devicons'
  }
  use { 'Mofiqul/dracula.nvim' }                     -- colorscheme
end)
