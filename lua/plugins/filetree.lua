-- Unless you are still migrating, remove the deprecated commands from v1.x
vim.cmd([[ let g:neo_tree_remove_legacy_commands = 1 ]])

return {
	"nvim-neo-tree/neo-tree.nvim",
	version = "*",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
		"MunifTanjim/nui.nvim",
	},
	opts = {
		filesystem = {
			filtered_items = {
				visible = true, -- If you set this to `true`, all "hide" just mean "dimmed out"
				hide_dotfiles = false,
				hide_gitignored = true,
			},
			follow_current_file = { enabled = true }
		},
	},
	config = function(_, opts)
		require('neo-tree').setup(opts)
	end,
}
