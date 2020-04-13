" vimrc
" ----------------------------------------------------------------------------
" Summary: Payton's vimrc file
" URL: https://github.com/sirbrillig/dotfiles
" ----------------------------------------------------------------------------

" ----------------------------------------------------------------------------
" Set up vim-plug
" ----------------------------------------------------------------------------
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif
call plug#begin('~/.vim/bundle')

" ----------------------------------------------------------------------------
" Plugins
" ----------------------------------------------------------------------------
Plug 'vim-scripts/L9'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'vim-scripts/mru.vim'
Plug 'scrooloose/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'ryanoasis/vim-devicons'
" Plug 'vim-scripts/AutoComplPop'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-endwise'
Plug 'airblade/vim-gitgutter'
Plug 'danro/rename.vim'
Plug 'moll/vim-bbye'
Plug 'kshenoy/vim-signature'
" Plug 'tpope/vim-sleuth' " Sets shiftwidth and expandtab automatically
Plug 'prettier/vim-prettier', {
  \ 'do': 'yarn install',
  \ 'for': ['javascript', 'typescript', 'css', 'less', 'scss', 'json', 'graphql', 'php'] }
Plug 'junegunn/vader.vim' " vimscript testing framework
Plug 'MarcWeber/vim-addon-mw-utils' " Some utilities needed by vim-snipmate
Plug 'tomtom/tlib_vim' " Adds a bunch of T... commands needed by snipmate
Plug 'garbas/vim-snipmate'
Plug 'jiangmiao/auto-pairs' " Adds autopopulating closing parens/brackets/braces/quotes; has some bugs
Plug 'tomtom/tcomment_vim' " Use gc to toggle comments or gcc for a single line
Plug 'neoclide/coc.nvim', {'branch': 'release'}

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
Plug 'dag/vim-fish'
Plug 'flowtype/vim-flow'
Plug 'StanAngeloff/php.vim'
Plug 'jxnblk/vim-mdx-js'
Plug 'tjvr/vim-nearley'
Plug 'leafgarland/typescript-vim'

" Search plugins
Plug 'jremmen/vim-ripgrep' " Requires ripgrep
Plug '~/Code/vim-grepdef'

" Color scheme plugins
Plug 'tomasr/molokai'
Plug 'arcticicestudio/nord-vim'

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
set formatoptions+=crqlj "auto-format comments in code.
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
" set iskeyword+=\- " Adds dash character to keyword characters
set iskeyword-=\$ " Removes dollar sign from keyword characters
" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" delays and poor user experience.
set updatetime=300
" Always show the signcolumn, otherwise it would shift the text each time
" diagnostics appear/become resolved.
set signcolumn=yes

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

" Use rg (ripgrep) for ctrlp indexing
if executable('rg')
  let g:ctrlp_user_command = 'rg %s --files --color=never --glob ""'
  let g:ctrlp_use_caching = 0
endif

" Hide the NERDTree arrows because some systems don't have support for those characters
" let g:NERDTreeDirArrows=0
" Always show hidden files
let NERDTreeShowHidden=1

" Display indentation guides
set list listchars=tab:\|\ ,trail:·,extends:»,precedes:«,nbsp:×

" Highlight searches made by Ag
let g:ag_highlight=1

" Disable JSON quote concealing
let g:vim_json_syntax_conceal = 0

" Help fix syntax issues
" http://vim.wikia.com/wiki/Fix_syntax_highlighting
" Or run :syntax sync fromstart
syntax sync minlines=500

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
let g:airline_powerline_fonts = 1

" ----------------------------------------------------------------------------
" Keybindings
" ----------------------------------------------------------------------------

" Map ctrl-j and ctrl-k to jump to previous/next linting error
nmap <silent> <C-k> <Plug>(coc-diagnostic-prev)
nmap <silent> <C-j> <Plug>(coc-diagnostic-next)
" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" allow using [[ and ]] for curly braces not in the first column
map [[ [{
map ]] ]}

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

