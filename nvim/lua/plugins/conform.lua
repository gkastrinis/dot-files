-- Resolve ruff from the nearest project .venv; fall back to the one on $PATH / Mason.
local function project_ruff(_, ctx)
	local root = vim.fs.root(ctx.dirname, ".venv")
	if root then
		local bin = root .. "/.venv/bin/ruff"
		if vim.fn.executable(bin) == 1 then
			return bin
		end
	end
	return "ruff"
end

-- Autoformat
return {
	"stevearc/conform.nvim",
	event = { "BufWritePre" },
	cmd = { "ConformInfo" },
	keys = {
		{
			"<leader>f",
			function()
				require("conform").format({ async = true, lsp_format = "fallback" })
			end,
			mode = "",
			desc = "[F]ormat buffer",
		},
	},
	opts = {
		notify_on_error = true,
		format_on_save = function(bufnr)
			-- Disable "format_on_save lsp_fallback" for languages that don't
			-- have a well standardized coding style. You can add additional
			-- languages here or re-enable it for the disabled ones.
			local disable_filetypes = { c = true, cpp = true }
			if disable_filetypes[vim.bo[bufnr].filetype] then
				return nil
			else
				return {
					timeout_ms = 3000,
					lsp_format = "fallback",
				}
			end
		end,
		formatters_by_ft = {
			lua = { "stylua" },
			-- Conform can also run multiple formatters sequentially
			-- Only remove unused imports on save; Ruff diagnostics are provided by nvim-lint.
			python = { "ruff_fix", "ruff_format" },
		},
		formatters = {
			ruff_format = {
				-- Prefer the project's pinned ruff (.venv) over Mason's to match CI.
				command = project_ruff,
			},
			ruff_fix = {
				command = project_ruff,
				-- Limit Ruff's save-time fixes to F401 (unused imports).
				args = {
					"check",
					"--select=F401",
					"--fix",
					"--force-exclude",
					"--exit-zero",
					"--no-cache",
					"--stdin-filename",
					"$FILENAME",
					"-",
				},
			},
		},
	},
}
