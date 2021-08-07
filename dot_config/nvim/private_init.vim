"dein Scripts-----------------------------
if &compatible
  set nocompatible               " Be iMproved
endif

" Required:
set runtimepath+=/Users/tuannvm/.cache/dein/repos/github.com/Shougo/dein.vim

" Required:
if dein#load_state('/Users/tuannvm/.cache/dein')
  call dein#begin('/Users/tuannvm/.cache/dein')

  " Let dein manage dein
  " Required:
  call dein#add('/Users/tuannvm/.cache/dein/repos/github.com/Shougo/dein.vim')

  " Add or remove your plugins here:
" snippets
  call dein#add('nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'})
" editorconfig
  call dein#add('editorconfig/editorconfig-vim')
" focus on single window
"  call dein#add('dhruvasagar/vim-zoom')
" auto complete
  call dein#add('neovim/nvim-lspconfig')
  call dein#add('Shougo/deoplete.nvim')
  call dein#add('shougo/deoplete-lsp')
" git support
  call dein#add('iberianpig/tig-explorer.vim')
  call dein#add('rbgrouleff/bclose.vim')
" terraform support
  call dein#add('hashivim/vim-terraform')
" theme
  call dein#add('hzchirs/vim-material')
" tmux
" call dein#add('christoomey/vim-tmux-navigator')
" helm
"  call dein#add('towolf/vim-helm')
" fuzzy search
call dein#add('nvim-lua/popup.nvim')
call dein#add('nvim-lua/plenary.nvim')
call dein#add('nvim-telescope/telescope.nvim')
" difftool
"  call dein#add('whiteinge/diffconflicts')
" statusbar
"  call dein#add('rbong/vim-crystalline')
  call dein#add('vim-airline/vim-airline')
" file explorer
  call dein#add('kyazdani42/nvim-tree.lua')
  call dein#add('kyazdani42/nvim-web-devicons')
if dein#check_install()
  call dein#install()
endif

" You can specify revision/branch/tag.
  call dein#add('Shougo/deol.nvim')

  " Required:
  call dein#end()
  call dein#save_state()
endif

" Required:
filetype plugin indent on
syntax enable

" If you want to install not installed plugins on startup.
"if dein#check_install()
"  call dein#install()
"endif

"End dein Scripts-------------------------

set runtimepath+=~/.vim_runtime

" tmux hack
nnoremap <silent> <BS> :TmuxNavigateLeft<cr>

" languague server

lua << EOF

-- floating window

local on_attach = function(client, bufnr)
  vim.lsp.handlers["textDocument/hover"] =  vim.lsp.with(vim.lsp.handlers.hover)
  vim.lsp.handlers["textDocument/signatureHelp"] =  vim.lsp.with(vim.lsp.handlers.signature_help)
end


-- diagnosis

vim.lsp.handlers['textDocument/publishDiagnostics'] = vim.lsp.with(vim.lsp.diagnostic.on_publish_diagnostics, {
  virtual_text = false,
  signs = true,
  underline = true,
  update_in_insert = false,
})

-- You will likely want to reduce updatetime which affects CursorHold
-- note: this setting is global and should be set only once
vim.o.updatetime = 250
vim.cmd [[autocmd CursorHold,CursorHoldI * lua vim.lsp.diagnostic.show_line_diagnostics({focusable=false})]]

-- lspconfig
require'lspconfig'.gopls.setup{ on_attach = on_attach }
require'lspconfig'.pyright.setup{ on_attach = on_attach }
require'lspconfig'.terraformls.setup{ on_attach = on_attach }

-- highlight
require'nvim-treesitter.configs'.setup {
  ensure_installed = { "go", "gomod", "gdscript", "yaml", "hcl", "python" }, -- List of parsers to ignore installing
  highlight = {
    enable = true,              -- false will disable the whole extension
  },
  indent = {
    enable = true
  }
}
EOF

source ~/.config/nvim/my_configs.vim
" source ~/.config/nvim/basic.vim
