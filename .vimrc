" Gotta be first
set nocompatible
set hidden
set shell=/bin/bash

filetype off

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'

" ----- Making Vim look good ------------------------------------------
Plugin 'altercation/vim-colors-solarized'
Plugin 'tomasr/molokai'
Plugin 'bling/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'scwood/vim-hybrid'
Plugin 'moll/vim-bbye'
Plugin 'mhinz/vim-janah'
Plugin 'notpratheek/vim-luna'
Plugin 'crusoexia/vim-monokai'
Plugin 'nathanaelkane/vim-indent-guides'
Plugin 'flazz/vim-colorschemes'
Plugin 'morhetz/gruvbox'
Plugin 'rakr/vim-two-firewatch'
Plugin 'pearofducks/ansible-vim'
Plugin 'dracula/vim'
Plugin 'liuchengxu/space-vim-dark'
Plugin 'rakr/vim-one'
Plugin 'zacanger/angr.vim'
Plugin 'jacoborus/tender.vim'
Plugin 'haya14busa/incsearch.vim'
Plugin 'joshdick/onedark.vim'
Plugin 'nanotech/jellybeans.vim'
Plugin 'mhinz/vim-startify'

" ----- Vim as a programmer's text editor -----------------------------
Plugin 'scrooloose/nerdtree'
Plugin 'jistr/vim-nerdtree-tabs'
Plugin 'scrooloose/nerdcommenter'
Plugin 'scrooloose/syntastic'
Plugin 'xolox/vim-misc'
Plugin 'xolox/vim-easytags'
Plugin 'majutsushi/tagbar'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'vim-scripts/a.vim'
Plugin 'rking/ag.vim'

" ----- Working with Git ----------------------------------------------
Plugin 'airblade/vim-gitgutter'
Plugin 'tpope/vim-fugitive'

" ----- Other text editing features -----------------------------------
Plugin 'Raimondi/delimitMate'
"Plugin 'Valloric/YouCompleteMe'

" ----- man pages, tmux -----------------------------------------------
Plugin 'jez/vim-superman'
Plugin 'christoomey/vim-tmux-navigator'

" ----- Syntax plugins ------------------------------------------------
Plugin 'sheerun/vim-polyglot'
"Plugin 'jez/vim-c0'
"Plugin 'jez/vim-ispc'
"Plugin 'kchmck/vim-coffee-script'
"Plugin 'pangloss/vim-javascript'
"Plugin 'othree/yajs.vim'
"Plugin 'othree/javascript-libraries-syntax.vim'
"Plugin 'Glench/Vim-Jinja2-Syntax'
"Plugin 'mustache/vim-mustache-handlebars'

" ---- Extras/Advanced plugins ----------------------------------------
" Highlight and strip trailing whitespace
Plugin 'ntpeters/vim-better-whitespace'
" Easily surround chunks of text
Plugin 'tpope/vim-surround'
" Align CSV files at commas, align Markdown tables, and more
"Plugin 'godlygeek/tabular'
" Automatically insert the closing HTML tag
Plugin 'HTML-AutoCloseTag'
" Make tmux look like vim-airline (read README for extra instructions)
"Plugin 'edkolev/tmuxline.vim'
" All the other syntax plugins I use
"Plugin 'ekalinin/Dockerfile.vim'
"Plugin 'digitaltoad/vim-jade'
"Plugin 'tpope/vim-liquid'
"Plugin 'cakebaker/scss-syntax.vim'

call vundle#end()

filetype plugin indent on

" --- General settings ---
set backspace=indent,eol,start
set ruler
set number
"set relativenumber
set showcmd
set incsearch
set hlsearch
set expandtab
set tabstop=2
set shiftwidth=2
set softtabstop=2
set nowrap
set clipboard=unnamed
set timeoutlen=1000 ttimeoutlen=0
set cursorline
if !has('nvim')
  set ttymouse=sgr
endif
set ttyfast
set lazyredraw
syntax on

set mouse=a

let mapleader = ","
" ----- Plugin-Specific Settings --------------------------------------

let g:hybrid_custom_term_colors = 1

" If you have vim >=8.0 or Neovim >= 0.1.5
" enable true-color support
if (has("termguicolors"))
  set termguicolors
endif

" Gruvbox-settings
let g:gruvbox_italic = 1

" Monokai-settings
let g:monokai_term_italic = 1
let g:monokai_gui_italic = 1

" Jellybeans-settings
let g:jellybeans_use_term_italics = 1

set t_Co=256
set background=dark

" colorscheme gruvbox
"colorscheme tender
"colorscheme space-vim-dark
colorscheme dracula
"colorscheme molokai
"colorscheme one
"colorscheme onedark
"colorscheme jellybeans

" ----- bling/vim-airline settings -----
" Theme
let g:airline_theme = 'dracula'

" Always show statusbar
set laststatus=2

" Fancy arrow symbols, requires a patched font
" To install a patched font, run over to
"     https://github.com/abertsch/Menlo-for-Powerline
" download all the .ttf files, double-click on them and click "Install"
" Finally, uncomment the next line
let g:airline_powerline_fonts = 0

" Show PASTE if in paste mode
let g:airline_detect_paste=1

" Show airline for tabs too
let g:airline#extensions#tabline#enabled = 1

" ----- pearofducks/ansible-vmi ------
let g:ansible_name_highlight = 'd'

" ----- nathanaelkane/vim-indent-guides -----
let g:indent_guides_auto_colors = 0
autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd  guibg=black   ctermbg=3
autocmd VimEnter,Colorscheme * :hi IndentGuidesEven guibg=darkgrey ctermbg=4

" ----- jistr/vim-nerdtree-tabs -----
" Open/close NERDTree Tabs with \t
nmap <silent> <leader>t :NERDTreeTabsToggle<CR>
" Show current file in NERDTree
nmap <silent> <leader>n :NERDTreeFind<CR>

