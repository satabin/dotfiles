local opts = { noremap = true, silent = true }
local api = vim.api
local cmd = vim.cmd
local metals = require("metals")
local metals_config = metals.bare_config()
local handlers = require("configs.lsp.handlers")

vim.keymap.set("v", "K", [[<Esc><cmd>lua require"metals".type_of_range()<CR>]], opts)
vim.keymap.set("n", "<leader>ws", '<cmd>lua require"metals".hover_worksheet()<CR>', opts)
cmd([[command OR :MetalsOrganizeImports]])

metals_config.capabilities = handlers.capabilities

metals_config.on_attach = function(client, bufnr)
  handlers.on_attach(client, bufnr)
  metals.setup_dap()
end

metals_config.settings = {
  showImplicitArguments = true,
  showImplicitConversionsAndClasses = true,
  showInferredType = true,
  testUserInterface = "Test Explorer",
}

local nvim_metals_group = api.nvim_create_augroup("nvim-metals", { clear = true })
api.nvim_create_autocmd("FileType", {
  pattern = { "scala", "sbt" },
  callback = function()
    require("metals").initialize_or_attach(metals_config)
  end,
  group = nvim_metals_group,
})
