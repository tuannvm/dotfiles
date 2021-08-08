"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Vim-go
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

let g:go_def_mode='gopls'
let g:go_info_mode='gopls'

let g:LanguageClient_serverCommands = {
      \ 'go': ['go-langserver'],
      \ }

""" go language
let g:go_version_warning = 0

let s:tlist_def_go_settings = 'go;g:enum;s:struct;u:union;t:type;' .
      \ 'v:variable;f:function'

autocmd BufNewFile,BufRead *.go setlocal noexpandtab tabstop=4 shiftwidth=4


let g:tagbar_type_go = {
      \ 'ctagstype' : 'go',
      \ 'kinds'     : [
      \ 'p:package',
      \ 'i:imports:1',
      \ 'c:constants',
      \ 'v:variables',
      \ 't:types',
      \ 'n:interfaces',
      \ 'w:fields',
      \ 'e:embedded',
      \ 'm:methods',
      \ 'r:constructor',
      \ 'f:functions'
      \ ],
      \ 'sro' : '.',
      \ 'kind2scope' : {
      \ 't' : 'ctype',
      \ 'n' : 'ntype'
      \ },
      \ 'scope2kind' : {
      \ 'ctype' : 't',
      \ 'ntype' : 'n'
      \ },
      \ 'ctagsbin'  : 'gotags',
      \ 'ctagsargs' : '-sort -silent'
      \ }

let g:go_highlight_build_constraints = 1
let g:go_highlight_extra_types = 1
let g:go_highlight_fields = 1
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_operators = 1
let g:go_highlight_structs = 1
let g:go_highlight_types = 1
let g:go_auto_type_info = 0
let g:go_info_mode='godoc'
let g:go_auto_sameids = 1

autocmd FileType go nmap <leader>j :lnext<CR>
autocmd FileType go nmap <leader>k :lprevious<CR>
autocmd FileType go nmap <leader>t  <Plug>(go-test)
autocmd FileType go nmap <leader>i  <Plug>(go-doc)
au FileType go nmap <F12> <Plug>(go-def)
au Filetype go nmap <leader>ga <Plug>(go-alternate-edit)
au FileType go nmap <leader>gah <Plug>(go-alternate-split)
au FileType go nmap <leader>gav <Plug>(go-alternate-vertical)
au FileType go nmap <F9> :GoCoverageToggle -short<cr>
au FileType go nmap <leader>d :GoToggleBreakpoint<cr>
au FileType go nmap <leader>D :GoDebug<cr>
au FileType go nmap <leader>G :GoImpl

let g:go_metalinter_enabled = ['vet', 'golint', 'gofmt', 'errcheck']
let g:go_metalinter_autosave = 1
let g:go_addtags_transform = "snakecase"
let g:go_fmt_command = "goimports"

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Status bar
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" function! StatusLine(current, width)
"   return (a:current ? crystalline#mode() . '%#Crystalline#' : '%#CrystallineInactive#')
"         \ . ' %f%h%w%m%r '
"         \ . (a:current ? '%#CrystallineFill# ' : '')
"         \ . '%=' . (a:current ? '%#Crystalline# %{&paste?"PASTE ":""}%{&spell?"SPELL ":""}' . crystalline#mode_color() : '')
"         \ . (a:width > 80 ? ' [%{&enc}][%{&ffs}] %l/%L %P ' : ' ')
" endfunction
" 
" function! TabLine()
"   let l:vimlabel = " TOKI "
"   return crystalline#bufferline(2, len(l:vimlabel), 1) . '%=%#CrystallineTab# ' . l:vimlabel
" endfunction
" 
" let g:crystalline_statusline_fn = 'StatusLine'
" let g:crystalline_tabline_fn = 'TabLine'
" let g:crystalline_theme = 'default'
" 
" set showtabline=1
" set laststatus=2

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Git gutter (Git diff)
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" let g:gitgutter_enabled=1
" nnoremap <silent> <leader>d :GitGutterToggle<cr>
" " Jump between hunks
" nmap <Leader>gn <Plug>GitGutterNextHunk  " git next
" nmap <Leader>gp <Plug>GitGutterPrevHunk  " git previous
" nmap <Leader>ga <Plug>GitGutterStageHunk  " git add (chunk)
" nmap <Leader>gu <Plug>GitGutterUndoHunk   " git undo (chunk)
" nnoremap <leader>gs :Magit<CR>       " git status
" " Push to remote
" nnoremap <leader>gP :! git push<CR>  " git Push
" " Show commits for every source line
" nnoremap <Leader>gb :Gblame<CR>  " git blame
" 
" " augroup lexical
" "   autocmd!
" "   autocmd FileType markdown,mkd call lexical#init()
" "   autocmd FileType textfile,text call lexical#init()
" " augroup END
" 
" let g:indentLine_enabled = 1
" 
" 
" """ grep
" set grepprg=ack
" let g:grep_cmd_opts = '--noheading'
" nnoremap <C-g> :Ag<CR>
" 
" """ Custom function
" 
" " trim whitespace
" fun! TrimWhitespace()
"   let l:save = winsaveview()
"   %s/\s\+$//e
"   call winrestview(l:save)
" endfun
" 
" command! TrimWhitespace call TrimWhitespace()


