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
    path_display = { "truncate" },
  },
  extensions = {
    fzf = {
      fuzzy = true,
      override_generic_sorter = true,
      override_file_sorter = true,
      case_mode = 'smart_case',
    },
    ['ui-select'] = {
      require('telescope.themes').get_dropdown { layout_config = { prompt_position = 'top' } },
    },
  },
}

-- Extensions
telescope.load_extension 'ui-select'
