" init.vim
" ----------------------------------------------------------------------------
" Summary: Payton's neovim config file
" URL: https://github.com/sirbrillig/dotfiles
" ----------------------------------------------------------------------------

" ----------------------------------------------------------------------------
" Set up vim-plug
" ----------------------------------------------------------------------------
call plug#begin('~/.vim/bundle')

" ----------------------------------------------------------------------------
" Plugins
" ----------------------------------------------------------------------------
Plug 'vim-scripts/L9'
Plug 'vim-scripts/mru.vim'
Plug 'akinsho/bufferline.nvim' " bufferline (tabline)
Plug 'hoob3rt/lualine.nvim' " statusline
Plug 'kyazdani42/nvim-web-devicons' " icons for lualine, bufferline (and possibly others)
Plug 'tpope/vim-surround' " Add or change surrounding tokens, eg: quotes
Plug 'nvim-lua/plenary.nvim' " Library for some neovim things, I think; required by gitsigns, null-ls, etc.
Plug 'lewis6991/gitsigns.nvim' " Highlight git additions or removals
Plug 'danro/rename.vim' " Adds :Rename command
Plug 'moll/vim-bbye' " alows closing buffers
Plug 'kshenoy/vim-signature' " displays vim marks in signs column
" Plug 'tpope/vim-sleuth' " Sets shiftwidth and expandtab automatically, buggy
" when changing shiftwidth it inexplicably changes it to 4 instead of tabstop.
Plug 'junegunn/vader.vim' " vimscript testing framework
Plug 'windwp/nvim-autopairs' " Adds autopopulating closing parens/brackets/braces/quotes
Plug 'tomtom/tcomment_vim' " Use gc to toggle comments or gcc for a single line
Plug 'neovim/nvim-lspconfig' " starts language servers, I think
Plug 'EinfachToll/DidYouMean' " Shows suggestions when you try to open the wrong filename
Plug 'ruanyl/vim-gh-line' " type gh to open selected or current line in github
Plug 'karb94/neoscroll.nvim' " smooth scrolling
Plug 'hrsh7th/nvim-cmp' " autocomplete
Plug 'hrsh7th/cmp-nvim-lsp' " lsp source for nvim-cmp
Plug 'hrsh7th/cmp-buffer' " buffer source for nvim-cmp
Plug 'hrsh7th/vim-vsnip' " snippets, required by nvim-cmp
Plug 'hrsh7th/cmp-path' " path source for nvim-cmp
Plug 'nvim-treesitter/nvim-treesitter' " Library for other plugs and themes that deal with syntax
Plug 'jose-elias-alvarez/null-ls.nvim' " Language server for various misc. linters like phpcs
Plug 'kyazdani42/nvim-tree.lua' " File explorer
Plug 'gbprod/substitute.nvim' " Exchange register for text object

" Syntax plugins
Plug 'yuezk/vim-js'
Plug 'leafgarland/typescript-vim'
Plug 'peitalin/vim-jsx-typescript'
Plug 'MaxMEllon/vim-jsx-pretty'
Plug 'elzr/vim-json'
Plug 'mustache/vim-mustache-handlebars'
Plug 'moll/vim-node'
Plug 'cakebaker/scss-syntax.vim'
Plug 'hail2u/vim-css3-syntax'
Plug 'Keithbsmiley/swift.vim'
Plug 'fatih/vim-go'
Plug 'dag/vim-fish'
Plug 'StanAngeloff/php.vim'
Plug 'jxnblk/vim-mdx-js'
Plug 'tjvr/vim-nearley'
Plug 'itspriddle/vim-shellcheck'

" Search plugins
" Plug 'jremmen/vim-ripgrep' " Broken because of https://github.com/jremmen/vim-ripgrep/pull/58
Plug 'mi544/vim-ripgrep' " Fork of the one above
Plug '~/Code/vim-grepdef'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'pbogut/fzf-mru.vim'
Plug 'gfanto/fzf-lsp.nvim'
Plug 'sk1418/QFGrep'

" Color scheme plugins
Plug 'tanvirtin/monokai.nvim'
Plug 'folke/tokyonight.nvim'
Plug 'sainnhe/sonokai'

