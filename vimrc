" vimrc
" ----------------------------------------------------------------------------
" Summary: Payton's vimrc file
" URL: https://github.com/sirbrillig/dotfiles
" Version: 2.6.0
" ----------------------------------------------------------------------------

" ----------------------------------------------------------------------------
" Set up vim-plug
" ----------------------------------------------------------------------------
call plug#begin('~/.vim/bundle')

" ----------------------------------------------------------------------------
" Plugins
" ----------------------------------------------------------------------------
Plug 'vim-scripts/L9'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'bronson/vim-trailing-whitespace'
Plug 'EinfachToll/DidYouMean'
Plug 'sirbrillig/findbyname.vim'
Plug 'vim-scripts/mru.vim'
Plug 'scrooloose/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'vim-scripts/AutoComplPop'
Plug 'bling/vim-bufferline'
Plug 'tpope/vim-fugitive'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-endwise'
Plug 'airblade/vim-gitgutter'
Plug 'danro/rename.vim'
Plug 'idanarye/vim-merginal'
Plug 'moll/vim-bbye'
Plug 'kshenoy/vim-signature'
Plug 'shime/vim-livedown' " Requires `npm install -g livedown`
Plug 'csscomb/vim-csscomb'
Plug 'tpope/vim-sleuth'
Plug 'w0rp/ale'
Plug 'prettier/vim-prettier', {
  \ 'do': 'yarn install',
  \ 'for': ['javascript', 'typescript', 'css', 'less', 'scss', 'json', 'graphql'] }
Plug 'ternjs/tern_for_vim', {
  \ 'do': 'npm install',
  \ 'for': ['javascript', 'typescript'] }
Plug 'junegunn/vader.vim'
"Plug 'SirVer/ultisnips' " Doesn't work :-(
"Plug 'Raimondi/delimitMate'
Plug 'jiangmiao/auto-pairs'
Plug 'MarcWeber/vim-addon-mw-utils'
Plug 'tomtom/tlib_vim'
Plug 'garbas/vim-snipmate'

" Syntax plugins
Plug 'mxw/vim-jsx'
Plug 'elzr/vim-json'
Plug 'mustache/vim-mustache-handlebars'
Plug 'jelera/vim-javascript-syntax'
Plug 'pangloss/vim-javascript'
Plug 'moll/vim-node'
Plug 'cakebaker/scss-syntax.vim'
Plug 'hail2u/vim-css3-syntax'
Plug 'Keithbsmiley/swift.vim'
Plug 'fatih/vim-go'

" Search plugins
Plug 'vim-scripts/grep.vim'
Plug 'rking/ag.vim' " Requires the_silver_searcher
Plug 'nazo/pt.vim' " Requires the_platinum_searcher
Plug 'jremmen/vim-ripgrep' " Requires ripgrep

" MacOS plugins
if has('mac')
  Plug 'rizzatti/dash.vim'
endif

" Color scheme plugins
Plug 'goatslacker/mango.vim'
Plug 'Lokaltog/vim-distinguished'
Plug 'tpope/vim-vividchalk'
Plug 'fcevado/molokai_dark'

call plug#end()

" Allow matching ruby do/end blocks
runtime macros/matchit.vim

" ----------------------------------------------------------------------------
" Options
" ----------------------------------------------------------------------------
syntax on
set hlsearch "highlight search matches
set autoindent "use previous line's indent level
set background=dark "assume dark background.
set hidden "allow edited buffers to be hidden
set switchbuf=useopen "use existing buffer rather than opening a new one
set showtabline=1 "show the tab bar only if more than 1 tab
set smarttab "pressing tab fixes indent.
set noet "use tabs to indent
set copyindent
set softtabstop=0
set shiftwidth=2
set tabstop=2
set showmatch "highlight matching braces, etc.
set ruler "show cursor position
set incsearch "do incremental searches
set ignorecase "case-insensitive searching
set smartcase "do case-sensitive if upper-case characters.
set gdefault "assume the /g flag on :s.
set formatoptions=crql "auto-format comments in code.
set textwidth=0 "for wrapping
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
set iskeyword+=\- " Adds dash character to keyword characters

set backupdir=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp
set undodir=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp
set directory=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp

" Allow copy/paste between MacOS and tmux
set clipboard=unnamed

" Open a new file (c-y) in the current window
let g:ctrlp_open_new_file = 'r'

