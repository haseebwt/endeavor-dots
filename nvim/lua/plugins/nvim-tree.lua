return {
	"nvim-tree/nvim-tree.lua",
	version = "*",
	lazy = false,
	dependencies = {
		"nvim-tree/nvim-web-devicons",

		'b0o/nvim-tree-preview.lua',
		dependencies = {
			'nvim-lua/plenary.nvim',
		},
	},
	config = function()
		require("nvim-tree").setup({
			actions = {
				open_file = {
					quit_on_open = true,
				},
			},
			update_cwd = true,
			update_focused_file = {
				enable = true,
				update_cwd = true,
			},
			on_attach = function(bufnr)
				local api = require('nvim-tree.api')

				-- Important: When you supply an `on_attach` function, nvim-tree won't
				-- automatically set up the default keymaps. To set up the default keymaps,
				-- call the `default_on_attach` function. See `:help nvim-tree-quickstart-custom-mappings`.
				api.config.mappings.default_on_attach(bufnr)

				local function opts(desc)
					return { desc = 'nvim-tree: ' .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
				end

				local preview = require('nvim-tree-preview')

				vim.keymap.set('n', 'P', preview.watch, opts 'Preview (Watch)')
				vim.keymap.set('n', '<Esc>', preview.unwatch, opts 'Close Preview/Unwatch')
				vim.keymap.set('n', '<C-j>', function() return preview.scroll(4) end, opts 'Scroll Down')
				vim.keymap.set('n', '<C-k>', function() return preview.scroll(-4) end, opts 'Scroll Up')

				-- Option A: Smart tab behavior: Only preview files, expand/collapse directories (recommended)
				vim.keymap.set('n', '<Tab>', function()
					local ok, node = pcall(api.tree.get_node_under_cursor)
					if ok and node then
						if node.type == 'directory' then
							api.node.open.edit()
						else
							preview.node(node, { toggle_focus = true })
						end
					end
				end, opts 'Preview')
			end,
		})
		require("nvim-tree-preview").setup({
			image_preview = {
				enable = true, -- Whether to preview images (for more info see Previewing Images section in README)
				patterns = { -- List of Lua patterns matching image file names
					'.*%.png$',
					'.*%.jpg$',
					'.*%.jpeg$',
					'.*%.gif$',
					'.*%.webp$',
					'.*%.avif$',
					-- Additional patterns:
					-- '.*%.svg$',
					-- '.*%.bmp$',
					-- '.*%.pdf$', (known to have issues)
				},
			},
		})
	end,
}
