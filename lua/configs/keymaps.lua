require("which-key").register({
	f = { "Find" },
	G = { "Git" },
	L = { "LSP" },
	D = { "Debugger " },
	["o"] = "which_key_ignore",
	["h"] = "which_key_ignore",
	["j"] = "which_key_ignore",
	["k"] = "which_key_ignore",
	["l"] = "which_key_ignore",
	["c"] = "which_key_ignore",
	["."] = "which_key_ignore",
	[","] = "which_key_ignore",
}, { prefix = "<leader>" })

-- Keymaps for better default experience
-- See `:help vim.keymap.set()`
vim.keymap.set({ 'n', 'v' }, '<Space>', '<Nop>', { silent = true })

-- Remap for dealing with word wrap
vim.keymap.set('n', 'k', "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
vim.keymap.set('n', 'j', "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })

vim.keymap.set('n', 'k', "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
--
-- Resize with arrows
vim.keymap.set("n", "<A-Up>", "<cmd>resize -2<CR>")
vim.keymap.set("n", "<A-Down>", "<cmd>resize +2<CR>")
vim.keymap.set("n", "<A-Left>", "<cmd>vertical resize -2<CR>")
vim.keymap.set("n", "<A-Right>", "<cmd>vertical resize +2<CR>")
--
-- Standard Operations
vim.keymap.set('n', '<leader>w', "<cmd>w<cr>", { desc = 'Save' })
vim.keymap.set('n', '<leader>q', "<cmd>confirm q<cr>", { desc = 'Quit' })
vim.keymap.set('n', '<leader>n', "<cmd>enew<cr>", { desc = 'New File' })
vim.keymap.set('n', '<C-q>', "<cmd>qa!<cr>", { desc = 'Force quit' })
vim.keymap.set('n', '|', "<cmd>vsplit<cr>", { desc = 'Vertical Split' })
vim.keymap.set('n', '\\', "<cmd>split<cr>", { desc = 'Horizontal Split' })
--
-- Improved Terminal Navigation
vim.keymap.set('n', '<leader>h', "<cmd>wincmd h<cr>", { desc = 'Terminal left window navigation' })
vim.keymap.set('n', '<leader>j', "<cmd>wincmd j<cr>", { desc = 'Terminal down window navigation' })
vim.keymap.set('n', '<leader>k', "<cmd>wincmd k<cr>", { desc = 'Terminal up window navigation' })
vim.keymap.set('n', '<leader>l', "<cmd>wincmd l<cr>", { desc = 'Terminal right window navigation' })

-- Telescope
-- See `:help telescope.builtin`
vim.keymap.set('n', '<leader>f?', require('telescope.builtin').oldfiles, { desc = '[?] Find recently opened files' })
vim.keymap.set('n', '<leader>fb', require('telescope.builtin').buffers, { desc = '[ ] Find existing buffers' })
vim.keymap.set('n', '<leader>fg', require('telescope.builtin').git_files, { desc = 'Search [G]it [F]iles' })
vim.keymap.set('n', '<leader>ff', require('telescope.builtin').find_files, { desc = '[S]earch [F]iles' })
vim.keymap.set('n', '<leader>fh', require('telescope.builtin').help_tags, { desc = '[S]earch [H]elp' })
vim.keymap.set('n', '<leader>fw', require('telescope.builtin').grep_string, { desc = '[S]earch current [W]ord' })
-- vim.keymap.set('n', '<leader>fg', require('telescope.builtin').live_grep, { desc = '[S]earch by [G]rep' })
vim.keymap.set('n', '<leader>fd', require('telescope.builtin').diagnostics, { desc = '[S]earch [D]iagnostics' })
vim.keymap.set('n', '<leader>fr', require('telescope.builtin').resume, { desc = '[S]earch [R]resume' })
vim.keymap.set('n', '<leader>Gb', require("telescope.builtin").git_branches, { desc = "Git branches" })
vim.keymap.set('n', '<leader>Gc', require("telescope.builtin").git_commits, { desc = "Git commits (repository)" })
vim.keymap.set('n', '<leader>GC', require("telescope.builtin").git_bcommits, { desc = "Git commits (current file)" })
vim.keymap.set('n', '<leader>Gt', require("telescope.builtin").git_status, { desc = "Git status" })
vim.keymap.set('n', '<leader>f/', function()
	-- You can pass additional configuration to telescope to change theme, layout, etc.
	require('telescope.builtin').current_buffer_fuzzy_find(require('telescope.themes').get_dropdown {
		winblend = 10,
		previewer = false,
	})
end, { desc = '[/] Fuzzily search in current buffer' })


-- NeoTree
vim.keymap.set('n', '<leader>e', '<Cmd>Neotree toggle<CR>', { desc = "Toggle Explorer" })

local focusNeoTree = function()
	if vim.bo.filetype == "neo-tree" then
		vim.cmd.wincmd "p"
	else
		vim.cmd.Neotree "focus"
	end
end

vim.keymap.set('n', '<leader>o', focusNeoTree, { desc = "Focus Explorer" })


-- Diagnostic keymaps
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, { desc = 'Go to previous diagnostic message' })
vim.keymap.set('n', ']d', vim.diagnostic.goto_next, { desc = 'Go to next diagnostic message' })
vim.keymap.set('n', '<leader>Le', vim.diagnostic.open_float, { desc = 'Open floating diagnostic message' })
vim.keymap.set('n', '<leader>Lq', vim.diagnostic.setloclist, { desc = 'Open diagnostics list' })


-- Buffer keymaps
vim.keymap.set('n', '<leader>.', '<Cmd>BufferNext<CR>')
vim.keymap.set('n', '<leader>,', '<Cmd>BufferPrevious<CR>')
vim.keymap.set('n', '<leader>c', '<Cmd>BufferClose<CR>')