" Show only MRU files in the current working directory
let g:ctrlp_mruf_relative = 1
let g:ctrlp_mruf_exclude_nomod = 1

" Use pt (the platinum searcher) for super-fast ctrlp indexing
" if executable('pt')
  " let g:ctrlp_user_command = 'pt %s -i --nocolor --nogroup -g=""'
" endif
" Use rg (ripgrep) for ctrlp indexing
if executable('rg')
  let g:ctrlp_user_command = 'rg %s --files --color=never --glob ""'
  let g:ctrlp_use_caching = 0
endif

" When pressing <CR> within a curly brace, add two lines and move up one.
let delimitMate_expand_cr = 1
" When pressing <SPACE> within a paren, add two spaces and move back one.
let delimitMate_expand_space = 1
" Disable delimitMate for certain filetypes
"au FileType markdown,html let b:loaded_delimitMate = 0

" Hide the NERDTree arrows because some systems don't have support for those characters
" let g:NERDTreeDirArrows=0

" Display indentation guides
set list listchars=tab:\|\ ,trail:·,extends:»,precedes:«,nbsp:×

" Highlight searches made by Ag
let g:ag_highlight=1

" Disable JSON quote concealing
let g:vim_json_syntax_conceal = 0

" ----------------------------------------------------------------------------
" vim-airline
" ----------------------------------------------------------------------------
let g:bufferline_fname_mod = ':p:.'
let g:bufferline_echo = 0
set t_Co=256
let g:airline_theme='wombat'
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#syntastic#enabled = 1
let g:airline#extensions#whitespace#enabled = 0
let g:airline#extensions#ale#enabled = 1
let g:airline_powerline_fonts = 1

" ----------------------------------------------------------------------------
" Keybindings
" ----------------------------------------------------------------------------
" quit with capital Q also
command! -bar -bang Q quit<bang>
command! -bar -bang Qa quit<bang>
command! Ccl ccl

" map CTRL-A and CTRL-E to home and end, respectively.
map  <C-A> <Home>
map  <C-E> <End>
map! <C-A> <Home>
map! <C-E> <End>

" reset the mapleader to ;
let mapleader = ";"

" Use leader-; as "repeat last f or t movement"
nnoremap <Leader>; ;

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
nnoremap <Leader>r :source $MYVIMRC<CR>:AirlineToggle<CR>:AirlineToggle<CR>:AirlineRefresh<CR>:echom "vimrc reloaded"<CR>

" map backslash to save.
nnoremap \ :w<CR>

" map leader-w to wordwrap without newlines.
nnoremap <Leader>w gq
vnoremap <Leader>w gq

" map CTRL-t/Leader-t to new buffer.
" also map Leader-[ and Leader-] to navigation.
nnoremap <C-T> :e<space>
nnoremap <Leader>t :e<space>
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

" Function to replace a `require` line with an `import` line
function! ES6Import()
  execute "normal! 0dwiimport \<esc>f=df(ifrom\<esc>$T'Da;"
endfunction

" Function to replace a `function` line with a `() =>` line
function! ES6Function()
  execute "normal! 0/function\<cr>dwf)a =>\<esc>"
endfunction

" map Leader-n to toggle NERDTree
nnoremap <Leader>n :NERDTreeToggle<CR>

