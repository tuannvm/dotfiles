-- This file can be loaded by calling `lua require('useins')` from your init.vim

return require('packer').startup(function()

-- Packer can manage itself
  use 'wbthomason/packer.nvim'

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
use ({ 'projekt0n/github-nvim-theme' })

 -- mcphub.nvim
  use {
    'ravitemer/mcphub.nvim',
    requires = {
      'nvim-lua/plenary.nvim',   -- for async jobs and HTTP
    },
    cmd     = 'MCPHub',                   -- lazy‑load on :MCPHub
    run     = 'npm install -g mcp-hub@latest',  -- install the mcp-hub CLI globally
    -- build = 'bundled_build.lua',      -- alternative to global install; see Advanced section below
    config  = function()
      -- basic setup with defaults
      require('mcphub').setup()
    end,
  }

-- codecompanion
use({
  "olimorris/codecompanion.nvim",
  config = function()
    require("codecompanion").setup()
  end,
  requires = {
    "nvim-lua/plenary.nvim",
    "nvim-treesitter/nvim-treesitter",
  }
})

end)

