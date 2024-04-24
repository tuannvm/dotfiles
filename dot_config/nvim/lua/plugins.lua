-- This file can be loaded by calling `lua require('useins')` from your init.vim

return require('packer').startup(function()

-- Packer can manage itself
  use 'wbthomason/packer.nvim'

-- Tree
  use { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' }

-- snippet & completion
  use 'neovim/nvim-lspconfig'
  use {'ms-jpq/coq_nvim', branch = 'coq'}

-- editorconfig
  use 'editorconfig/editorconfig-vim'

-- completion

-- git support
  use 'iberianpig/tig-explorer.vim'
  use 'rbgrouleff/bclose.vim'
  use 'tpope/vim-fugitive'
  use 'tpope/vim-rhubarb'

-- terraform support
  use 'hashivim/vim-terraform'

-- tmux
use 'numToStr/Navigator.nvim'

-- fuzzy search (fzf)
  use {'junegunn/fzf', dir = '~/.fzf', run = './install --all' }

-- file explorer
  use {
      'kyazdani42/nvim-tree.lua',
      requires = {
        'kyazdani42/nvim-web-devicons', -- optional, for file icon
      },
      config = function() require'nvim-tree'.setup {} end
  }

-- tabline
use {
  'akinsho/bufferline.nvim',
  requires = {'kyazdani42/nvim-web-devicons'}
}

-- copy remotely
use { 
  'ojroques/vim-oscyank',
  branch = 'main'
  }

-- colorscheme
use 'shaunsingh/solarized.nvim'

-- Github Copilot
use 'github/copilot.vim'
end)