" Map leader-: to add a semicolon to the end of the line
nnoremap <Leader>: mqA;<esc>`q

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
nnoremap <Leader>x :Bdelete<CR>

" Map leader-i to re-indent the selected lines
vnoremap <Leader>i :call Reindent()<CR>
function! Reindent()
  execute "normal! 10<"
  execute "normal! =="
endfunction

" Map leader-g to grep for the word under the cursor
nnoremap <Leader>g :Ag! <cword><CR>

" Map leader-G to begin a search
"nnoremap <Leader>G :Ag!<space>
nnoremap <Leader>G :Rg --smart-case -e ""<Left>

" Map leader-c, leader-C to copy/paste selected text in MacOS
vnoremap <Leader>c :w !pbcopy<CR><CR>:echom "copied to MacOS clipboard"<CR>
nnoremap <Leader>C :set paste<CR>:r !pbpaste<CR>:set nopaste<CR>:echom "pasted from MacOS clipboard"<CR>

" Map ctrl-j and ctrl-k to jump to nearest parenthesis, bracket, or brace
nnoremap <C-j> /[(\)[\]{\}]<CR>:nohlsearch<CR>
nnoremap <C-k> ?[(\)[\]{\}]<CR>:nohlsearch<CR>

" ----------------------------------------------------------------------------
" Colors
" ----------------------------------------------------------------------------

" Set the theme
colorscheme elflord

" Modify the colors in the vim 7 tabs.
" hi TabLine term=reverse ctermfg=Gray ctermbg=NONE
" hi TabLineSel term=reverse cterm=underline ctermfg=0 ctermbg=2
" hi TabLineFill term=underline cterm=underline ctermfg=8 ctermbg=0

" Modify some highlight colors to be less offensive to the eye.
hi IncSearch term=reverse,underline cterm=reverse,bold,underline ctermbg=NONE ctermfg=NONE
hi Search term=NONE cterm=reverse,bold ctermbg=NONE ctermfg=NONE
hi MatchParen term=NONE cterm=bold ctermbg=NONE ctermfg=DarkCyan
hi PmenuSel term=NONE cterm=NONE ctermfg=White ctermbg=Blue
hi Pmenu term=NONE cterm=NONE ctermfg=Black ctermbg=White

" Modify the cursorline colors to show just the line number highlighted
hi LineNr ctermfg=DarkGray
hi CursorLineNr ctermbg=3
hi CursorLine cterm=none ctermbg=none

" Modify the SignColumn to make it easier to read.
hi SignColumn ctermbg=NONE guibg=NONE
hi GitGutterAdd ctermfg=2 guifg=#009900 ctermbg=NONE guibg=NONE
hi GitGutterDelete ctermfg=1 ctermbg=NONE guifg=#ff2222 guibg=NONE
hi GitGutterChangeDefault ctermfg=3 ctermbg=NONE guifg=#bbbb00 guibg=NONE

" Modify the invisible characters colors (tabs)
hi SpecialKey ctermfg=DarkGray

" Highlight ES6 template strings
hi link javaScriptTemplateDelim String
hi link javaScriptTemplateVar Text
hi link javaScriptTemplateString String

" Simplify colors during vimdiff
highlight DiffAdd    cterm=bold ctermfg=10 ctermbg=17 gui=none guifg=bg guibg=Red
highlight DiffDelete cterm=bold ctermfg=10 ctermbg=17 gui=none guifg=bg guibg=Red
highlight DiffChange cterm=bold ctermfg=10 ctermbg=17 gui=none guifg=bg guibg=Red
highlight DiffText   cterm=bold ctermfg=10 ctermbg=88 gui=none guifg=bg guibg=Red

" Make it easier to see ALE errors
hi link ALEError Error

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

" ----------------------------------------------------------------------------
" Syntastic
" ----------------------------------------------------------------------------
" Override phpmd options
let g:syntastic_php_phpmd_post_args = 'design,unusedcode'

" Use eslint for JSX and JS
let g:syntastic_javascript_checkers = ['eslint', 'mixedindentlint']
let g:syntastic_scss_checkers = ['mixedindentlint', 'sass']
let g:syntastic_php_checkers = [ 'php', 'phpcs' ]

" Only use python3 for python linting
let g:syntastic_python_checkers= ['python3', 'flake8', 'pylint', 'mypy']
"let g:syntastic_python_checkers= ['python3', 'flake8']

" ----------------------------------------------------------------------------
" Grep
" ----------------------------------------------------------------------------

" Use Rg to grep
" if executable("rg")
  " set grepprg=rg\ --vimgrep\ --no-heading
  " set grepformat=%f:%l:%c:%m,%f:%l:%m
" endif
" command! -nargs=+ -complete=file Rg execute 'silent grep! <args>' | copen

" ----------------------------------------------------------------------------
" ALE
" ----------------------------------------------------------------------------
let g:ale_lint_delay = 2000
"let g:ale_lint_on_text_changed = 'normal'
let g:ale_php_phpcs_use_global = 1
let g:ale_echo_msg_format = '[%linter%] %s'
let g:ale_linters = {
\   'javascript': ['standard','eslint'],
\   'php': ['php', 'phpcs'],
\   'html': [],
\}

" ----------------------------------------------------------------------------
" Prettier
" ----------------------------------------------------------------------------
" https://github.com/prettier/vim-prettier#overwrite-default-prettier-configuration
" Why can't it just use the project's prettier config?
" https://github.com/prettier/vim-prettier/pull/52
let g:prettier#config#bracket_spacing = 'true'
