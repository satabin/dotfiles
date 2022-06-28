vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function()
  use 'wbthomason/packer.nvim'
  use 'tpope/vim-fugitive'
  use 'vim-airline/vim-airline'
  use 'vim-airline/vim-airline-themes'
  use 'derekwyatt/vim-scala'
  use 'terryma/vim-multiple-cursors'
  use 'lervag/vimtex'
  use 'kien/ctrlp.vim'
  use 'airblade/vim-gitgutter'
  use 'satabin/hocon-vim'
  use 'rust-lang/rust.vim'
  use 'cespare/vim-toml'
  use 'junegunn/limelight.vim'
  use 'jiangmiao/auto-pairs'
  use { 'arcticicestudio/nord-vim', branch = 'main' }
  use 'vifm/neovim-vifm'
  use 'jeffkreeftmeijer/vim-numbertoggle'
  use 'tpope/vim-surround'
  use 'Shougo/echodoc.vim'
  use 'ryanoasis/vim-devicons'
  use {'junegunn/fzf', dir = '~/.fzf', run = './install --all' }
	use 'junegunn/fzf.vim'
  use {
    'hrsh7th/nvim-cmp',
    requires = {
      { "hrsh7th/cmp-nvim-lsp" },
      { "hrsh7th/cmp-vsnip" },
      { "hrsh7th/vim-vsnip" },
    }
  }
  use { 'scalameta/nvim-metals', requires = { 'nvim-lua/plenary.nvim' } }
  use {
    'nvim-telescope/telescope.nvim',
    requires = {
      {'nvim-lua/plenary.nvim'},
			{ "nvim-telescope/telescope-fzy-native.nvim" },
    }
  }
end)
