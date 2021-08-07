try
  source ~/.custom.vim
catch
endtry

""" basic

" Auto change dir (help with buffer name)
" https://vi.stackexchange.com/questions/3314/short-buffer-name
" set autochdir
"
""" leader key
let mapleader="\<Space>"

" Performance
"" Disabling Neovim providers: 
let g:loaded_node_provider=0
let g:loaded_ruby_provider=0
let g:loaded_perl_provider=0

"" Vim performance settings:
set hidden
set ttyfast
set lazyredraw
set updatetime=500

" fzf & find

" Using Lua functions
nnoremap <leader>r <cmd>lua require('telescope.builtin').find_files()<cr>
nnoremap <leader>g <cmd>lua require('telescope.builtin').live_grep()<cr>


""" 
" Git support
"
"""

" set screen center
nnoremap j jzz
nnoremap k kzz
set scrolloff=50

" Auto close brackets
inoremap ( ()<left>
inoremap [ []<left>
inoremap { {}<left>
inoremap {<CR> {<CR>}<ESC>O
inoremap {;<CR> {<CR>};<ESC>O

" resize
let g:lens#height_resize_min = 40
let g:lens#width_resize_min = 120
let g:lens#height_resize_max = 40
let g:lens#width_resize_max = 120

" mattn/gist-vim
let g:gist_detect_filetype = 1
let g:gist_show_privates = 1
let g:gist_get_multiplefile = 1

" commentary
autocmd FileType helm setlocal commentstring=#\ %s

" search fuzzy
set path+=**
set wildmenu

" use relative number
" set relativenumber

" no legacy support
set nocompatible

" repeat substitution
nnoremap & :&&<CR>
xnoremap & :&&<CR>


" disable command line mode
map q: :q

" map record from q to Q
nnoremap Q q
nnoremap q <Nop>

" get current path
cnoremap <expr> %% getcmdtype() == ':' ? expand('%:h').'/' : '%%'

" Ignore compiled files
set wildignore=*.o,*~,*.pyc
if has("win16") || has("win32")
  set wildignore+=.git\*,.hg\*,.svn\*
else
  set wildignore+=*/.git/*,*/.hg/*,*/.svn/*,*/.DS_Store
endif


" Ignore case when searching
set ignorecase

" spell check
" set spell spelllang=en_us

" Show matching brackets when text indicator is over them
set showmatch

" Turn backup off, since most stuff is in SVN, git et.c anyway...
set nobackup
set nowb
set noswapfile

set wrap "Wrap lines

syntax enable

""" tpl
autocmd FileType tpl setlocal noeol binary


""" json
let g:vim_json_syntax_conceal = 0

""" File Manager
nnoremap <silent> <leader>e :NvimTreeToggle<CR>

let g:nvim_tree_ignore = [ '.git', 'node_modules', '.cache', '.idea', '.DS_Store' ] "empty by default
let g:nvim_tree_auto_close = 1 "0 by default, closes the tree when it's the last window
let g:nvim_tree_follow = 1 "0 by default, this option allows the cursor to be updated when entering a buffer
let g:nvim_tree_indent_markers = 1 "0 by default, this option shows indent markers when folders are open
let g:nvim_tree_highlight_opened_files = 1 "0 by default, will enable folder and file icon highlight for opened files/directories.
let g:nvim_tree_root_folder_modifier = ':~' "This is the default. See :help filename-modifiers for more options
let g:nvim_tree_tab_open = 1 "0 by default, will open the tree when entering a new tab and the tree was previously open
let g:nvim_tree_disable_netrw = 1 "1 by default, disables netrw
let g:nvim_tree_add_trailing = 1 "0 by default, append a trailing slash to folder names
let g:nvim_tree_group_empty = 1 " 0 by default, compact folders that only contain a single folder into one node in the file tree
let g:nvim_tree_lsp_diagnostics = 1 "0 by default, will show lsp diagnostics in the signcolumn. See :help nvim_tree_lsp_diagnostics
let g:nvim_tree_disable_window_picker = 1 "0 by default, will disable the window picker.
let g:nvim_tree_hijack_cursor = 1 "1 by default, when moving cursor in the tree, will position the cursor at the start of the file on the current line
let g:nvim_tree_icon_padding = ' ' "one space by default, used for rendering the space between the icon and the filename. Use with caution, it could break rendering if you set an empty string depending on your font.
let g:nvim_tree_symlink_arrow = ' >> ' " defaults to ' ➛ '. used as a separator between symlinks' source and target.
let g:nvim_tree_update_cwd = 1 "0 by default, will update the tree cwd when changing nvim's directory (DirChanged event). Behaves strangely with autochdir set.
let g:nvim_tree_window_picker_exclude = {
    \   'filetype': [
    \     'packer',
    \     'qf'
    \   ],
    \   'buftype': [
    \     'terminal'
    \   ]
    \ }

let g:nvim_tree_show_icons = {
    \ 'git': 1,
    \ 'folders': 0,
    \ 'files': 0,
    \ }

let g:nvim_tree_icons = {
    \ 'git': {
    \   'unstaged': "✗",
    \   'staged': "S",
    \   'unmerged': "Un",
    \   'renamed': "R",
    \   'untracked': "U",
    \   'deleted': "D",
    \   'modified': "M",
    \   'ignored': "I"
    \   },
    \ }


""" use terminal
set splitbelow
"let g:disable_key_mappings = 1
if has('nvim')
  tnoremap <Esc> <C-\><C-n>
  tnoremap <C-v><Esc> <Esc>
endif

""" highlight line number
set nu
set cursorline
hi cursorline cterm=none
hi cursorlinenr ctermfg=green

""" zoom pane
nnoremap <C-w>z :tabedit %<CR>

""" fuzzy search
nnoremap <C-w>h :History:<CR>

""" Ctrl a,e
nnoremap <C-e> <Esc>i<C-o>$
nnoremap <C-a> <Esc>i<C-o>0

inoremap <C-e> <C-o>$
inoremap <C-a> <C-o>0

set undodir=~/.vimundodir
set undofile
set softtabstop=2 expandtab shiftwidth=2 smarttab
set autoread
autocmd FileType yaml setlocal ts=2 sts=2 sw=2 expandtab
filetype plugin on
set mouse=a
set showcmd
set splitright
set conceallevel=0
set concealcursor=niv

" set list
" set listchars=tab:!·,trail:·,
"let g:indentLine_char = ''
"let g:indentLine_first_char = ''
"let g:indentLine_showFirstIndentLevel = 1
"let g:indentLine_setColors = 1

""" netrw
" let g:netrw_liststyle = 3
" let g:netrw_banner = 1
" let g:netrw_winsize = 15
"
" let g:netrw_browse_split = 0
" let g:netrw_altv = 1
" let g:loaded_netrw       = 1
" let g:loaded_netrwPlugin = 1

" Disable AutoComplPop.
let g:acp_enableAtStartup = 0


" Use deoplete.
let g:deoplete#enable_at_startup = 1
autocmd InsertLeave * silent! pclose!
let g:deoplete#sources#jedi#python_path = '/opt/homebrew/bin/python3'
let g:deoplete#sources#jedi#show_docstring = 1

" let g:deoplete#disable_auto_complete = 1
" autocmd InsertLeave,CompleteDone * if pumvisible() == 0 | pclose | endif

" deoplete tab-complete
inoremap <expr><tab> pumvisible() ? "\<c-n>" : "\<tab>"

" deoplete.nvim recommend
set completeopt+=noselect
let g:deoplete#sources#go#gocode_binary = '/Users/tuannvm/golang/bin/gocode'
let g:deoplete#sources#go#sort_class = ['package', 'func', 'type', 'var', 'const']

"""

""" python

" Path to python interpreter for neovim
let g:python3_host_prog  = '/opt/homebrew/bin/python3'
let g:python_host_prog  = '/usr/bin/python'
" Skip the check of neovim module
let g:python3_host_skip_check = 0

" tag
nmap <F8> :TagbarToggle <CR>

"" let @p='i ^[p']'
autocmd BufRead,BufNewFile */templates/*.yaml,*/templates/*.tpl set ft=helm

" let g:UltiSnipsExpandTrigger="<tab>"
" let g:neosnippet#disable_runtime_snippets = 1
" imap <expr><TAB>
"  \ pumvisible() ? "\<C-n>" :
"  \ neosnippet#expandable_or_jumpable() ?
"  \
"\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"

" terraform
let g:terraform_fmt_on_save=1

let g:ack_default_options =
      \ " --smart-case"

nnoremap H gT
nnoremap L gt


""" Gist
let g:gist_detect_filetype = 1
let g:gist_show_privates = 1
let g:gist_get_multiplefile = 1
let g:gist_post_private = 1


""" nested vim
if has('nvim') && executable('nvr')
  let $VISUAL="nvr -cc split --remote-wait +'set bufhidden=wipe'"
endif
