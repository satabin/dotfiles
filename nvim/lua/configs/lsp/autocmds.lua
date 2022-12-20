local api = vim.api

local function map(mode, lhs, rhs, opts)
  local options = { noremap = true, silent = true }
  if opts then
    options = vim.tbl_extend("force", options, opts)
  end
  api.nvim_set_keymap(mode, lhs, rhs, options)
end

local function set_lsp_keymaps(bufnr)
  -- LSP mappings
  map("n", "gd", [[<cmd>lua require("telescope.builtin").lsp_definitions({initial_mode='normal'})<CR>]])
  map("n", "gy", [[<cmd>lua require("telescope.builtin").lsp_type_definitions({initial_mode='normal'})<CR>]])
  map("n", "vgd", [[<cmd>lua require("telescope.builtin").lsp_definitions({initial_mode='normal', jump_type='vsplit'})<CR>]])
  map("n", "sgd", [[<cmd>lua require("telescope.builtin").lsp_definitions({initial_mode='normal', jump_type='split'})<CR>]])
  map("n", "K", "<cmd>lua vim.lsp.buf.hover()<CR>")
  map("n", "gi", [[<cmd>lua require("telescope.builtin").lsp_implementations({initial_mode='normal'})<CR>]])
  map("n", "gr", "<cmd>lua require('telescope.builtin').lsp_references({initial_mode='normal'})<CR>")
  map("n", "<space>o", [[<cmd>lua require("telescope.builtin").lsp_document_symbols()<CR>]])
  map("n", "<space>s", [[<cmd>lua require("telescope.builtin").lsp_dynamic_workspace_symbols()<CR>]])
  map("n", "gs", [[<cmd>lua vim.lsp.codelens.run()<CR>]])
  map("n", "<leader>sh", [[<cmd>lua vim.lsp.buf.signature_help()<CR>]])
  map("n", "<leader>rn", "<cmd>lua vim.lsp.buf.rename()<CR>")
  map("n", "<leader>f", "<cmd>lua vim.lsp.buf.format { async = true }<CR>")
  map("n", "<leader>ca", "<cmd>lua vim.lsp.buf.code_action()<CR>")
  map("n", "<space>a",
    [[<cmd>lua require("telescope.builtin").diagnostics({layout_strategy='vertical', initial_mode='normal'})<CR>]]) -- all workspace diagnostics
  map("n", "<space>d",
    [[<cmd>lua require("telescope.builtin").diagnostics({layout_strategy='vertical', bufnr=0, initial_mode='normal'})<CR>]]) -- buffer diagnostics
  map("n", "<space>j", "<cmd>lua vim.diagnostic.goto_prev { wrap = true }<CR>")
  map("n", "<space>k", "<cmd>lua vim.diagnostic.goto_next { wrap = true }<CR>")
  map("n", "<leader>e", "<cmd> lua vim.diagnostic.open_float(nil, { focusable = false })<CR>")

  vim.cmd([[command! Reformat :lua vim.lsp.buf.format { async = true }]])
  vim.cmd([[command! Action :lua vim.lsp.buf.code_action()]])

end

vim.api.nvim_create_autocmd("LspAttach", {
  callback = function(args)
    set_lsp_keymaps(args.buf)
  end
})
