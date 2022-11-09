local api = vim.api
local cmd = vim.cmd

local function map(mode, lhs, rhs, opts)
  local options = { noremap = true }
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
map("v", "K", [[<Esc><cmd>lua require("metals").type_of_range()<CR>]])
map("n", "gi", "<cmd>lua vim.lsp.buf.implementation()<CR>")
map("n", "gr", "<cmd>lua vim.lsp.buf.references()<CR>")
map("n", "<space>o", [[<cmd>lua require("telescope.builtin").lsp_document_symbols()<CR>]])
map("n", "<space>s", [[<cmd>lua require("telescope.builtin").lsp_dynamic_workspace_symbols()<CR>]])
map("n", "gs", [[<cmd>lua vim.lsp.codelens.run()<CR>]])
map("n", "<leader>sh", [[<cmd>lua vim.lsp.buf.signature_help()<CR>]])
map("n", "<leader>rn", "<cmd>lua vim.lsp.buf.rename()<CR>")
map("n", "<leader>f", "<cmd>lua vim.lsp.buf.format { async = true }<CR>")
map("n", "<leader>ca", "<cmd>lua vim.lsp.buf.code_action()<CR>")
map("n", "<leader>ws", '<cmd>lua require"metals".hover_worksheet()<CR>')
map("n", "<space>a", [[<cmd>lua require("telescope.builtin").diagnostics({layout_strategy='vertical'})<CR>]]) -- all workspace diagnostics
map("n", "<space>d", "<cmd>lua vim.diagnostic.setloclist()<CR>") -- buffer diagnostics only
map("n", "<space>j", "<cmd>lua vim.diagnostic.goto_prev { wrap = false }<CR>")
map("n", "<space>k", "<cmd>lua vim.diagnostic.goto_next { wrap = false }<CR>")

vim.cmd([[command Reformat :lua vim.lsp.buf.format { async = true }]])
vim.cmd([[command Action :lua vim.lsp.buf.code_action()]])
vim.cmd([[command OR :MetalsOrganizeImports]])

-- completion related settings
-- This is similiar to what I use
local cmp = require("cmp")
cmp.setup({
  sources = {
    { name = "nvim_lsp" },
    { name = "vsnip" },
    { name = "path" },
    { name = "buffer" },
  },
  snippet = {
    expand = function(args)
      -- Comes from vsnip
      vim.fn["vsnip#anonymous"](args.body)
    end,
  },
  mapping = cmp.mapping.preset.insert({
    -- None of this made sense to me when first looking into this since there
    -- is no vim docs, but you can't have select = true here _unless_ you are
    -- also using the snippet stuff. So keep in mind that if you remove
    -- snippets you need to remove this select
    ["<CR>"] = cmp.mapping.confirm({ select = true }),
    ["<C-n>"] = function(fallback)
      if cmp.visible() then
        cmp.select_next_item()
      else
        fallback()
      end
    end,
    ["<C-p>"] = function(fallback)
      if cmp.visible() then
        cmp.select_prev_item()
      else
        fallback()
      end
    end,
  }),

})

----------------------------------
-- LSP Setup ---------------------
----------------------------------
local metals_config = require("metals").bare_config()

metals_config.settings = {
  showImplicitArguments = true,
  showImplicitConversionsAndClasses = true,
  showInferredType = true,
}

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

-- Autocmd that will actually be in charging of starting the whole thing
local nvim_metals_group = api.nvim_create_augroup("nvim-metals", { clear = true })
api.nvim_create_autocmd("FileType", {
  -- NOTE: You may or may not want java included here. You will need it if you
  -- want basic Java support but it may also conflict if you are using
  -- something like nvim-jdtls which also works on a java filetype autocmd.
  pattern = { "scala", "sbt" },
  callback = function()
    require("metals").initialize_or_attach(metals_config)
  end,
  group = nvim_metals_group,
})
