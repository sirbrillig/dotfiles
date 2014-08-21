" vimrc
" ----------------------------------------------------------------------------
" Summary: Payton's vimrc file
" URL: https://github.com/sirbrillig/dotfiles
" Version: 2.5.0
" ----------------------------------------------------------------------------

" ----------------------------------------------------------------------------
" Set up Vundle
" ----------------------------------------------------------------------------
set nocompatible
filetype off
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" ----------------------------------------------------------------------------
" Plugins
" ----------------------------------------------------------------------------
Plugin 'gmarik/vundle'
Plugin 'vim-scripts/L9'
Plugin 'kien/ctrlp.vim'
Plugin 'bronson/vim-trailing-whitespace'
Plugin 'sirbrillig/findbyname.vim'
Plugin 'vim-scripts/grep.vim'
Plugin 'Shutnik/jshint2.vim'
Plugin 'vim-scripts/mru.vim'
Plugin 'scrooloose/nerdtree'
Plugin 'jistr/vim-nerdtree-tabs'
Plugin 'sirbrillig/netgrep'
Plugin 'vim-scripts/AutoComplPop'
Plugin 'kchmck/vim-coffee-script'
Plugin 'elzr/vim-json'
Plugin 'bling/vim-bufferline'
Plugin 'mustache/vim-mustache-handlebars'
Plugin 'Raimondi/delimitMate'
Plugin 'scrooloose/syntastic'
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-sleuth'
Plugin 'bling/vim-airline'
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-endwise'
Plugin 'airblade/vim-gitgutter'
Plugin 'jelera/vim-javascript-syntax'
Plugin 'pangloss/vim-javascript'
Plugin 'goatslacker/mango.vim'
Plugin 'Lokaltog/vim-distinguished'
Plugin 'tpope/vim-vividchalk'
Plugin 'danro/rename.vim'
Plugin 'mxw/vim-jsx'
Plugin 'idanarye/vim-merginal'
Plugin 'mhinz/vim-startify'

" ----------------------------------------------------------------------------
" Options
" ----------------------------------------------------------------------------
syntax on
set hlsearch
set autoindent "use previous line's indent level
set background=dark "assume dark background.
set hidden "allow edited buffers to be hidden
set switchbuf=useopen "use existing buffer rather than opening a new one
set showtabline=1 "show the tab bar only if more than 1 tab
set tabstop=2 "use 2-spaces for tabs.
set shiftwidth=2 "use 2-spaces for indenting.
set smarttab "pressing tab fixes indent.
set expandtab "use spaces, not tabs.
set showmatch "highlight matching braces, etc.
set ruler "show cursor position
set incsearch "do incremental searches
set ignorecase "case-insensitive searching
set smartcase "do case-sensitive if upper-case characters.
set gdefault "assume the /g flag on :s.
set formatoptions=crql "auto-format comments in code.
set textwidth=80 "for wrapping
set tabpagemax=20 " allow a lot of tabs to be open
set backspace=indent,eol,start "allow erasing previously entered characters in insert mode.
set wildmenu " show list instead of just completing
set scrolloff=3 " minimum lines to keep above and below cursor
set laststatus=2 " always show the status line
set cmdheight=2 " slightly more room for notices
let g:netrw_silent=1 " be quiet when using netrw
filetype on
filetype plugin on
filetype indent on
set cursorline " highlight the current cursor line number
set number " show line numbers
set path+=** " Allow recursive find
set completeopt=menuone,longest " Configure tab autocomplete

set backupdir=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp
set undodir=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp
set directory=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp

" Open a new file (c-y) in the current window
let g:ctrlp_open_new_file = 'r'

" When pressing <CR> within a curly brace, add two lines and move up one.
let delimitMate_expand_cr = 1
" When pressing <SPACE> within a paren, add two spaces and move back one.
let delimitMate_expand_space = 1

let Grep_Default_Options = '-Irn -i --exclude="*\.po*" --exclude="*\.svn*" --exclude-dir="vip" --exclude="*\.min\.*" --exclude-dir="compiled" --exclude-dir="node_modules" --exclude-dir="glotpress.dir" --exclude="*\.unison\.tmp" --exclude="*compiledTemplates.js" --exclude="*merged.js" --exclude="*mergedAssets.js" --exclude="*api/data*" --exclude-dir="vendor" --exclude-dir="tmp"'

let g:NERDTreeDirArrows=0

" ----------------------------------------------------------------------------
" vim-airline
" ----------------------------------------------------------------------------
let g:bufferline_echo = 0
set t_Co=256
let g:airline#extensions#tabline#enabled = 1
let g:airline_enable_syntastic  = 1
function! TabSection(...)
  call a:1.add_section('airline_a', ' '.g:airline_section_a.' ')
  call a:1.add_section('airline_c', " tabs are %{&expandtab?'spaces':'tabs'} ")
  call a:1.add_section('airline_b', ' '.g:airline_section_b.' ')
  call a:1.add_section('airline_c', ' '.g:airline_section_c.' ')
  call a:1.split()
  call a:1.add_section('airline_x', ' '.g:airline_section_x.' ')
  call a:1.add_section('airline_y', ' '.g:airline_section_y.' ')
  call a:1.add_section('airline_z', ' '.g:airline_section_z.' ')
  call a:1.add_section('airline_warning', g:airline_section_warning) "TODO: this should be add_raw
  return 1
endfunction
function! AirlineInit()
  call airline#add_statusline_func('TabSection')
endfunction
autocmd VimEnter * call AirlineInit()

" ----------------------------------------------------------------------------
" Keybindings
" ----------------------------------------------------------------------------
" map CTRL-A and CTRL-E to home and end, respectively.
map  <C-A> <Home>
map  <C-E> <End>
map! <C-A> <Home>
map! <C-E> <End>

