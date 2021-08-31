-- This file can be loaded by calling `lua require('plugins')` from your init.vim

return require('packer').startup(function()

-- Packer can manage itself
  use 'wbthomason/packer.nvim'

-- snippet
  use { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' }
  use 'hrsh7th/vim-vsnip'
  use 'hrsh7th/vim-vsnip-integ'

-- editorconfig
  use 'editorconfig/editorconfig-vim'

-- completion
  use 'neovim/nvim-lspconfig'
  use 'hrsh7th/nvim-compe'

-- git support
  use 'iberianpig/tig-explorer.vim'
  use 'rbgrouleff/bclose.vim'

-- terraform support
  use 'hashivim/vim-terraform'

-- theme
  use 'marko-cerovac/material.nvim'

-- tmux
use 'numToStr/Navigator.nvim'

-- fuzzy search
use 'nvim-lua/popup.nvim'
use 'nvim-lua/plenary.nvim'
use 'nvim-telescope/telescope.nvim'

-- statusbar
  use 'hoob3rt/lualine.nvim'

-- file explorer
  use 'kyazdani42/nvim-tree.lua'
  use 'kyazdani42/nvim-web-devicons'
  use 'ryanoasis/vim-devicons'

-- tabline
  use {
    'romgrk/barbar.nvim',
    requires = {'kyazdani42/nvim-web-devicons'}
  }

end)