call plug#end()

" Allow matching ruby do/end blocks
runtime macros/matchit.vim

" ----------------------------------------------------------------------------
" Options
" ----------------------------------------------------------------------------
syntax on
filetype on
filetype plugin on
filetype indent on
set hlsearch "highlight search matches
set autoindent "use previous line's indent level
set preserveindent " when reindenting try to preserve existing indentation as much as possible
set copyindent " when starting a new line use the indent of the previous line
set background=dark "assume dark background.
set hidden "allow edited buffers to be hidden
set switchbuf=useopen "use existing buffer rather than opening a new one
set showtabline=1 "show the tab bar only if more than 1 tab
set smarttab "pressing tab fixes indent.
set noet "use tabs to indent
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
set backspace=indent,eol,start "allow erasing previously entered characters in insert mode.
set wildmenu " show list instead of just completing
set scrolloff=3 " minimum lines to keep above and below cursor
set laststatus=2 " always show the status line
set cmdheight=2 " slightly more room for notices
let g:netrw_silent=1 " be quiet when using netrw
set cursorline " highlight the current cursor line number
set number " show line numbers
set path+=** " Allow recursive find
set completeopt=menuone,noselect " Configure tab autocomplete
set iskeyword-=\$ " Removes dollar sign from keyword characters
" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" delays and poor user experience.
set updatetime=300
" Resize sign column to show multiple signs
set signcolumn=auto:1

set backupdir=/tmp
set undodir=/tmp
set directory=/tmp

" Allow copy/paste between MacOS and tmux
set clipboard=unnamed

" Display indentation guides
set list
set listchars=tab:\|\ ,trail:·,extends:»,precedes:«,nbsp:×

" Highlight searches made by Ag
let g:ag_highlight=1

" Disable JSON quote concealing
let g:vim_json_syntax_conceal = 0

" Help fix syntax issues
" http://vim.wikia.com/wiki/Fix_syntax_highlighting
" Or run :syntax sync fromstart
syntax sync minlines=500

" Disable buggy indenting of leafgarland/typescript-vim
let g:typescript_indent_disable = 1

lua << EOF
require('neoscroll').setup()

require('lualine').setup({
  sections = {
    lualine_c = {{
      'filename',
      file_status = true,
      path = 1,
    }},
    lualine_x = {'filetype'},
  },
  options = {
    theme = 'wombat',
    globalstatus = true,
  },
})

require("bufferline").setup({
  options = {
    show_buffer_close_icons = false,
    offsets = {},
  }
})

require("substitute").setup({
  -- your configuration comes here
  -- or leave it empty to use the default settings
  -- refer to the configuration section below
})
EOF

" ----------------------------------------------------------------------------
" LSP
" ----------------------------------------------------------------------------

lua << EOF
-- Use an on_attach function to only map the following keys
-- after the language server attaches to the current buffer
local on_attach = function(client, bufnr)
  local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end
  local function buf_set_option(...) vim.api.nvim_buf_set_option(bufnr, ...) end

  -- Enable completion triggered by <c-x><c-o>
  -- buf_set_option('omnifunc', 'v:lua.vim.lsp.omnifunc')

  -- Mappings.
  local opts = { noremap=true, silent=true }

  -- See `:help vim.lsp.*` for documentation on any of the below functions
  buf_set_keymap('n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<CR>', opts)
  buf_set_keymap('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>', opts)
  buf_set_keymap('n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>', opts)
  buf_set_keymap('n', '<space>D', '<cmd>lua vim.lsp.buf.type_definition()<CR>', opts)
  buf_set_keymap('n', '<C-k>', '<cmd>lua vim.diagnostic.goto_prev()<CR>', opts)
  buf_set_keymap('n', '<C-j>', '<cmd>lua vim.diagnostic.goto_next()<CR>', opts)

  -- list all symbols in document in quickfix
  buf_set_keymap('n', '<space>s', '<cmd>lua vim.lsp.buf.document_symbol()<CR>', opts)

	-- list all lsp errors in quickfix
  buf_set_keymap('n', '<space>q', '<cmd>lua vim.lsp.diagnostic.set_loclist()<CR>', opts)
