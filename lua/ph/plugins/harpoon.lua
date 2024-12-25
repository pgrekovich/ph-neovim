return {
	"ThePrimeagen/harpoon",
	branch = "harpoon2",
	dependencies = {
		"nvim-lua/plenary.nvim",
	},
	config = function()
		local harpoon = require("harpoon")
		harpoon:setup({
			settings = {
				save_on_toggle = true,
				sync_on_ui_close = true,
			},
		})

		vim.keymap.set("n", "<leader>aa", function()
			harpoon:list():add()
		end, { desc = "Harpoon: Add to list" })

		vim.keymap.set("n", "<leader>al", function()
			harpoon.ui:toggle_quick_menu(harpoon:list())
		end, { desc = "Harpoon: List of files" })

		-- Toggle previous & next buffers stored within Harpoon list
		vim.keymap.set("n", "<leader>ap", function()
			harpoon:list():prev()
		end, { desc = "Harpoon: Next buffer" })
		vim.keymap.set("n", "<leader>an", function()
			harpoon:list():next()
		end, { desc = "Harpoon: Previous buffer" })
	end,
}