" To have NERDTree always open on startup
let g:nerdtree_tabs_open_on_console_startup = 0
let g:nerdtree_tabs_smart_startup_focus = 2

" Show hidden files in tree
let NERDTreeShowHidden = 1

" ----- Delete current buffer (but keep window layout) ------
nnoremap <leader>q :Bdelete<CR>

" ----- scrooloose/syntastic settings -----
let g:syntastic_error_symbol = '✘'
let g:syntastic_warning_symbol = "▲"
augroup mySyntastic
  au!
  au FileType tex let b:syntastic_mode = "passive"
augroup END


" ----- xolox/vim-easytags settings -----
" Where to look for tags files
set tags=./tags;,~/.vimtags
" Sensible defaults
let g:easytags_events = ['BufReadPost', 'BufWritePost']
let g:easytags_async = 1
let g:easytags_dynamic_files = 2
let g:easytags_resolve_links = 1
let g:easytags_suppress_ctags_warning = 1

" ----- majutsushi/tagbar settings -----
" Open/close tagbar with \b
nmap <silent> <leader>b :TagbarToggle<CR>
" Uncomment to open tagbar automatically whenever possible
"autocmd BufEnter * nested :call tagbar#autoopen(0)

" ----- kien/ctrlp settings -----
" Use ag over grep
set grepprg=ag\ --nogroup\ --nocolor

" Use ag in CtrlP for listing files. Lightning fast and respects .gitignore
let g:ctrlp_user_command = 'ag %s -l --nocolor --ignore vendor -g ""'

" ag is fast enough that CtrlP doesn't need to cache
"let g:ctrlp_use_caching = 0
let g:ctrlp_max_files = 0

" Custom ignore pattern
let g:ctrlp_custom_ignore = '\v[\/](node_modules|target|dist|vendor)|(\.(swp|ico|git|svn))$'

" ----- airblade/vim-gitgutter settings -----
" Required after having changed the colorscheme
hi clear SignColumn
" In vim-airline, only display "hunks" if the diff is non-zero
let g:airline#extensions#hunks#non_zero_only = 1


" ----- Raimondi/delimitMate settings -----
let delimitMate_expand_cr = 1
augroup mydelimitMate
  au!
  au FileType markdown let b:delimitMate_nesting_quotes = ["`"]
  au FileType tex let b:delimitMate_quotes = ""
  au FileType tex let b:delimitMate_matchpairs = "(:),[:],{:},`:'"
  au FileType python let b:delimitMate_nesting_quotes = ['"', "'"]
augroup END

" ----- Swap file location -------
set directory=~/.vim/swapfiles//

" ----- Rapture files -----
au BufRead,BufNewFile *.r set filetype=rapture
au BufRead,BufNewFile *.rh set filetype=rapture
au! Syntax rapture source $HOME/.vim/rapture.vim
au Filetype rapture setlocal tabstop=3
au Filetype rapture setlocal shiftwidth=3
au Filetype rapture setlocal softtabstop=3

" ----- Some of my custom mappings -------
" 1. Toggle between buffers with <tab>
map <Tab> :bnext!<CR>
map <S-Tab> :bprevious!<CR>
" 2. Use <leader>h to remove highlighting
nmap <silent> <leader>hh :noh<CR>
" 3. Reload current file (F5)
map <F5> :edit<CR>
map <S-F5> :edit!<CR>
" 4. Hide current selection
map <F6> :noh<CR>
" 5. Reload syntax
map <F7> :syntax sync fromstart<CR>
" 6. Git blame
map <F8> :Gblame<CR>
" 7. Close the window (or quit if it is the last window)
map <F10> :q<CR>
map <S-F10> :q!<CR>
map <C-x> :q<CR>
map <S-x> :q<CR>
" 8. Close buffer
map <F11> :Bdelete<CR>
map <S-F11> :Bdelete!<CR>
map <C-W> :Bdelete<CR>
map <S-w> :Bdelete<CR>
" 9. Save
map <F12> :w<CR>
map <S-F12> :wq<CR>
" 10. Replace all occurences of word under cursor
nnoremap <Leader>r :%s/\<<C-r><C-w>\>//g<Left><Left>
" 11. Press ENTER to insert a new line (when not in insert mode)
nmap <CR> o
" 12. Move between split windows easily
map <S-L> <C-l>
map <S-H> <C-h>
" 13. Split vertically and horizontally
map <S-N> :rightbelow vnew<CR>
map <S-M> :rightbelow new<CR>
" 14. Bind \ to perform an Ag search
nnoremap \ :Ag!<SPACE>
" 15. Bind K to grep word under cursor
nnoremap K :grep! "\b<C-R><C-W>\b"<CR>:cw<CR>
" 16. Disable arrow keys
nnoremap <Left> <Nop>
nnoremap <Right> <Nop>
nnoremap <Up> <Nop>
nnoremap <Down> <Nop>
vnoremap <Left> <Nop>
vnoremap <Right> <Nop>
vnoremap <Up> <Nop>
vnoremap <Down> <Nop>
inoremap <Left> <Nop>
inoremap <Right> <Nop>
inoremap <Up> <Nop>
inoremap <Down> <Nop>
" 17. NERDTree shortcuts
map <C-T> :NERDTreeToggle<CR>
map <C-G> :NERDTreeFind<CR>
" 18. Paging up and down
map <S-J> <PageDown>
map <S-K> <PageUp>
" 19. Map s -> S (for surround plugin)
vmap s S
" 20. Make "/" use incsearch for multi-highlighting
map /  <Plug>(incsearch-forward)
" 21. Map "w" to wrap/not wrap
map w :set wrap!<CR>
