return {
	"mfussenegger/nvim-lint",
	event = { "BufReadPost", "BufNewFile" },
	config = function()
		local lint = require("lint")
		lint.linters_by_ft = { python = { "ruff" } }

		vim.api.nvim_create_autocmd({ "BufWritePost", "InsertLeave" }, {
			group = vim.api.nvim_create_augroup("python-lint", { clear = true }),
			callback = function(event)
				vim.api.nvim_buf_call(event.buf, function()
					if vim.bo.filetype == "python" then
						lint.try_lint()
					end
				end)
			end,
		})

		vim.schedule(function()
			if vim.bo.filetype == "python" then
				lint.try_lint()
			end
		end)
	end,
}
