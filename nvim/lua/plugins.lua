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
    'mhartington/formatter.nvim',
    'mfussenegger/nvim-lint',
    'kyazdani42/nvim-web-devicons',
    'folke/trouble.nvim',
    { 'nvim-telescope/telescope-fzf-native.nvim', run = 'make' },
    'nvim-lua/plenary.nvim',
    'nvim-telescope/telescope.nvim',
    'tpope/vim-endwise',
    'tpope/vim-sleuth',
    'tpope/vim-commentary',
    'tpope/vim-fugitive',
    'tpope/vim-repeat',
    'tpope/vim-surround',
    'nvim-lualine/lualine.nvim',
    'rstacruz/vim-closer',
    'raimondi/delimitmate',
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
    'hashivim/vim-terraform',
    'tpope/vim-cucumber',
    'iloginow/vim-stylus',
    "catppuccin/nvim", as = "catppuccin",
    'dense-analysis/ale',
  }

    --'lukas-reineke/indent-blankline.nvim',
  use({
      "nvimdev/lspsaga.nvim",
      branch = "main",
  })

  use {
    'j-hui/fidget.nvim',
    tag = 'legacy',
    config = function()
      require("fidget").setup {
        -- options
      }
    end,
  }

  use {
  "nvim-neo-tree/neo-tree.nvim",
    branch = "v2.x",
    requires = {
      "nvim-lua/plenary.nvim",
      "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
      "MunifTanjim/nui.nvim",
    }
  }

  use {
    'nvim-treesitter/nvim-treesitter',
    run = function()
        local ts_update = require('nvim-treesitter.install').update({ with_sync = true })
        ts_update()
    end,
  }

  use {
    "zbirenbaum/copilot.lua",
    cmd = "Copilot",
    event = "InsertEnter",
    config = function()
      require("copilot").setup({
        suggestion = { enabled = false },
        panel = { enabled = false },
      })
    end,
  }
  use {
    "zbirenbaum/copilot-cmp",
    after = { "copilot.lua" },
    config = function ()
      require("copilot_cmp").setup({
        suggestion = { enabled = false },
        panel = { enabled = false },
      })
    end
  }

  -- clojure
  use {
    'Olical/conjure',
    'guns/vim-sexp',
    'tpope/vim-sexp-mappings-for-regular-people'
  }

  -- go
  -- use {
  --   'ray-x/go.nvim',
  --   'ray-x/guihua.lua',
  -- }

  if packer_bootstrap then
    require('packer').sync()
  end
end)
