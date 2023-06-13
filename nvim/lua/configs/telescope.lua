local telescope = require 'telescope'
local map = vim.keymap.set
local silent = { silent = true, noremap = true }
local builtin = require('telescope.builtin')

map('n', '<leader>ff', builtin.find_files, silent)
map('n', '<C-p>', builtin.find_files, silent)
map('n', '<leader>fg', builtin.live_grep, silent)
vim.cmd([[command Rg :lua require('telescope.builtin').live_grep()<CR>]])
map('n', '<leader>fb', builtin.current_buffer_fuzzy_find, silent)
map('n', '<leader>si', require('telescope').extensions.scaladex.scaladex.search, silent)

telescope.setup {
  defaults = {
    path_display = { "smart" },
  },
  extensions = {
    ['ui-select'] = {
      require('telescope.themes').get_dropdown {
        initial_mode = 'normal',
        layout_strategy = 'cursor',
        layout_config = { prompt_position = 'top' }
      },
    },
    harpoon = {
      initial_mode = 'normal',
    },
  },
}

-- Extensions
telescope.load_extension 'ui-select'
telescope.load_extension 'fzf'
telescope.load_extension 'harpoon'
telescope.load_extension 'dap'

require'todo-comments'.setup()
