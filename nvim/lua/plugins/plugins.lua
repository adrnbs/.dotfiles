-- [[ plugins.lua ]]

return {
  -- Project browser
  { "nvim-tree/nvim-tree.lua" },
  { "nvim-tree/nvim-web-devicons" },
  { "christoomey/vim-tmux-navigator" },

  -- add dracula
  --{ "Mofiqul/dracula.nvim" },

    {
      'sainnhe/gruvbox-material',
      lazy = false,
      priority = 1000,
      config = function()
        -- Optionally configure and load the colorscheme
        -- directly inside the plugin declaration.
        vim.g.gruvbox_material_enable_italic = true
        vim.cmd.colorscheme('gruvbox-material')
      end
    },

  -- Configure LazyVim to load dracula
  -- {
  --   "LazyVim/LazyVim",
  --   opts = {
  --     colorscheme = "",
  --   },
  -- },

  {
      'nvim-treesitter/nvim-treesitter',
      build = function() require('nvim-treesitter.install').update({ with_sync = true }) end,
  },

  {
    "toppair/peek.nvim",
    event = { "VeryLazy" },
    build = "deno task --quiet build:fast",
    config = function()
        require("peek").setup()
        vim.api.nvim_create_user_command("PeekOpen", require("peek").open, {})
        vim.api.nvim_create_user_command("PeekClose", require("peek").close, {})
    end,
  },

  }
