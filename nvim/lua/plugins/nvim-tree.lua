return {
  "nvim-tree/nvim-tree.lua",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  cmd = { "NvimTreeToggle", "NvimTreeFocus" },
  opts = {
    view = {
      width = 35,
      relativenumber = false,
      number = false,
    },
    filters = {
      dotfiles = false, -- This will show hidden files
    },
    renderer = {
      highlight_git = true,
      icons = {
        show = {
          file = true,
          folder = true,
          folder_arrow = true,
          git = true,
        },
      },
    },
  },
  keys = {
    { "<leader>e", "<cmd>NvimTreeToggle<cr>", desc = "Explorer NvimTree" },
  },
}

