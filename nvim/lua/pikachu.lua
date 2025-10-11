local M = {}

local colors = {
	bg = "#001224",
	fg = "#f7ebd2",
	white = "#f2f2ed",
	gold = "#fcba03",
	red = "#fc2c03",
	orange = "#fc5603",
	yellow = "#fcfc03",
	lime = "#bafc03",
	brown = "#241f00",
	light_blue = "#03e7fc",
}

function M.colorscheme()
	-- vim.cmd("highlight clear")
	vim.cmd("syntax reset")

	vim.o.background = "dark"
	vim.g.colors_name = "pikachu"

	local set = vim.api.nvim_set_hl

	-- set(0, "Normal", { bg = colors.bg, fg = colors.fg })
	-- set(0, "EndOfBuffer", { bg = colors.bg, fg = colors.fg })
	set(0, "Visual", { bg = colors.gold })
	set(0, "CursorLineNr", { fg = colors.fg })
	set(0, "CurSearch", { bg = colors.lime })
	set(0, "IncSearch", { bg = colors.yellow })
	set(0, "Search", { bg = colors.yellow })
	-- set(0, "ColorColumn", { bg = colors.brown })
end

return M
