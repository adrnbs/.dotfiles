--[[ init.lua ]]

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

vim.g.mapleader = ","

-- Set browser for markdown-preview server
vim.cmd([[
    let g:mkdp_browser = '/usr/bin/firefox-bin'
]])

-- Imports
require('core.vars')            		-- Variables
require('core.opts')		            -- Options
require('core.keys')	                -- Keymaps
require('core.task')
require('core.plugins')
require('core.plugin-config.tree')      -- Nvim-tree
require('core.plugin-config.completions') -- LSP
require('core.plugin-config.lsp-config')
require('core.plugin-config.telescope')
require('core.plugin-config.lualine')

require('nvim-tree').setup {}

-- Remove eob default `~`
vim.cmd([[
    set fillchars=eob:\ 
]])
