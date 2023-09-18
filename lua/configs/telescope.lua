-- [[ Configure Telescope ]]
-- See `:help telescope` and `:help telescope.setup()`
local project_actions = require("telescope._extensions.project.actions")

require('telescope').setup {
  extensions = {
    project = {
      base_dirs = {
        { '~/Developer' },
      },
      hidden_files = true, -- default: false
      theme = "dropdown",
      order_by = "asc",
      on_project_selected = function(prompt_bufnr)
        project_actions.change_working_directory(prompt_bufnr, false)
        require("harpoon.ui").nav_file(1)
      end
    }
  },
  defaults = {
    mappings = {
      i = {
        ['<C-u>'] = false,
        ['<C-d>'] = false,
      },
    },
  },
}

vim.api.nvim_set_keymap(
  'n',
  '<C-p>',
  ":lua require'telescope'.extensions.project.project{}<CR>",
  { noremap = true, silent = true }
)

require 'telescope'.load_extension('project')

-- Enable telescope fzf native, if installed
pcall(require('telescope').load_extension, 'fzf')

