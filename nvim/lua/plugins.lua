vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function()
  use 'wbthomason/packer.nvim'
  use 'lewis6991/impatient.nvim'
  use 'tpope/vim-fugitive'
  use 'vim-airline/vim-airline'
  use {
    'nvim-lualine/lualine.nvim',
    config = [[ require('configs.lualine') ]]
  }
  use 'derekwyatt/vim-scala'
  use 'terryma/vim-multiple-cursors'
  use 'lervag/vimtex'
  use 'airblade/vim-gitgutter'
  use 'satabin/hocon-vim'
  use 'rust-lang/rust.vim'
  use 'cespare/vim-toml'
  use 'junegunn/limelight.vim'
  use 'jiangmiao/auto-pairs'
  use {
    'shaunsingh/nord.nvim',
    config = [[ require('configs.nord') ]]
  }
  use 'vifm/neovim-vifm'
  use 'jeffkreeftmeijer/vim-numbertoggle'
  use 'tpope/vim-surround'
  use 'Shougo/echodoc.vim'
  use 'ryanoasis/vim-devicons'
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
    }
  }
  use {
    'scalameta/nvim-metals',
    requires = {
      'nvim-lua/plenary.nvim'
    },
    config = [[ require('configs.metals') ]]
  }
  use {
    'nvim-telescope/telescope.nvim',
    requires = {
      { 'nvim-lua/plenary.nvim' },
      { 'nvim-telescope/telescope-ui-select.nvim' }
    },
    config = [[ require('configs.telescope') ]]
  }
  use { 'softinio/scaladex.nvim' }
end)
