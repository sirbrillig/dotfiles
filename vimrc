" Summary: Payton's vimrc file
" Version: 2.3.0
" --------------------

" == Some useful options:
syntax on
set hlsearch
set autoindent "use previous line's indent level
set background=dark "assume dark background.
set hidden "allow edited buffers to be hidden
set switchbuf=useopen "use existing buffer rather than opening a new one
set showtabline=2 "always show the tab bar
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

" Status line
set statusline=%y " file type
set statusline+=\ \-\  " separator
set statusline+=%{(&expandtab?'SPACES':'TABS')} " expandtab status
set statusline+=\ \-\  " separator
set statusline+=%r\  " readonly flag
set statusline+=%F " file path
set statusline+=%= " switch to right side
set statusline+=Line\  " separator
set statusline+=%l " current line
set statusline+=/ " separator
set statusline+=%L " total lines
set statusline+=\ %P " percent through file

" turn on filetype indentation
filetype on
filetype plugin on
filetype indent on

" == Keymapping
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

" keys for tab behavior in vim 7:
" map CTRL-t to new tab.
" also map Leader-[ and Leader-] to tab navigation.
nnoremap <C-T> :tabnew<space>
" nnoremap <Leader>[ :tabprev<CR>
" nnoremap <Leader>] :tabnext<CR>
nnoremap <Leader>[ :bp<CR>
nnoremap <Leader>] :bn<CR>

" Modify the colors in the vim 7 tabs.
hi TabLine term=reverse ctermfg=Gray ctermbg=NONE
hi TabLineSel term=reverse cterm=underline ctermfg=0 ctermbg=2
hi TabLineFill term=underline cterm=underline ctermfg=8 ctermbg=0

" Modify some highlight colors to be less offensive to the eye.
hi IncSearch term=reverse,underline cterm=reverse,bold,underline ctermbg=NONE ctermfg=NONE
hi Search term=NONE cterm=reverse,bold ctermbg=NONE ctermfg=NONE
hi MatchParen term=NONE cterm=bold ctermbg=NONE ctermfg=DarkCyan
hi PmenuSel term=NONE cterm=NONE ctermfg=White ctermbg=Blue
hi Pmenu term=NONE cterm=NONE ctermfg=Black ctermbg=White

" Modify the cursorline colors to show just the line number highlighted
hi CursorLineNr ctermbg=3
hi CursorLine cterm=none
set cursorline
set number

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

" Treat Gemfile and Vagrantfile as Ruby
" (http://ilkka.github.io/blog/2011/02/03/teach_vim_about_gemfiles/)
augroup filetype_gemfile
  autocmd!
  autocmd BufNewFile,BufRead Gemfile setlocal filetype=ruby
  autocmd BufNewFile,BufRead Vagrantfile setlocal filetype=ruby
augroup END

" map Leader-n to toggle NERDTree
nnoremap <Leader>n :NERDTreeTabsToggle<CR>

" Configure tab autocomplete
set completeopt=menuone,longest

" Configure vim-grep plugin
let Grep_Default_Options = '-Irn'
" set switchbuf+=newtab

" Allow recursive find
set path+=**

" Map leader-; to add a semicolon to the end of the line
nnoremap <Leader>; mqA;<esc>`q

" Map leader-l to last buffer
let g:lasttabs = [1]
function! LastTab()
  if len(g:lasttabs) < 1
    return
  endif
  let last_tab = remove(g:lasttabs, -1)
  while last_tab > tabpagenr('$') || last_tab == tabpagenr()
  	let last_tab = remove(g:lasttabs, -1)
  endwhile
	execute "tabn ".last_tab
endfunction
function! PushLastTab()
  call add(g:lasttabs, tabpagenr())
endfunction
augroup last_tab
  autocmd!
  autocmd TabLeave * call PushLastTab()
augroup END
" nnoremap <Leader>l :call LastTab()<CR>
nnoremap <Leader>l :b#<CR>

" Configure taboo plugin
let g:taboo_tab_format = ' %N:%T%m '

" Map leader-[1-10] to switch to a tab
let i = 1
while i <# 10
  execute "nnoremap <Leader>" .i. "  " .i. "gt"
  let i += 1
endwhile

" Configure the MRU plugin
" let g:MRU_Open_File_Use_Tabs = 1

" Map leader-x to close the quickfix window
nnoremap <Leader>x :ccl<CR>

" Map CTRL-f to the FindByName plugin
nnoremap <C-f> :FindByName<space>

" Map leader-P to CtrlP without activation so a directory can be added
nnoremap <Leader>P :CtrlP<space>
" Map leader-m to the CtrlPMRU search
nnoremap <Leader>m :CtrlPMRU<CR>
" Map leader-b to the CtrlPBuffer search
nnoremap <Leader>b :CtrlPBuffer<CR>
" Map leader-x to close the current buffer
nnoremap <Leader>x :bw<CR>

" Allow pathogen plugins (http://www.vim.org/scripts/script.php?script_id=2332)
call pathogen#infect()

" *Plugins recommended*
" ===========================================================================
" pathogen.vim (https://github.com/tpope/vim-pathogen)
" vim-trailing-whitespace (https://github.com/bronson/vim-trailing-whitespace)
" findbyname.vim (https://github.com/sirbrillig/findbyname.vim)
" grep.vim (https://github.com/vim-scripts/grep.vim)
" jshint2.vim (https://github.com/Shutnik/jshint2.vim)
" mru.vim (https://github.com/vim-scripts/mru.vim)
" nerdtree (https://github.com/scrooloose/nerdtree)
" netgrep (https://github.com/sirbrillig/netgrep)
" taboo.vim (https://github.com/sirbrillig/taboo.vim or https://github.com/gcmt/taboo.vim)
" vim-autocomplpop (https://bitbucket.org/ns9tks/vim-autocomplpop/)
" vim-coffee-script (https://github.com/kchmck/vim-coffee-script)
" vim-json-master (https://github.com/elzr/vim-json)
" vim-nerdtree-tabs (https://github.com/jistr/vim-nerdtree-tabs)
