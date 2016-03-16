let mapleader = "\<Space>"
execute pathogen#infect()
set nocompatible
filetype indent plugin on
syntax on
set wildmenu
set showcmd
set hlsearch
set backspace=indent,eol,start
set autoindent
set nostartofline
set ruler
set laststatus=2
set confirm
set hidden
set visualbell
set t_vb=
set mouse=a
set cmdheight=2
set number
set notimeout ttimeout ttimeoutlen=200
set shiftwidth=2
set softtabstop=2
set expandtab
map Y y$
nnoremap <C-L> :nohl<CR><C-L>
autocmd Filetype go setlocal sts=8 sw=8 noexpandtab
set background=dark
colorscheme solarized

"------------------------------------------------------------
" Airline configuration
"if !exists('g:airline_symbols')
"  let g:airline_symbols = {}
"endif
"
"let g:airline_left_sep = '⮀'
"let g:airline_left_alt_sep = '⮁'
"let g:airline_right_sep = '⮂'
"let g:airline_right_alt_sep = '⮃'
"let g:airline_symbols.branch = '⭠'
"let g:airline_symbols.readonly = '⭤'
"let g:airline_symbols.linenr = '⭡'

"------------------------------------------------------------
" Enable per-directory vimrc
set exrc
set secure

"------------------------------------------------------------
" YouCompleteMe options
let g:ycm_add_preview_to_completeopt = 0
set completeopt-=preview

"------------------------------------------------------------
" Syntastic configuration
let g:syntastic_html_tidy_ignore_errors=[" proprietary attribute \"ng-"]
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 0
let g:syntastic_auto_loc_list = 0
let g:syntastic_check_on_open = 0
let g:syntastic_check_on_wq = 0

let g:syntastic_json_checkers = ['jsonlint']
let g:syntastic_javascript_checkers = ['jshint']
let g:syntastic_go_checkers = ['go', 'gofmt', 'golint', 'govet', 'gometalinter']
"let g:syntastic_mode_map = { 'mode': 'active', 'passive_filetypes': ['go'] }

au FileType go nmap <Leader>s <Plug>(go-implements)
au FileType go nmap <Leader>r <Plug>(go-referrers)
au FileType go nmap <Leader>u <Plug>(go-test)

"------------------------------------------------------------
" Quickfix list toggle
function! GetBufferList()
  redir =>buflist
  silent! ls
  redir END
  return buflist
endfunction

function! ToggleList(bufname, pfx)
  let buflist = GetBufferList()
  for bufnum in map(filter(split(buflist, '\n'), 'v:val =~ "'.a:bufname.'"'), 'str2nr(matchstr(v:val, "\\d\\+"))')
    if bufwinnr(bufnum) != -1
      exec(a:pfx.'close')
      return
    endif
  endfor
  if a:pfx == 'l' && len(getloclist(0)) == 0
      echohl ErrorMsg
      echo "Location List is Empty."
      return
  endif
  let winnr = winnr()
  exec(a:pfx.'open')
  if winnr() != winnr
    wincmd p
  endif
endfunction

nmap <silent> <leader>q :call ToggleList("Quickfix List", 'c')<CR>
nmap <silent> <leader>e :Errors<CR>
nmap <silent> <leader>x :lclose<CR>
nnoremap gne :cnext<CR>
nnoremap gpe :cprev<CR>

"------------------------------------------------------------
" NERDTree configuration
nmap ,n :NERDTreeFind<CR>
nmap ,m :NERDTreeToggle<CR>

"------------------------------------------------------------
" Go highlighting
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_structs = 1
let g:go_highlight_interfaces = 1
let g:go_highlight_operators = 1
let g:go_highlight_build_constraints = 1

let g:go_fmt_fail_silently = 1

"------------------------------------------------------------
" associate *.adoc with asciidoc filetype
au BufRead,BufNewFile *.adoc setfiletype asciidoc

"------------------------------------------------------------
" key mappings

nnoremap <Leader>o :CtrlP<CR>
vmap <Leader>y "+y
vmap <Leader>d "+d
nmap <Leader>p "+p
nmap <Leader>P "+P
vmap <Leader>p "+p
vmap <Leader>P "+P
nmap <Leader><Leader> V
vmap v <Plug>(expand_region_expand)
vmap <C-v> <Plug>(expand_region_shrink)

vnoremap <silent> y y`]
vnoremap <silent> p p`]
nnoremap <silent> p p`]
nnoremap <CR> G
nnoremap <BS> gg

map ; :
imap jj <Esc>
