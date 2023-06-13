vim.opt.termguicolors = true
vim.opt.laststatus = 2
vim.opt.showmode = false

vim.opt.sw = 2
vim.opt.ts = 2
vim.opt.expandtab = true

vim.opt.nu = true
vim.opt.rnu = true
vim.opt.ai = true
vim.opt.si = true
vim.opt.cursorline = true
vim.opt.mouse = 'a'
vim.opt.wildmode = 'list:longest'
vim.opt.wrap = true
vim.opt.linebreak = true
vim.opt.list = false
vim.opt.foldenable = false

vim.g.vimtex_fold_enabled = 0
vim.g.vimtex_latexmk_build_dir = 'build'
vim.g.vimtex_quickfix_mode = 2

-- <F7> for word case toggle
vim.api.nvim_set_keymap('n', '<F7>', 'mzg~iw`z', { noremap = true, silent = true })

-- make search case sensitive only if search apttern contains an upper case
-- letter
vim.opt.ignorecase = true
vim.opt.smartcase = true

-- allow hidden buffer
vim.opt.hidden = true

vim.opt.shortmess = "atI"

-- reload files changed outside vim
vim.opt.autoread = true

vim.opt.wildignore:append {
  '*/tmp/*',
  '*.so',
  '*.swp',
  '*.zip',
  '*.class',
  '*/target/*',
  '*/out/*',
  '*/node_modules/*',
  '*.aux',
  '*.fls',
  '*.log',
  '*.out',
  '*.toc',
  '*/output/*'
}

vim.opt.hlsearch = false

-- use scala indentation for doc comments
vim.g.scala_scaladoc_indent = 1

vim.api.nvim_create_user_command('Explore', ':e %:p:h', { nargs = 0 })
-- disable netrw
vim.g.loaded_netrwPlugin = 1
vim.g.loaded_netrw = 1
-- replace netrw by vifm
vim.g.vifm_replace_netrw = 1
vim.g.vifm_replace_netrw_cmd = 'Vifm'

local packer = vim.api.nvim_create_augroup('packer_user_config', { clear = true })
vim.api.nvim_create_autocmd( 'BufWritePost', {
  pattern = 'plugins.lua',
  group = packer,
  command = 'source <afile> | PackerCompile',
})

vim.api.nvim_set_hl(0,"@text.strike",{strikethrough=true})
