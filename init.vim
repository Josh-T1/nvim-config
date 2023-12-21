"Plugins
call plug#begin('~/.config/nvim/plugged')
"my Plug
Plug '~/.config/nvim/plugged/converter'
" My plug for adding brackets
Plug '~/.config/nvim/plugged/saround'
" my plug for commenting lines out
Plug '~/.config/nvim/plugged/CommentOut'
" Latex plug for previewing
Plug 'lervag/vimtex'
" Luasnip plug for code snippets
Plug 'L3MON4D3/LuaSnip'

Plug 'jiangmiao/auto-pairs'

" Colorscheme plugs
Plug 'tomasr/molokai'
Plug 'dracula/vim', {'as': 'dracula'}
Plug 'catppuccin/nvim', { 'as': 'catppuccin' }

"Markdown plug to preview .md
Plug 'iamcco/markdown-preview.nvim'
" Lsp/Autocomplete
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/nvim-cmp'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-path'
Plug 'neovim/nvim-lspconfig'
" Telescope
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim', { 'tag': '0.1.5' }
Plug 'nvim-telescope/telescope-fzf-native.nvim', { 'do': 'make' }

" Treesitter
Plug 'nvim-treesitter/nvim-treesitter'
"Auto suggestions (Issue) needs to be disabled for filetype tex
"Plug 'vim-scripts/AutoComplPop'
" R Plugins
Plug 'jalvesaq/Nvim-R'
call plug#end()
"figure out how to update nvim TODO
" Basic config
colorscheme catppuccin
"colorscheme molokai
set number
" Split direction for multiple buffers
set splitright
" Prevent text from wrapping
set nowrap
set list
set listchars=tab:\ \ ,trail:~
" what does this do
set inccommand=nosplit
" mouse support
set mouse=a
syntax on
" enable highlight search patterns
set hlsearch
" enable smartcase serach sensitivity
"set ignorecase
"set smartcase
set tabstop=4
set softtabstop=4
set shiftwidth=4
" ensures that spaces are used when tab is pressend
set expandtab	
" ?
set autoindent
" show matching bracket
set showmatch
" remove trailing whitespace from python files
autocmd BufWritePre *.py :%s/\s\+$//e
autocmd BufEnter *.tex :TSBufDisable highlight "disable vimtex sytax if this is deleted
"prevent comment from begin wrote when curosr is moved down a line 
"set paste

"highlight Comment ctermfg=green
" ---Python---
" Flake config and mapping
"let g:ale_linters={'python': ['flake8']}
" Flake8 call mapping
"let g:no_flake8_maps=1
"let g:flake8_show_quickfix=1
"let g:flake8_show_in_gutter=1
"let g:flake8_show_in_file=1
"autocmd FileType python map <buffer> <C-f> :call flake8#Flake8()<CR>

" python nvim venv path
let g:python3_host_prog='/Users/joshuataylor/.pyenv/versions/py3nvim/bin/python'
let g:python_host_prog='/Users/joshuataylor/.pyenv/versions/py3nvim/bin/python'
"LuaSnip snippet mappings
imap <silent><expr> <Tab> luasnip#expand_or_jumpable() ? '<Plug>luasnip-expand-or-jump' : '<Tab>'
smap <silent><expr> <Tab> luasnip#jumpable(1) ? '<Plug>luasnip-jump-next' : '<Tab>'
imap <silent><expr> <S-Tab> luasnip#jumpable(-1) ? '<Plug>luasnip-jump-prev' : '<S-Tab>'
smap <silent><expr> <S-Tab> luasnip#jumpable(-1) ? '<Plug>luasnip-jump-prev' : '<S-Tab>'

"My Saround Plug mappings
let g:saround_square_key_user = "sss"
let g:saround_curly_key_user = "ssc"
let g:saround_round_key_user = "ssr"

let mapleader = ","

" ---------- R ----------
let R_assign_map = ";"
vmap <Space> <Plug>RDSendSelection
nmap <Space> <Plug>RDSendLine


" ------- General --------
"move right one character
inoremap <leader>l <Right>
inoremap <leader>h <Left>
" <C-t>, <C-g> to navigate search results
" esc mapping -> unused
"inoremap <leader>e <esc>
"noremap <leader>u <esc>$i<right>
"
" File tree 
inoremap <leader>t <esc><Cmd>Lex<cr><Cmd>vertical resize 30<cr>
noremap <leader>t <Cmd>Lex<cr><Cmd>vertical resize 30<cr>
"Change overlapping buffers
noremap nnn <Cmd>bnext<cr>
" Open buffer in new window
noremap vvv <esc><C-w><C-v>
" Quit shortcut
noremap vvq <Cmd>q<cr>
"noremap ccq <Cmd><q><cr>
"Change buffers
noremap <leader>h <esc><C-w>h
noremap <leader>l <esc><C-w>l
noremap <leader>j <esc><C-w>j
noremap <leader>k <esc><C-w>k
" Write 
inoremap <leader>w <esc><Cmd>w<cr>
noremap <leader>w <Cmd>w<cr>
" Add line below form normal mode
" * Needs to be fixed, terminal does not set right keys to vim?
"File navigation mappings
noremap <leader>vi <Cmd>vsp<space>~/.config/nvim/init.vim<cr>
inoremap <leader>vi <esc><Cmd>vsp<space>~/.config/nvim/init.vim<cr>
inoremap <leader>v <esc>:vsp<space>
noremap <leader>v :vsp<space>
"open terminal in bottom window
noremap <leader>/t <Cmd>below terminal<cr>
" Move faster
""noremap <leader>ff <S-6>
"Flake8 sytax mapping
" Lua snip config
" cancel menu selection
inoremap <leader>e <c-e>

lua require("setup")
lua require("luasnip.loaders.from_lua").load({paths = "~/.config/nvim/LuaSnip/"})
lua require("luasnip").config.set_config({enable_autosnippets = true, store_selection_keys = "<Tab>",})

