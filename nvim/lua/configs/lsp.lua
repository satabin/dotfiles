local api = vim.api
local cmd = vim.cmd

local function map(mode, lhs, rhs, opts)
  local options = { noremap = true, silent = true }
  if opts then
    options = vim.tbl_extend("force", options, opts)
  end
  api.nvim_set_keymap(mode, lhs, rhs, options)
end

-- global
vim.opt_global.completeopt = { "menu", "noinsert", "noselect" }

-- LSP mappings
map("n", "gd", "<cmd>lua vim.lsp.buf.definition()<CR>")
map("n", "K", "<cmd>lua vim.lsp.buf.hover()<CR>")
map("n", "gi", "<cmd>lua vim.lsp.buf.implementation()<CR>")
map("n", "gr", "<cmd>lua vim.lsp.buf.references()<CR>")
map("n", "<space>o", [[<cmd>lua require("telescope.builtin").lsp_document_symbols()<CR>]])
map("n", "<space>s", [[<cmd>lua require("telescope.builtin").lsp_dynamic_workspace_symbols()<CR>]])
map("n", "gs", [[<cmd>lua vim.lsp.codelens.run()<CR>]])
map("n", "<leader>sh", [[<cmd>lua vim.lsp.buf.signature_help()<CR>]])
map("n", "<leader>rn", "<cmd>lua vim.lsp.buf.rename()<CR>")
map("n", "<leader>f", "<cmd>lua vim.lsp.buf.format { async = true }<CR>")
map("n", "<leader>ca", "<cmd>lua vim.lsp.buf.code_action()<CR>")
map("n", "<space>a", [[<cmd>lua require("telescope.builtin").diagnostics({layout_strategy='vertical', initial_mode='normal'})<CR>]]) -- all workspace diagnostics
map("n", "<space>d", [[<cmd>lua require("telescope.builtin").diagnostics({layout_strategy='vertical', bufnr=0, initial_mode='normal'})<CR>]]) -- buffer diagnostics
map("n", "<space>j", "<cmd>lua vim.diagnostic.goto_prev { wrap = true }<CR>")
map("n", "<space>k", "<cmd>lua vim.diagnostic.goto_next { wrap = true }<CR>")

vim.cmd([[command Reformat :lua vim.lsp.buf.format { async = true }]])
vim.cmd([[command Action :lua vim.lsp.buf.code_action()]])

api.nvim_create_autocmd("CursorHold", {
  callback = vim.lsp.buf.document_highlight,
  buffer = bufnr,
  group = lsp_group,
})

api.nvim_create_autocmd("CursorMoved", {
  callback = vim.lsp.buf.clear_references,
  buffer = bufnr,
  group = lsp_group,
})

api.nvim_create_autocmd({ "BufEnter", "CursorHold", "InsertLeave" }, {
  callback = vim.lsp.codelens.refresh,
  buffer = bufnr,
  group = lsp_group,
})

