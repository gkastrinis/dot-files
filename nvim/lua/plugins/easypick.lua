return {
	"axkirillov/easypick.nvim",
	lazy = true,
	cmd = "Easypick",
	dependencies = "nvim-telescope/telescope.nvim",
	config = function()
		local easypick = require("easypick")
		easypick.setup({
			pickers = {
				{
					name = "ls",
					command = "ls",
					previewer = easypick.previewers.default(),
				},
				{
					name = "changed_files",
					command = "git diff --name-only $(git merge-base HEAD " .. "main" .. " )",
					previewer = easypick.previewers.branch_diff({ base_branch = "main" }),
				},
				{
					name = "conflicts",
					command = "git diff --name-only --diff-filter=U --relative",
					previewer = easypick.previewers.file_diff(),
				},
			},
		})
	end,
}
