return {
	"akinsho/toggleterm.nvim",
	config = function()
		require("toggleterm").setup({
			size = function(term)
				if term.direction == "horizontal" then
					return vim.o.lines * 0.4
				elseif term.direction == "vertical" then
					return vim.o.columns * 0.4
				end
			end,
			close_on_exit = true, -- close the terminal window when the process exits
			shell = vim.o.shell,
			auto_scroll = true,
			open_mapping = [[<c-t>]],
			insert_mappings = true, -- whether or not the open mapping applies in insert mode
			hide_numbers = true, -- hide the number column in toggleterm buffers
			direction = "float",
			float_opts = {
				border = "double",
			},
			highlights = {
				FloatBorder = {
					guifg = "#fc5603",
				},
			},
		})
	end,
}
