-- Some configs
require('config.options')
require('config.autocmd')
require('config.keybinds')

-- LSP
require('config.lsp')
-- require('lsp.luals')
-- -- vim.lsp.enable({ 'pyright' })
-- require('lsp.pyright')

-- Installing lazy
require("config.lazy")

-- Configuring treesitter
-- require("lazy").setup({
--  {"nvim-treesitter/nvim-treesitter", branch = 'master', lazy = false, build = ":TSUpdate"}
-- })

-- vim.opt.termguicolors = true
-- vim.cmd("colorscheme matcha")