" map Leader-t to new buffer.
" also map Leader-[ and Leader-] to navigation.
nnoremap <Leader>t :e<space>
nnoremap <Leader>[ :bp<CR>
nnoremap <Leader>] :bn<CR>

" map gp to Prettier
nnoremap gp :Prettier<CR>

" Add manual command for PHP prettier since the built-in one doesn't seem to
" work
command! PrettierPHP silent !prettier --write --use-tabs --trailing-comma-php php5 --brace-style 1tbs --single-quote %

" Alias :GD to :GrepDef
cnoreabbrev GD GrepDef

" Alias NF to NERDTreeFind
cnoreabbrev NF NERDTreeFind

" Function to fix tab settings when they get screwed up
function! FixTabSettings()
  set tabstop=2
  set shiftwidth=2
  set noexpandtab
endfunction

" Function to fix tab and highlight settings when they get screwed up
function! FixThings()
  set noet ci pi sts=0 sw=2 ts=2
  syntax sync fromstart
endfunction
command! FixThings call FixThings()

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

" Map leader-g to grep for the word under the cursor
nnoremap <Leader>g :Rg <cword>

" Map leader-G to begin a search
nnoremap <Leader>G :Rg 

" Map leader-c, leader-C to copy/paste selected text in MacOS
vnoremap <Leader>c :w !pbcopy<CR><CR>:echom "copied to MacOS clipboard"<CR>
nnoremap <Leader>C :set paste<CR>:r !pbpaste<CR>:set nopaste<CR>:echom "pasted from MacOS clipboard"<CR>

" Map leader-y to paste from last register 0 (last yank)
noremap <Leader>y "0p<CR>

" ----------------------------------------------------------------------------
" Colors
" ----------------------------------------------------------------------------

" Enable "true" colors
if exists('+termguicolors')
  let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
  let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
  set termguicolors
endif

" Set the theme
" colorscheme elflord " my favorite for a long time with customizations
colorscheme molokai " always a good one
" colorscheme nord 

" Simplify colors during vimdiff
" highlight DiffAdd    cterm=bold ctermfg=10 ctermbg=17 gui=none guifg=bg guibg=Red
" highlight DiffDelete cterm=bold ctermfg=10 ctermbg=17 gui=none guifg=bg guibg=Red
" highlight DiffChange cterm=bold ctermfg=10 ctermbg=17 gui=none guifg=bg guibg=Red
" highlight DiffText   cterm=bold ctermfg=10 ctermbg=88 gui=none guifg=bg guibg=Red

" For some reason paragraph text always appears as italic, so make it easier to read at least.
" hi markdownItalic ctermfg=253 ctermbg=238 guifg=#DADADA guibg=#40403C

" ----------------------------------------------------------------------------
" FileTypes
" ----------------------------------------------------------------------------

" Show flow syntax: https://github.com/pangloss/vim-javascript#configuration-variables
let g:javascript_plugin_flow = 1
let g:flow#enable = 0
let g:flow#showquickfix = 0

" ----------------------------------------------------------------------------
" Prettier
" ----------------------------------------------------------------------------
" https://github.com/prettier/vim-prettier#overwrite-default-prettier-configuration
" Why can't it just use the project's prettier config?
" https://github.com/prettier/vim-prettier/pull/52
let g:prettier#config#bracket_spacing = 'true'
let g:prettier#exec_cmd_async = 1
let g:prettier#config#use_tabs = 'true'
let g:prettier#config#single_quote = 'true'
let g:prettier#config#trailing_comma = 'es5'
" Disable requiring format pragma
let g:prettier#autoformat = 0
" autocmd BufWritePre *.js,*.jsx,*.mjs,*.ts,*.tsx,*.css,*.less,*.scss,*.json,*.graphql,*.md,*.vue,*.yaml,*.html Prettier

" ----------------------------------------------------------------------------
" Other
" ----------------------------------------------------------------------------
" https://github.com/airblade/vim-gitgutter/issues/490
let g:gitgutter_terminal_reports_focus = 0

" Allow jsonc (json with comments)
autocmd FileType json syntax match Comment +\/\/.\+$+