""" hide status bar
" let s:hidden_all = 0
" function! ToggleHiddenAll()
"   if s:hidden_all  == 0
"     let s:hidden_all = 1
"     set noshowmode
"     set noruler
"     set laststatus=0
"     set noshowcmd
"   else
"     let s:hidden_all = 0
"     set showmode
"     set ruler
"     set laststatus=2
"     set showcmd
"   endif
" endfunction
" 
" nnoremap <S-h> :call ToggleHiddenAll()<CR>


""" Tab keymap

" switch tabs with Alt left and right
nnoremap <A-right> :tabnext<CR>
nnoremap <A-left> :tabprevious<CR>
" and whilst in insert mode
inoremap <A-right> <Esc>:tabnext<CR>
inoremap <A-left> <Esc>:tabprevious<CR>


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => ALE (syntax checker)
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:ale_linters = {
      \   'golang': ['gopls'],
      \   'markdown': ['markdownlint', '-c', '~/.config/markdownlint/config'],
      \   'yaml': ['yamllint'],
      \   'terraform': ['tflint']
      \}
let g:ale_echo_cursor = 1
let g:ale_fix_on_save = 1
" use nice symbols for errors and warnings
set signcolumn=no
" highlight clear ALEErrorSign
" highlight clear ALEWarningSign
" let g:ale_sign_error = '💣'
" let g:ale_sign_warning = '⚠'

" fixer configurations
let g:ale_fixers = {
\   '*': ['remove_trailing_lines', 'trim_whitespace'],
\}

nmap <silent> <leader>a <Plug>(ale_next_wrap)



""" Table
function! s:isAtStartOfLine(mapping)
  let text_before_cursor = getline('.')[0 : col('.')-1]
  let mapping_pattern = '\V' . escape(a:mapping, '\')
  let comment_pattern = '\V' . escape(substitute(&l:commentstring, '%s.*$', '', ''), '\')
  return (text_before_cursor =~? '^' . ('\v(' . comment_pattern . '\v)?') . '\s*\v' . mapping_pattern . '\v$')
endfunction

inoreabbrev <expr> <bar><bar>
      \ <SID>isAtStartOfLine('\|\|') ?
      \ '<c-o>:TableModeEnable<cr><bar><space><bar><left><left>' : '<bar><bar>'
inoreabbrev <expr> __
      \ <SID>isAtStartOfLine('__') ?
      \ '<c-o>:silent! TableModeDisable<cr>' : '__'

let g:table_mode_corner='|'


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

