--  NOTE: Must happen before plugins are loaded (otherwise wrong leader will be used)
require("options")

-- [[ Install `lazy.nvim` plugin manager ]]
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
	local lazyrepo = "https://github.com/folke/lazy.nvim.git"
	local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
	if vim.v.shell_error ~= 0 then
		error("Error cloning lazy.nvim:\n" .. out)
	end
end

---@type vim.Option
local rtp = vim.opt.rtp
rtp:prepend(lazypath)

-- [[ :Lazy ]]
require("lazy").setup({
	{
		"goolord/alpha-nvim",
		lazy = false,
		cond = function()
			return vim.fn.argc() == 0 -- Only load if no file was opened
		end,
		dependencies = { "nvim-mini/mini.icons" },
		config = function()
			local alpha = require("alpha")
			local startify = require("alpha.themes.startify")
			startify.section.header.val = {
				[[                                                                       ]],
				[[                                                                     ]],
				[[       ████ ██████           █████      ██                     ]],
				[[      ███████████             █████                             ]],
				[[      █████████ ███████████████████ ███   ███████████   ]],
				[[     █████████  ███    █████████████ █████ ██████████████   ]],
				[[    █████████ ██████████ █████████ █████ █████ ████ █████   ]],
				[[  ███████████ ███    ███ █████████ █████ █████ ████ █████  ]],
				[[ ██████  █████████████████████ ████ █████ █████ ████ ██████ ]],
				[[                                                                       ]],
			}
			alpha.setup(startify.opts)
			vim.cmd([[autocmd FileType alpha setlocal nofoldenable]])
		end,
	},

	"NMAC427/guess-indent.nvim",
	{
		"zhimsel/vim-stay",
		event = "BufReadPost",
	},
	-- Load plugin configurations
	-- Note: These are just returning table specs, not executing configs
	{ import = "plugins.toggleterm" },
	{ import = "plugins.telescope" },
	{ import = "plugins.easypick" },
	{ import = "plugins.treesitter" },
	{ import = "plugins.lspconfig" },
	{ import = "plugins.lazydev" },
	-- { import = "plugins.completion" },
	{ import = "plugins.conform" },
	{ import = "plugins.gitsigns" },
	{ import = "plugins.whichkey" },
	{ import = "plugins.todo" },

	{
		"nvim-lualine/lualine.nvim",
		event = "VeryLazy",
		dependencies = { "nvim-tree/nvim-web-devicons" },
		config = function()
			require("lualine").setup({ options = { theme = "molokai" } })
		end,
	},
	-- {
	-- 	"f-person/auto-dark-mode.nvim",
	-- 	lazy = false,
	-- 	priority = 1000,
	-- 	opts = {
	-- 		update_interval = 1000,
	-- 		set_dark_mode = function()
	-- 			-- vim.api.nvim_set_option("background", "dark")
	-- 			-- vim.cmd("colorscheme github_dark")
	-- 			vim.cmd("colorscheme cyberdream")
	-- 		end,
	-- 		set_light_mode = function()
	-- 			-- vim.api.nvim_set_option("background", "light")
	-- 			vim.cmd("colorscheme modus_operandi")
	-- 		end,
	-- 	},
	-- },
	-- { "miikanissi/modus-themes.nvim", lazy = true },
	{ "scottmckendry/cyberdream.nvim", lazy = true },
	-- { "projekt0n/github-nvim-theme", lazy = true },
}, {
	ui = {
		-- If you are using a Nerd Font: set icons to an empty table which will use the
		-- default lazy.nvim defined Nerd Font icons, otherwise define a unicode icons table
		icons = vim.g.have_nerd_font and {} or {
			cmd = "⌘",
			config = "🛠",
			event = "📅",
			ft = "📂",
			init = "⚙",
			keys = "🗝",
			plugin = "🔌",
			runtime = "💻",
			require = "🌙",
			source = "📄",
			start = "🚀",
			task = "📌",
			lazy = "💤 ",
		},
	},
})

require("mappings")
require("pikachu").colorscheme()
vim.cmd("colorscheme cyberdream")

-- The line beneath this is called `modeline`. See `:help modeline`
-- vim: ts=4 sts=4 sw=4 et
