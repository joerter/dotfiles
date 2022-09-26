return require('packer').startup(function(use)
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'

  -- LSP
  use {
    'neovim/nvim-lspconfig',          
    'hrsh7th/nvim-cmp',
    'glepnir/lspsaga.nvim',
    'hrsh7th/cmp-nvim-lsp',
    'hrsh7th/cmp-buffer',
    'hrsh7th/cmp-path',
    'hrsh7th/cmp-cmdline',
    'hrsh7th/cmp-vsnip',
    'hrsh7th/vim-vsnip',
    'jose-elias-alvarez/null-ls.nvim',
  }

  -- nvim-tree / trouble
  use {
    'kyazdani42/nvim-web-devicons',
    'kyazdani42/nvim-tree.lua',
    'folke/trouble.nvim',
  }

  -- Telescope
  use {
    { 'nvim-telescope/telescope-fzf-native.nvim', run = 'make' },
    { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' },
    'nvim-lua/plenary.nvim',
    'nvim-telescope/telescope.nvim',
  }


  use  {
    'tpope/vim-endwise',
    '9mm/vim-closer',
    'lewis6991/gitsigns.nvim',
    'tpope/vim-sleuth',
    'tpope/vim-commentary',
    'raimondi/delimitmate',
    'tpope/vim-fugitive',
    'hoob3rt/lualine.nvim',
    'akinsho/bufferline.nvim',
    {'dracula/vim', as = 'dracula'},
    'mattn/emmet-vim',
    'yuezk/vim-js',
    'maxmellon/vim-jsx-pretty',
    'HerringtonDarkholme/yats.vim',
    'elzr/vim-json',
    'jxnblk/vim-mdx-js',
    'norcalli/nvim-colorizer.lua',
    'pantharshit00/vim-prisma',
    'luochen1990/rainbow',
    'tpope/vim-repeat',
    'tpope/vim-surround',
    'ledger/vim-ledger',
  }
end)
