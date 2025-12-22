---@module "lazy"
---@type LazySpec
return {
	-- core nvim treesitter and treesitter context
	{
		'nvim-treesitter/nvim-treesitter',
		dependencies = {
			'nvim-treesitter/nvim-treesitter-context',
		},
		lazy = false,
		branch = 'main',
		build = ':TSUpdate',
		event = { 'BufReadPost', 'BufNewFile' },
		config = function()
			local ts = require 'nvim-treesitter'

			-- Install core parsers at startup
			ts.install {
				'bash',
				'c',
				'cpp',
				'css',
				'diff',
				'git_config',
				'git_rebase',
				'gitcommit',
				'gitignore',
				'html',
				'json',
				'lua',
				'luadoc',
				'make',
				'markdown',
				'markdown_inline',
				'python',
				'query',
				'rust',
				'toml',
				'vim',
				'vimdoc',
			}

			local group = vim.api.nvim_create_augroup('TreesitterSetup', { clear = true })

			local ignore_filetypes = {
				'checkhealth',
				'lazy',
				'mason',
				'snacks_dashboard',
				'snacks_notif',
				'snacks_win',
			}

			-- Auto-install parsers and enable highlighting on FileType
			vim.api.nvim_create_autocmd('FileType', {
				group = group,
				desc = 'Enable treesitter highlighting and indentation',
				callback = function(event)
					if vim.tbl_contains(ignore_filetypes, event.match) then
						return
					end

					local lang = vim.treesitter.language.get_lang(event.match) or event.match
					local buf = event.buf

					-- Start highlighting immediately (works if parser exists)
					pcall(vim.treesitter.start, buf, lang)

					-- Enable treesitter indentation
					vim.bo[buf].indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
					vim.api.nvim_command("set nofoldenable")
					-- Install missing parsers (async, no-op if already installed)
					ts.install { lang }
				end,
			})
		end,
	},
	{
		'MeanderingProgrammer/treesitter-modules.nvim',
		dependencies = { 'nvim-treesitter/nvim-treesitter' },
		opts = {
			incremental_selection = {
				enable = true,
				keymaps = {
					init_selection = "<C-space>",
					node_incremental = "<C-space>",
					scope_incremental = true,
					node_decremental = "<bs>",
				},
			},
		},
	},
}