end

require("null-ls").setup({
  diagnostics_format = "[#{c}] #{m} (#{s})",
  -- debug = true,
  -- default_timeout = 50000,
  debounce = 1000,
  sources = {
    require("null-ls").builtins.formatting.eslint_d,
    require("null-ls").builtins.diagnostics.eslint_d,
    require("null-ls").builtins.diagnostics.phpcs,
    -- require("null-ls").builtins.formatting.phpcbf,
  },
  on_attach = function(client, bufnr)
        -- auto-format on save; see https://github.com/jose-elias-alvarez/null-ls.nvim/wiki/Formatting-on-save
        if client.supports_method("textDocument/formatting") then
            vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
            vim.api.nvim_create_autocmd("BufWritePre", {
                group = augroup,
                buffer = bufnr,
                callback = function()
                    -- on 0.8, you should use vim.lsp.buf.format({ bufnr = bufnr }) instead
                    vim.lsp.buf.formatting_sync()
                end,
            })
        end
        on_attach(client, bufnr);
    end,
})

require("lspconfig").tsserver.setup({
    on_attach = function(client, bufnr)
        client.resolved_capabilities.document_formatting = false
        client.resolved_capabilities.document_range_formatting = false
        on_attach(client, bufnr);
    end,
})
require("lspconfig").phpactor.setup({})

vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(
   vim.lsp.diagnostic.on_publish_diagnostics, {
     signs = true,
     update_in_insert = false,
     underline = true,
     severity_sort = true,
   }
)

vim.diagnostic.config({
  virtual_text = false,
})

local signs = { Error = " ", Warning = " ", Hint = " ", Information = " " }
for type, icon in pairs(signs) do
  local hl = "LspDiagnosticsSign" .. type
  vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
end

require('gitsigns').setup({
  sign_priority = 2,
  signs = {
    add          = {hl = 'GitSignsAdd'   , text = '+', numhl='GitSignsAddNr'   , linehl='GitSignsAddLn'},
    change       = {hl = 'GitSignsChange', text = '~', numhl='GitSignsChangeNr', linehl='GitSignsChangeLn'},
    delete       = {hl = 'GitSignsDelete', text = '-', numhl='GitSignsDeleteNr', linehl='GitSignsDeleteLn'},
    topdelete    = {hl = 'GitSignsDelete', text = '-', numhl='GitSignsDeleteNr', linehl='GitSignsDeleteLn'},
    changedelete = {hl = 'GitSignsChange', text = '~', numhl='GitSignsChangeNr', linehl='GitSignsChangeLn'},
  },
})

-- Configure autocomplete
local cmp = require('cmp')
cmp.setup({
  completion = {
    keyword_length = 3,
  },
  formatting = {
    format = function(entry, vim_item)
      -- set a name for each source
      vim_item.menu = ({
        buffer = "[Buffer]",
        nvim_lsp = "[LSP]",
        path = "[Path]",
      })[entry.source.name]
      return vim_item
    end,
  },
  snippet = {
    expand = function(args)
      vim.fn["vsnip#anonymous"](args.body)
    end,
  },
  mapping = cmp.mapping.preset.insert({
    ['<C-Space>'] = cmp.mapping.complete(),
    ['<CR>'] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
  }),
  sources = {
    { name = 'nvim_lsp' },
    { name = 'buffer' },
    { name = 'path' },
  }
})

require('nvim-autopairs').setup({
    check_ts = true,
    ts_config = {
        javascript = {'template_string'},
    }
})

require('nvim-treesitter.configs').setup {
  autopairs = {enable = true}
}

-- I don't know what this does but it was suggested by nvim-cmp
local capabilities = vim.lsp.protocol.make_client_capabilities()
require('cmp_nvim_lsp').update_capabilities(capabilities)

-- Something needed by cmp-buffer
get_bufnrs = function()
  return vim.api.nvim_list_bufs()
end

