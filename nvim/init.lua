--[[ init.lua ]]
--

-- LEADER
-- These keybindings need to be defined before the first /
-- is called; otherwise, it will default to "\"
--vim.g.mapleader = ","
--vim.g.localleader = "\\"

-- On new machines without packer, the following must be executed for
-- other plugins to initialize and download:
--
-- 1. Clone packer and install it: 
-- git clone --depth 1 https://github.com/wbthomason/packer.nvim\
-- ~/.local/share/nvim/site/pack/packer/start/packer.nvim
--
-- 2. Ensure packer is included within the plug.lua (or equivalent) file.
-- See lua/plug.lua #initialize tag content for information.

vim.cmd "colorscheme catppuccin"

-- Set browser for markdown-preview server
vim.cmd([[
    let g:mkdp_browser = '/usr/bin/firefox-bin'
]])

-- Imports
require('core.vars')            		-- Variables
require('core.opts')		            -- Options
require('core.keys')	                -- Keymaps
require('core.plugins')	                -- Plugins
require('core.plugin-config.cat')       -- Catppuccin
require('core.plugin-config.tree')      -- Nvim-tree
require('core.plugin-config.completions') -- LSP
require('core.plugin-config.lsp-config')
require('core.plugin-config.telescope')
require('core.plugin-config.lualine')

require('nvim-tree').setup {}

require('lualine').setup { -- Configuration for lualine
    options = {
        theme = "catppuccin"
    }
}
