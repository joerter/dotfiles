local ensure_packer = function()
  local fn = vim.fn
  local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
  if fn.empty(fn.glob(install_path)) > 0 then
    fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
    vim.cmd [[packadd packer.nvim]]
    return true
  end
  return false
end

local packer_bootstrap = ensure_packer()

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
    'nvim-lualine/lualine.nvim',
    'tpope/vim-endwise',
    'rstacruz/vim-closer',
    'tpope/vim-sleuth',
    'tpope/vim-commentary',
    'raimondi/delimitmate',
    'tpope/vim-fugitive',
    'akinsho/bufferline.nvim',
    'mattn/emmet-vim',
    'yuezk/vim-js',
    'maxmellon/vim-jsx-pretty',
    'HerringtonDarkholme/yats.vim',
    'elzr/vim-json',
    'jxnblk/vim-mdx-js',
    'norcalli/nvim-colorizer.lua',
    'pantharshit00/vim-prisma',
    'p00f/nvim-ts-rainbow',
    'tpope/vim-repeat',
    'tpope/vim-surround',
    'ledger/vim-ledger',
    'lewis6991/gitsigns.nvim',
    'lukas-reineke/indent-blankline.nvim',
    'hashivim/vim-terraform',
  }

  use {
    'Mofiqul/dracula.nvim',
    'marko-cerovac/material.nvim',
    'rafamadriz/neon',
  }

  if packer_bootstrap then
    require('packer').sync()
  end
end)
