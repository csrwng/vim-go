set nocompatible              " be iMproved, required
filetype off                  " required

" Vimscript file settings ------------------------ {{{
augroup filetype_vim
  autocmd!
  autocmd FileType vim setlocal foldmethod=marker
augroup END
" }}}


" Vundle setup ----------------------------------- {{{
set runtimepath+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'
Plugin 'Valloric/YouCompleteMe'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'scrooloose/nerdtree'
Plugin 'scrooloose/syntastic'
Plugin 'altercation/vim-colors-solarized'
Plugin 'terryma/vim-expand-region'
Plugin 'airblade/vim-gitgutter'
Plugin 'fatih/vim-go'
Plugin 'godlygeek/csapprox'
Plugin 'fatih/molokai'
Plugin 'tpope/vim-fugitive'
Plugin 'SirVer/ultisnips'

" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal

call vundle#end()            " required
" }}}

" Vim global settings ---------------------------- {{{
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
set numberwidth=5
set nowrap
set shiftround
set showmatch
set matchtime=1
set notimeout ttimeout ttimeoutlen=200
set shiftwidth=2
set softtabstop=2
set expandtab
set viminfo='1000,f1,<500,:500,@500,/500,h,%

"------------------------------------------------------------
" Enable per-directory vimrc
set exrc
set secure

"------------------------------------------------------------
" Set color scheme
let g:rehash256 = 1
silent! colorscheme molokai
" }}}


" Plugin options --------------------------------- {{{

"------------------------------------------------------------
" YouCompleteMe options
" let g:ycm_min_num_of_chars_for_completion = 99
let g:ycm_add_preview_to_completeopt = 0
set completeopt-=preview

"------------------------------------------------------------
" Syntastic options
let g:syntastic_html_tidy_ignore_errors=[" proprietary attribute \"ng-"]
let g:syntastic_always_populate_loc_list = 0
let g:syntastic_auto_loc_list = 0
let g:syntastic_check_on_open = 0
let g:syntastic_check_on_wq = 0
let g:syntastic_json_checkers = ['jsonlint']
let g:syntastic_javascript_checkers = ['jshint']
let g:syntastic_go_checkers = ['go', 'gofmt', 'golint', 'govet', 'gometalinter']

"------------------------------------------------------------
" Vim-go options
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_structs = 1
let g:go_highlight_interfaces = 1
let g:go_highlight_operators = 1
let g:go_highlight_build_constraints = 1
let g:go_fmt_fail_silently = 1

" }}}


" Global key mappings ---------------------------- {{{

" Set leader and local leader
let mapleader="\<Space>"
let maplocalleader=","

" Open a new file
nnoremap <Leader>o :CtrlP<CR>

" Repaint screen with no hilighting
nnoremap <C-L> :nohl<CR><C-L>

" Yank and paste
vnoremap <Leader>y "+y
vnoremap <Leader>d "+d
nnoremap <Leader>p "+p
nnoremap <Leader>P "+P
vnoremap <Leader>p "+p
vnoremap <Leader>P "+P
nnoremap <Leader><Leader> V
vmap v <Plug>(expand_region_expand)
vmap <C-v> <Plug>(expand_region_shrink)

" Go to line
nnoremap <CR> G

" Manage .vimrc
nnoremap <leader>ev :vsplit $MYVIMRC<cr>
nnoremap <leader>sv :source $MYVIMRC<cr>

nnoremap gne :cnext<CR>
nnoremap gpe :cprev<CR>

" Speed
" disable : to force use of ;
nnoremap : <nop>
nnoremap ; :
" disable <esc> to force use of 'jk'
inoremap jk <Esc>

" Location list
nnoremap <Leader>lc :lclose<cr>
nnoremap <Leader>ln :lnext<cr>
nnoremap <Leader>lp :lprevious<cr>

" Use jj in insert mode instead of ctrl+r
inoremap jj <C-r>

" Use M to go to a Mark instead of `
nnoremap M `

" Use leader+w for window operations
nnoremap <Leader>w <C-w>

" Uppercase/Lowercase change

" }}}

" Go-specific key mappings ----------------------- {{{

autocmd FileType go nmap <Localleader>s <Plug>(go-implements)
autocmd FileType go nmap <Localleader>r <Plug>(go-referrers)
autocmd FileType go nmap <Localleader>u <Plug>(go-test)
autocmd FileType go nnoremap <Localleader>df :GoDecls<cr>
autocmd FileType go nnoremap <Localleader>dd :GoDeclsDir<cr>
autocmd FileType go nnoremap <Localleader>c :setlocal foldmethod=indent<cr>zM
autocmd FileType go nnoremap <Localleader>o zR :setlocal foldmethod=manual<cr>
autocmd FileType go nnoremap <Localleader>o zR :setlocal foldmethod=manual<cr>
 
" }}}

" Go-specific abbreviations ---------------------- {{{
autocmd FileType go iabbrev iglog "github.com/golang/glog"
autocmd FileType go iabbrev kapi kapi "k8s.io/kubernetes/pkg/api"
" }}}

" Go-specific settings --------------------------- {{{
autocmd Filetype go setlocal tabstop=4 softtabstop=4 shiftwidth=4 noexpandtab
" autocmd Filetype go setlocal list listchars=tab:>-
" }}}


" Associate *.adoc with asciidoc filetype -------- {{{
autocmd BufRead,BufNewFile *.adoc setfiletype asciidoc
" }}}

