return {
	"saghen/blink.cmp",
	dependencies = {
		"saghen/blink.lib",
	},
	build = function()
		require("blink.cmp").build():pwait()
	end,
	opts = {
		keymap = {
			preset = "enter",
			["<Tab>"] = { "select_next", "fallback" },
			["<S-Tab>"] = { "select_prev", "fallback" },
		},
		sources = { default = { "lsp", "path", "buffer" } },
	},
}
