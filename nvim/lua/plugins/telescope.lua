return {
	'nvim-telescope/telescope.nvim',
	tag = "v0.2.0",
	dependencies = { 'nvim-lua/plenary.nvim' },

	require('telescope').setup {
		pickers = {
			find_files = {
				hidden = true
			},
			live_grep = {
				hidden = true
			}
		},
		defaults = {
			mappings = {
				i = {
					["<C-u>"] = false
				},
			},
		},
	},
}
