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
    tag = '0.1.0',
    dependencies = {{ 'nvim-lua/plenary.nvim' }}
  },

  {
    "iamcco/markdown-preview.nvim",
    build = function() vim.fn["mkdp#util#install"]() end,
  },

  {
  'nvim-orgmode/orgmode',
  dependencies = {
    { 'nvim-treesitter/nvim-treesitter', lazy = true },
  },
  event = 'VeryLazy',
  config = function()
    -- Load treesitter grammar for org
    require('orgmode').setup_ts_grammar()

    -- Setup treesitter
    require('nvim-treesitter.configs').setup({
      highlight = {
        enable = true,
        additional_vim_regex_highlighting = { 'org' },
      },
      ensure_installed = { 'org' },
    })

    -- Setup orgmode
    require('orgmode').setup({
      org_agenda_files = '~/orgfiles/**/*',
      -- Update if necessary if you don't want to use refile
      org_default_notes_file = '~/orgfiles/refile.org',
    })
  end,
},
    
  })
