require("harpoon").setup({
  global_settings = {
    -- sets the marks upon calling `toggle` on the ui, instead of require `:w`
    save_on_toggle = false,

    -- saves the harpoon file upon every change. disabling is unrecommended
    save_on_change = true,

    -- sets harpoon to run the command immediately as it's passed to the terminal when calling `sendCommand`
    enter_on_sendcmd = false,

    -- closes any tmux windows that harpoon creates when you close Neovim
    tmux_autoclose_windows = false,

    -- filetypes that you want to prevent from adding to the harpoon list menu
    excluded_filetypes = { "harpoon" },

    -- set marks specific to each git branch inside git repository
    mark_branch = false,
  }
})

vim.keymap.set("n", "<leader>he", function() require("harpoon.ui").toggle_quick_menu() end, opts)
vim.keymap.set("n", "<leader>ha", function() require("harpoon.mark").add_file() end, opts)
vim.keymap.set("n", "<leader>hr", function() require("harpoon.mark").rm_file() end, opts)
vim.keymap.set("n", "<leader>hn", function() require("harpoon.ui").nav_next() end, opts)
vim.keymap.set("n", "<leader>hp", function() require("harpoon.ui").nav_prev() end, opts)