" reset the mapleader to ;
let mapleader = ";"

" map leader-q to clear the search highlight.
nnoremap <silent> <leader>q :nohlsearch<CR>

" map leader-S to start a global-replace.
nnoremap <Leader>S :%s///c<Left><Left><Left>
vnoremap <Leader>S :%s///c<Left><Left><Left>

" map leader-s to start a single-line-replace.
noremap <Leader>s :s///c<Left><Left><Left>
vnoremap <Leader>s :s///c<Left><Left><Left>

" map leader-o to insert a new line after the current.
nnoremap <Leader>o o^

" map leader-r to reload the vimrc.
nnoremap <Leader>r :source $MYVIMRC<CR>:echom "vimrc reloaded"<CR>

" map backslash to save.
nnoremap \ :w<CR>

" map leader-w to wordwrap without newlines.
nnoremap <Leader>w gq
vnoremap <Leader>w gq

" map CTRL-o to new buffer.
" also map Leader-[ and Leader-] to navigation.
nnoremap <C-T> :e<space>
nnoremap <Leader>[ :bp<CR>
nnoremap <Leader>] :bn<CR>

" map leader-p to toggle paste mode.
nnoremap <silent> <Leader>p :call Paste_on_off()<bar>:set paste?<CR>
set pastetoggle=
let paste_mode = 0 " 0 = normal, 1 = paste
function! Paste_on_off()
  if g:paste_mode == 0
    set paste
    let g:paste_mode = 1
  else
    set nopaste
    let g:paste_mode = 0
  endif
endfunc

" Map Leader-/ to toggle comments
nnoremap <silent> <Leader>/ :call ToggleComment()<CR>
vnoremap <silent> <Leader>/ :call ToggleComment()<CR>
augroup comment_leaders
  autocmd FileType haskell,vhdl,ada let b:comment_leader = '-- '
  autocmd FileType vim let b:comment_leader = '" '
  autocmd FileType c,cpp,java,php let b:comment_leader = '// '
  autocmd FileType sh,make,ruby,perl,yaml,python let b:comment_leader = '# '
  autocmd FileType let b:comment_leader = '% '
augroup END
function! ToggleComment()
  let b:commented = match( getline('.'), '\v^\s*' . b:comment_leader )
  if b:commented >=# 0
    execute "normal! ^" . repeat('x', strlen(b:comment_leader))
  else
    execute "normal! I" . b:comment_leader
  endif
endfunction

" map Leader-n to toggle NERDTree
nnoremap <Leader>n :NERDTreeTabsToggle<CR>

" Map leader-; to add a semicolon to the end of the line
nnoremap <Leader>; mqA;<esc>`q

" Map leader-, to add a comma to the end of the line
nnoremap <Leader>, mqA,<esc>`q

" Map leader-l to last buffer
nnoremap <Leader>l :b#<CR>

" Map leader-P to CtrlP without activation so a directory can be added
nnoremap <Leader>P :CtrlP<space>
" Map leader-m to the CtrlPMRU search
nnoremap <Leader>m :CtrlPMRU<CR>
" Map leader-b to the CtrlPBuffer search
nnoremap <Leader>b :CtrlPBuffer<CR>
" Map leader-x to close the current buffer
nnoremap <Leader>x :bw<CR>

" Map leader-i to re-indent the selected lines
vnoremap <Leader>i :call Reindent()<CR>
function! Reindent()
  execute "normal! <100"
  execute "normal! =="
endfunction


" ----------------------------------------------------------------------------
" Colors
" ----------------------------------------------------------------------------

" Set the theme
colorscheme vividchalk

" Modify the colors in the vim 7 tabs.
" hi TabLine term=reverse ctermfg=Gray ctermbg=NONE
" hi TabLineSel term=reverse cterm=underline ctermfg=0 ctermbg=2
" hi TabLineFill term=underline cterm=underline ctermfg=8 ctermbg=0

" Modify some highlight colors to be less offensive to the eye.
" hi IncSearch term=reverse,underline cterm=reverse,bold,underline ctermbg=NONE ctermfg=NONE
" hi Search term=NONE cterm=reverse,bold ctermbg=NONE ctermfg=NONE
" hi MatchParen term=NONE cterm=bold ctermbg=NONE ctermfg=DarkCyan
" hi PmenuSel term=NONE cterm=NONE ctermfg=White ctermbg=Blue
" hi Pmenu term=NONE cterm=NONE ctermfg=Black ctermbg=White

" Modify the cursorline colors to show just the line number highlighted
hi LineNr ctermfg=DarkGray
hi CursorLineNr ctermbg=3
hi CursorLine cterm=none ctermbg=none

" Modify the SignColumn to make it easier to read.
hi SignColumn ctermbg=NONE guibg=NONE
hi GitGutterAdd ctermfg=2 guifg=#009900 ctermbg=NONE guibg=NONE
hi GitGutterDelete ctermfg=1 ctermbg=NONE guifg=#ff2222 guibg=NONE
hi GitGutterChangeDefault ctermfg=3 ctermbg=NONE guifg=#bbbb00 guibg=NONE

" ----------------------------------------------------------------------------
" FileTypes
" ----------------------------------------------------------------------------
" Treat Gemfile and Vagrantfile as Ruby
" (http://ilkka.github.io/blog/2011/02/03/teach_vim_about_gemfiles/)
augroup filetype_gemfile
  autocmd!
  autocmd BufNewFile,BufRead Gemfile setlocal filetype=ruby
  autocmd BufNewFile,BufRead Vagrantfile setlocal filetype=ruby
augroup END

" Use jsxhint for React's JSX files.
let g:syntastic_javascript_checkers = ['jsxhint']


