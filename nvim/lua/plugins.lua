local ensure_packer = function()
  local fn = vim.fn
  local install_path = fn.stdpath('data') .. '/site/pack/packer/start/packer.nvim'
  if fn.empty(fn.glob(install_path)) > 0 then
    fn.system({ 'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path })
    vim.cmd [[packadd packer.nvim]]
    return true
  end
  return false
end

local packer_bootstrap = ensure_packer()

return require('packer').startup(function()
  use 'wbthomason/packer.nvim'
  use 'tpope/vim-fugitive'
  use 'vim-airline/vim-airline'
  use {
    'nvim-lualine/lualine.nvim',
    config = [[ require('configs.lualine') ]]
  }
  use {
    'neovim/nvim-lspconfig',
    requires = {
      { 'folke/neodev.nvim' }
    },
    config = [[
      require('configs.neodev')
      require('configs.lsp')
      require('configs.lua')
      require('configs.ts')
      require('configs.toml')
      require('configs.texlab')
      require('configs.nix')
      require('configs.dhall')
      require('configs.bash')
    ]]
  }
  use {
    'simrat39/rust-tools.nvim',
    config = [[ require('configs.rust-tools') ]]
  }
  --use 'derekwyatt/vim-scala'
  use {
    'nvim-treesitter/nvim-treesitter',
    run = function()
      local ts_update = require('nvim-treesitter.install').update({ with_sync = true })
      ts_update()
    end,
    config = [[ require('configs.treesitter') ]]
  }
  use "WhoIsSethDaniel/lualine-lsp-progress.nvim"
  use "lvimuser/lsp-inlayhints.nvim"
  use {
    'Maan2003/lsp_lines.nvim',
    config = [[ require('configs.lsp-lines') ]]
  }
  use 'mg979/vim-visual-multi'
  use 'lervag/vimtex'
  use 'airblade/vim-gitgutter'
  use 'satabin/hocon-vim'
  use 'rust-lang/rust.vim'
  use 'cespare/vim-toml'
  use 'junegunn/limelight.vim'
  use 'jiangmiao/auto-pairs'
  use {
    'nordtheme/vim',
    config = [[ require('configs.nord') ]]
  }
  use 'vifm/neovim-vifm'
  use 'jeffkreeftmeijer/vim-numbertoggle'
  use {
    'kylechui/nvim-surround',
    tag = '*',
    config = [[ require('configs.surround') ]]
  }
  --use 'ryanoasis/vim-devicons'
  use {
    'nvim-tree/nvim-web-devicons',
    config = [[ require('configs.devicons_setup') ]]
  }
  use {
    'hrsh7th/nvim-cmp',
    requires = {
      { "hrsh7th/cmp-nvim-lsp" },
      { "hrsh7th/cmp-vsnip" },
      { "hrsh7th/vim-vsnip" },
      { "hrsh7th/cmp-path" },
      { "hrsh7th/cmp-buffer" },
    },
    config = [[ require('configs.cmp') ]]
  }
  use {
    'scalameta/nvim-metals',
    requires = {
      'nvim-lua/plenary.nvim',
      'mfussenegger/nvim-dap',
      'rcarriga/nvim-dap-ui',
    },
    config = [[
    require('configs.dap')
    require('configs.metals')
    ]]
  }
  use {
    'nvim-telescope/telescope.nvim',
    requires = {
      { 'nvim-lua/plenary.nvim' },
      { 'nvim-telescope/telescope-ui-select.nvim' },
      { 'nvim-telescope/telescope-dap.nvim' },
      {
        'nvim-telescope/telescope-fzf-native.nvim',
        run = 'make'
      },
      use { 'softinio/scaladex.nvim' },
      use { 'folke/todo-comments.nvim' },
    },
    config = [[ require('configs.telescope') ]]
  }
  use {
    'ThePrimeagen/harpoon',
    config = [[ require('configs.harpoon') ]]
  }
  use { 'junegunn/fzf', dir = '~/.fzf', run = './install --all' }
  use { 'nvim-lua/popup.nvim' }

  use {
    'whonore/Coqtail',
    setup = [[ require('configs.coqtail_setup') ]]
  }

  use {
    "iamcco/markdown-preview.nvim",
    run = "cd app && npm install",
    setup = function()
      vim.g.mkdp_filetypes = { "markdown" }
    end,
    ft = { "markdown" },
  }

  use {
    'nvim-neorg/neorg',
    run = ':Neorg sync-parsers',
    requires = { 'nvim-lua/plenary.nvim', 'nvim-neorg/neorg-telescope' },
    config = [[ require('configs.neorg') ]]
  }

  if packer_bootstrap then
    require('packer').sync()
  end
end)
