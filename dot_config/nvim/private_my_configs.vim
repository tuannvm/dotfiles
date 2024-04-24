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

""" copy remotely
let g:oscyank_term = 'default'

""" universal statusline
set laststatus=3
highlight VertSplit cterm=NONE gui=NONE

""" Shift line up/down/left/right https://www.reddit.com/r/vim/comments/pqiynv/moving_text_one_of_my_favorite_mappings/
nnoremap <C-H> <<
nnoremap <C-J> <CMD>m .+1<CR>
nnoremap <C-K> <CMD>m .-2<CR>
nnoremap <C-L> >>  

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

" Using Lua functions
nnoremap <leader>r <cmd>lua require('telescope.builtin').find_files()<cr>
nnoremap <leader>g <cmd>lua require('telescope.builtin').live_grep()<cr>

" set screen center
nnoremap j jzz
nnoremap k kzz
" set scrolloff=50

" Auto close brackets
""inoremap ( ()<left>
""inoremap " ""<left>
""inoremap ' ''<left>
""inoremap [ []<left>
""inoremap { {}<left>
""inoremap {<CR> {<CR>}<ESC>O
""inoremap {;<CR> {<CR>};<ESC>O

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



""" use terminal
set splitbelow
"let g:disable_key_mappings = 1
if has('nvim')
  tnoremap <Esc> <C-\><C-n>
  tnoremap <C-v><Esc> <Esc>
endif

""" highlight line number
set nu
set nocursorline
hi cursorline cterm=none

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

" Disable AutoComplPop.
let g:acp_enableAtStartup = 0



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

""" file explorer

autocmd BufEnter * ++nested if winnr('$') == 1 && bufname() == 'NvimTree_' . tabpagenr() | quit | endif
nnoremap <C-n> :NvimTreeToggle<CR>

""" fuzzy

nnoremap <C-f> :FZF<CR>
