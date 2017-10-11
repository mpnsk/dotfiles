set nu			"display line numbers"
set hlsearch
set ignorecase
set smartcase
set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'

" The following are examples of different formats supported.
" Keep Plugin commands between vundle#begin/end.
" plugin on GitHub repo
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-repeat'
Plugin 'vimwiki/vimwiki'	
	set nocompatible
	syntax on

Plugin 'tmhedberg/matchit'	"allows front-end jumping in html/latex tags (as opposed to only in brackets)
Plugin 'Raimondi/delimitMate'	" autoclose brackets

Plugin 'altercation/vim-colors-solarized'
	set background=dark 
 	let g:solarized_termcolors=256

Plugin 'mattn/emmet-vim' "over-the-top html tag generator


Plugin 'bkad/CamelCaseMotion'

"Plugin 'gerw/vim-latex-suite'


" plugin from http://vim-scripts.org/vim/scripts.html
"Plugin 'L9'
" Git plugin not hosted on GitHub
"Plugin 'git://git.wincent.com/command-t.git'
" git repos on your local machine (i.e. when working on your own plugin)
"Plugin 'file:///home/gmarik/path/to/plugin'
" The sparkup vim script is in a subdirectory of this repo called vim.
" Pass the path to set the runtimepath properly.
"Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
" Avoid a name conflict with L9
"Plugin 'user/L9', {'name': 'newL9'}

" All of your Plugins must be added before the following line
call vundle#end()            " required
	colorscheme solarized
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line

nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l
set omnifunc=syntaxcomplete#Complete

au BufNewFile,BufRead *.tw set filetype=twee
au BufNewFile,BufRead *.twee set filetype=twee
command! -nargs=1 Silent
			\ | execute ':silent !'.<q-args>
			\ | execute ':redraw!'

autocmd FileType twee map <F3> :w<cr>:!twee "%:p:h" -t sugarcube > index.htm<cr>:Silent firefox "%:p:h/index.htm"<cr>:Silent rm "%:p:h/index.htm"<cr>
autocmd FileType twee map <F4> :w<cr>:!twee "%:p:h" -t sugarcube > index.htm<cr>:Silent firefox "%:p:h/index.htm"<cr>:Silent rm "%:p:h/index.htm"
"autocmd FileType twee map <F3> :w<cr>:!twee "%:p" -t sugarcube > "%:r.htm"<cr>:Silent chromium-browser "%:r.htm"<cr>:Silent rm "%:r.htm"
"autocmd FileType twee map <F4> :w<cr>:!twee "%:p" -t sugarcube > "%:r.htm"<cr>:Silent chromium-browser "%:r.htm"<cr>
set guioptions-=m  "remove menu bar
set guioptions-=T  "remove toolbar
set guioptions-=r  "remove right-hand scroll bar
set guioptions-=L  "remove left-hand scroll bar
vmap <leader>cs <esc>:'<,'>:w !suml -o out -p && xdg-open out

set undofile
set undodir=/tmp

" for jflex syntax:
augroup filetype 
 au BufRead,BufNewFile *.flex,*.jflex  set filetype=jflex 
augroup END 
au Syntax jflex so ~/.vim/syntax/jflex.vim 
