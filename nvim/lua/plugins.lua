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
    'hrsh7th/cmp-nvim-lsp',
    'hrsh7th/cmp-buffer',
    'hrsh7th/cmp-path',
    'hrsh7th/cmp-cmdline',
    'hrsh7th/cmp-vsnip',
    'hrsh7th/vim-vsnip',
    'jose-elias-alvarez/null-ls.nvim',
  }
  use({
      "glepnir/lspsaga.nvim",
      branch = "main",
      config = function()
          require('lspsaga').setup({})
      end,
  })

  -- nvim-tree / trouble
  use {
    'kyazdani42/nvim-web-devicons',
    'kyazdani42/nvim-tree.lua',
    'folke/trouble.nvim',
  }

  -- Telescope
  use {
    { 'nvim-telescope/telescope-fzf-native.nvim', run = 'make' },
    'nvim-lua/plenary.nvim',
    'nvim-telescope/telescope.nvim',
  }

  use {
    'nvim-treesitter/nvim-treesitter',
    run = function()
        local ts_update = require('nvim-treesitter.install').update({ with_sync = true })
        ts_update()
    end,
  }

  use  {
    'tpope/vim-endwise',
    'tpope/vim-sleuth',
    'tpope/vim-commentary',
    'tpope/vim-fugitive',
    'tpope/vim-repeat',
    'tpope/vim-surround',
    'nvim-lualine/lualine.nvim',
    'rstacruz/vim-closer',
    'raimondi/delimitmate',
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
    'ledger/vim-ledger',
    'lewis6991/gitsigns.nvim',
    'lukas-reineke/indent-blankline.nvim',
    'hashivim/vim-terraform',
    'tpope/vim-cucumber',
    'iloginow/vim-stylus',
  }

  use {
    'Mofiqul/dracula.nvim',
    'marko-cerovac/material.nvim',
    'rafamadriz/neon',
    "catppuccin/nvim", as = "catppuccin"
  }

  -- clojure
  use {
    'guns/vim-sexp',
    'tpope/vim-sexp-mappings-for-regular-people',
    'Olical/conjure'
  }

  use {
    'github/copilot.vim'
  }

  if packer_bootstrap then
    require('packer').sync()
  end
end)