require('nvim-tree').setup {
  disable_netrw       = true,
  hijack_netrw        = true,
  open_on_setup       = false,
  ignore_ft_on_setup  = {},
  open_on_tab         = false,
  hijack_cursor       = false,
  update_cwd          = false,
  diagnostics = {
    enable = false,
    icons = {
      hint = "",
      info = "",
      warning = "",
      error = "",
    }
  },
  update_focused_file = {
    enable      = false,
    update_cwd  = false,
    ignore_list = {}
  },
  system_open = {
    cmd  = nil,
    args = {}
  },
  filters = {
    dotfiles = false,
    custom = {}
  },
  view = {
    width = 45,
    height = 30,
    hide_root_folder = false,
    side = 'left',
    mappings = {
      custom_only = false,
      list = {}
    }
  }
}
EOF

" ----------------------------------------------------------------------------
" Keybindings
" ----------------------------------------------------------------------------

" quit with capital Q also
command! -bar -bang Q quit<bang>
command! -bar -bang Qa quitall<bang>
command! Ccl ccl

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
nnoremap <Leader>r :source $MYVIMRC<CR>:echom "vimrc reloaded"<CR>

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

" map gp to autoformat
nnoremap gp :lua vim.lsp.buf.formatting_sync()<CR>

" Alias :DS to :DocumentSymbols to open fzf with all symbols
cnoreabbrev DS DocumentSymbols

" Alias :GD to :GrepDef
cnoreabbrev GD GrepDef

" Function to fix tab and highlight settings when they get screwed up
function! FixThings()
  set noexpandtab copyindent preserveindent softtabstop=0 shiftwidth=2 tabstop=2
  set redrawtime=10000
  syntax enable
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

" map Leader-n to toggle file explorer (eg: NERDTree)
nnoremap <leader>n <cmd>NvimTreeFindFileToggle<cr>

" Map leader-: to add a semicolon to the end of the line
nnoremap <Leader>: mqA;<esc>`q

" Map leader-, to add a comma to the end of the line
nnoremap <Leader>, mqA,<esc>`q

" Map leader-l to last buffer
nnoremap <Leader>l :b#<CR>

" Map ctrl-p to FZF files
nnoremap <C-p> :Files<CR>
" Map leader-m to the MRU search
nnoremap <Leader>m :FZFMru<CR>
" Map leader-b to the buffer search
nnoremap <Leader>b :Buffers<CR>
" Map leader-x to close the current buffer
nnoremap <Leader>x :Bdelete<CR>

" Map leader-g to grep for the word under the cursor
nnoremap <Leader>g :Rg -w <cword>

" Map leader-G to begin a search
nnoremap <Leader>G :Rg 

" Map leader-y to paste from last register 0 (last yank)
noremap <Leader>y "0p<CR>

" Add command for opening current file and line in OpenGrok
function! OpenInGrok()
  let s:filepath = expand('%')
  let s:linenumber = line(".")
  let s:baseuri = "https://opengrok.a8c.com/source/xref/trunk/"
  let s:uri = s:baseuri . s:filepath . "\\#" . s:linenumber
  exec "!open " . shellescape(s:uri) . ""
endfunction
command! OpenInGrok call OpenInGrok()

nmap <Leader>ss :<C-u>SessionSave<CR>
nmap <Leader>sl :<C-u>SessionLoad<CR>

" Keybindings for substitute.nvim
lua << EOF
vim.keymap.set("n", "s", "<cmd>lua require('substitute').operator()<cr>", { noremap = true })
vim.keymap.set("n", "ss", "<cmd>lua require('substitute').line()<cr>", { noremap = true })
vim.keymap.set("n", "S", "<cmd>lua require('substitute').eol()<cr>", { noremap = true })
vim.keymap.set("x", "s", "<cmd>lua require('substitute').visual()<cr>", { noremap = true })
EOF

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
let g:sonokai_transparent_background = 1
colorscheme sonokai

" Make the background transparent
hi Normal guibg=NONE ctermbg=NONE

" ----------------------------------------------------------------------------
" Other
" ----------------------------------------------------------------------------
let g:fzf_mru_relative = 1 " Only list files in the current directory
let g:fzf_preview_window = '' " Disable preview window

" Allow jsonc (json with comments)
autocmd FileType json syntax match Comment +\/\/.\+$+
