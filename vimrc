" Summary: Payton's vimrc file
" Version: 2.2.0
" --------------------

" == Some useful options:
syntax on
set hlsearch
set autoindent "use previous line's indent level
set background=dark "assume dark background.
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
set statusline+=%r\  " readonly flag
set statusline+=%F " file path
set statusline+=%= " switch to right side
set statusline+=Line\  " separator
set statusline+=%l " current line
set statusline+=/ " separator
set statusline+=%L " total lines

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
nnoremap <C-T> :tabnew
nnoremap <Leader>[ :tabprev<CR>
nnoremap <Leader>] :tabnext<CR>

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

" Map Leader-cc to toggle comments
nnoremap <silent> <Leader>cc :call ToggleComment()<CR>
vnoremap <silent> <Leader>cc :call ToggleComment()<CR>
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
nnoremap <Leader>n <plug>NERDTreeTabsToggle<CR>

" Configure tab autocomplete
let g:SuperTabDefaultCompletionType = "<c-n>"
set completeopt=menuone,longest

" Configure vim-grep plugin
let Grep_Default_Options = '-Irn'
set switchbuf+=newtab

" Allow recursive find
set path+=**

" Map leader-; to add a semicolon to the end of the line
nnoremap <Leader>; mqA;<esc>`q

" Map leader-l to last tab
let g:lasttab = 1
nnoremap <Leader>l :execute "tabn ".g:lasttab<CR>
augroup last_tab
  autocmd!
  autocmd TabLeave * let g:lasttab = tabpagenr()
augroup END

" Configure taboo plugin
let g:taboo_tab_format = ' %N:%T%m '

" Map leader-[1-10] to switch to a tab
let i = 1
while i <# 10
  execute "nnoremap <Leader>" .i. "  " .i. "gt"
  let i += 1
endwhile

" Configure the MRU plugin
let g:MRU_Open_File_Use_Tabs = 1

" Map leader-x to close the quickfix window
nnoremap <Leader>x :ccl<CR>

" Allow pathogen plugins (http://www.vim.org/scripts/script.php?script_id=2332)
call pathogen#infect()
