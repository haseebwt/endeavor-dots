return {
	'akinsho/bufferline.nvim',
	dependencies = 'kyazdani42/nvim-web-devicons',
	--[[ tag = "v3.*", ]]
	config = function()
		local status_ok, bufferline = pcall(require, "bufferline")
		if not status_ok then
			return
		end

		vim.opt.termguicolors = true
		bufferline.setup({
			options = {
				seperator_style = "thick",
				style_preset = bufferline.style_preset.no_italic,
				offsets = {
					{
						filetype = "NvimTree",
						text = "File Explorer",
						highlight = "Directory",
						separator = true -- use a "true" to enable the default, or set your own character
					},
				},
			},
		})
	end,

	diagnostics_indicator = function(count, level, diagnostics_dict, context)
		local icon = level:match("error") and " " or " "
		return " " .. icon .. count
	end,

	numbers = function(opts)
		return string.format('%s|%s', opts.id, opts.raise(opts.ordinal))
	end,
}
