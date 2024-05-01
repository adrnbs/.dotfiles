-- [[ plugins.lua ]]

require('lazy').setup({
  'williamboman/mason.nvim',
  -- LSP
  'williamboman/mason-lspconfig.nvim',
  'neovim/nvim-lspconfig',
  -- Completion
  'hrsh7th/nvim-cmp',
  'hrsh7th/cmp-nvim-lsp',
  'L3MON4D3/LuaSnip',
  'saadparwaiz1/cmp_luasnip',
  'rafamadriz/friendly-snippets',
  -- Project browser
  'nvim-tree/nvim-tree.lua',
  'nvim-tree/nvim-web-devicons',
  -- Misc
  'nvim-lualine/lualine.nvim',
  'mhinz/vim-startify',
  'danilamihailov/beacon.nvim',
  'christoomey/vim-tmux-navigator',

  { "olivercederborg/poimandres.nvim", name = "poimandres", priority = 1000 },
  {
      'nvim-treesitter/nvim-treesitter',
      build = function() require('nvim-treesitter.install').update({ with_sync = true }) end,
  },

  {
    'nvim-telescope/telescope.nvim',
    tag = '0.1.5',
    dependencies = {{ 'nvim-lua/plenary.nvim' }}
  },

  {
    "iamcco/markdown-preview.nvim",
    build = function() vim.fn["mkdp#util#install"]() end,
  },
  })
