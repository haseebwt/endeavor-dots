return {
	'ThePrimeagen/harpoon',
	dependencies = { 'nvim-lua/plenary.nvim' },

	global_settings = {
		-- enable tabline with harpoon marks
		tabline = true,
		tabline_prefix = "   ",
		tabline_suffix = "   ",
	},

	config = function()
		vim.keymap.set("n", "<leader>a", " :lua require('harpoon.mark').add_file()<CR>") -- add file
		vim.keymap.set("n", "<C-e>", ':lua require("harpoon.ui").toggle_quick_menu()<CR>') -- open quick menu
		vim.keymap.set("n", "<leader>fl", ":Telescope harpoon marks<CR>")            -- harpoon in telescope
		vim.keymap.set("n", "<C-n>", ':lua require("harpoon.ui").nav_next()<CR>')    -- navigates to next mark
		vim.keymap.set("n", "<C-p>", ':lua require("harpoon.ui").nav_prev()<CR>')    -- navigates to previous mark

		vim.cmd('highlight! HarpoonInactive guibg=NONE guifg=#63698c')
		vim.cmd('highlight! HarpoonActive guibg=NONE guifg=white')
		vim.cmd('highlight! HarpoonNumberActive guibg=NONE guifg=#7aa2f7')
		vim.cmd('highlight! HarpoonNumberInactive guibg=NONE guifg=#7aa2f7')
		vim.cmd('highlight! TabLineFill guibg=NONE guifg=white')
	end
}
