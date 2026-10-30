return {
	"neovim/nvim-lspconfig",
	event = { "BufReadPre", "BufNewFile" },
	dependencies = {
		{ "mason-org/mason.nvim", opts = {} },
		"mason-org/mason-lspconfig.nvim",
		"WhoIsSethDaniel/mason-tool-installer.nvim",
		"saghen/blink.cmp",
		{ "j-hui/fidget.nvim", event = "LspAttach", opts = {} },
	},
	config = function()
		local attach_group = vim.api.nvim_create_augroup("lsp-attach", { clear = true })
		local highlight_group = vim.api.nvim_create_augroup("lsp-document-highlight", { clear = true })
		local detach_group = vim.api.nvim_create_augroup("lsp-document-highlight-cleanup", { clear = true })

		vim.api.nvim_create_autocmd("LspAttach", {
			group = attach_group,
			callback = function(event)
				local function map(keys, action, description, mode)
					vim.keymap.set(mode or "n", keys, action, {
						buffer = event.buf,
						desc = "LSP: " .. description,
					})
				end

				map("grn", vim.lsp.buf.rename, "Rename")
				map("gra", vim.lsp.buf.code_action, "Code action", { "n", "x" })
				map("grr", function() require("telescope.builtin").lsp_references() end, "References")
				map("gri", function() require("telescope.builtin").lsp_implementations() end, "Implementations")
				map("grd", function() require("telescope.builtin").lsp_definitions() end, "Definitions")
				map("grD", vim.lsp.buf.declaration, "Declaration")
				map("gO", function() require("telescope.builtin").lsp_document_symbols() end, "Document symbols")
				map("gW", function() require("telescope.builtin").lsp_dynamic_workspace_symbols() end, "Workspace symbols")
				map("grt", function() require("telescope.builtin").lsp_type_definitions() end, "Type definitions")

				local client = vim.lsp.get_client_by_id(event.data.client_id)
				if client and client:supports_method(vim.lsp.protocol.Methods.textDocument_documentHighlight, event.buf) then
					vim.api.nvim_create_autocmd({ "CursorHold", "CursorHoldI" }, {
						group = highlight_group,
						buffer = event.buf,
						callback = vim.lsp.buf.document_highlight,
					})
					vim.api.nvim_create_autocmd({ "CursorMoved", "CursorMovedI" }, {
						group = highlight_group,
						buffer = event.buf,
						callback = vim.lsp.buf.clear_references,
					})
					vim.api.nvim_create_autocmd("LspDetach", {
						group = detach_group,
						buffer = event.buf,
						callback = function(detach_event)
							vim.api.nvim_buf_call(detach_event.buf, vim.lsp.buf.clear_references)
							vim.api.nvim_clear_autocmds({ group = highlight_group, buffer = detach_event.buf })
						end,
					})
				end

				if client and client:supports_method(vim.lsp.protocol.Methods.textDocument_inlayHint, event.buf) then
					map("<leader>th", function()
						vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled({ bufnr = event.buf }))
					end, "Toggle inlay hints")
				end
			end,
		})

		vim.diagnostic.config({
			severity_sort = true,
			float = { border = "rounded", source = "if_many" },
			underline = { severity = vim.diagnostic.severity.ERROR },
			signs = vim.g.have_nerd_font and {
				text = {
					[vim.diagnostic.severity.ERROR] = "󰅚 ",
					[vim.diagnostic.severity.WARN] = "󰀪 ",
					[vim.diagnostic.severity.INFO] = "󰋽 ",
					[vim.diagnostic.severity.HINT] = "󰌶 ",
				},
			} or {},
			virtual_text = { source = "if_many", spacing = 2 },
		})

		vim.lsp.config("*", { capabilities = require("blink.cmp").get_lsp_capabilities() })
		vim.lsp.config("lua_ls", {
			settings = { Lua = { completion = { callSnippet = "Replace" } } },
		})

		require("mason-tool-installer").setup({ ensure_installed = { "ruff", "stylua" } })
		require("mason-lspconfig").setup({
			ensure_installed = { "lua_ls", "pyright" },
			automatic_enable = true,
		})
	end,
}
