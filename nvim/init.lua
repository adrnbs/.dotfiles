--[[ init.lua ]]
--

-- LEADER
-- These keybindings need to be defined before the first /
-- is called; otherwise, it will default to "\"
--vim.g.mapleader = ","
--vim.g.localleader = "\\"

vim.cmd "colorscheme catppuccin"

-- IMPORTS
require('vars')		-- Variables
require('opts')		-- Options
require('keys')	    -- Keymaps
require('plug')	    -- Plugins
require('cat')      -- Catppuccin
require('tree')     -- Nvim-tree
require('config.lualine') -- Configuration for lualine

-- PLUGINS
require('nvim-tree').setup{}

require('lualine').setup {
	options = {
		theme = "catppuccin"
	}
}

-- LSP
require('mason').setup{}
require'lspconfig'.terraformls.setup{}
--vim.api.nvim_create_autocmd({"BufWritePre"}, {
--  pattern = {"*.tf", "*.tfvars"},
--  callback = vim.lsp.buf.formatting_sync
--})
