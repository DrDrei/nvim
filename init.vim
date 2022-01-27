syntax on

" Better colors
set termguicolors

" Line Numbering
set number
set relativenumber

" Searching/Filtering
set ignorecase
set smartcase
set incsearch

" Indenting
set smartindent
set autoindent
set tabstop=2
set softtabstop=2
set shiftwidth=2
set expandtab

set noswapfile

set scrolloff=10

set mouse=a

call plug#begin(stdpath('data') . '/plugged')
Plug 'folke/tokyonight.nvim'
Plug 'morhetz/gruvbox'

Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}

Plug 'nvim-telescope/telescope.nvim'
Plug 'nvim-lua/plenary.nvim'

Plug 'neovim/nvim-lspconfig'
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-path'
Plug 'hrsh7th/cmp-cmdline'
Plug 'hrsh7th/nvim-cmp'
Plug 'williamboman/nvim-lsp-installer'

Plug 'hrsh7th/cmp-vsnip'
Plug 'hrsh7th/vim-vsnip'

Plug 'phaazon/hop.nvim'

Plug 'nvim-lualine/lualine.nvim'

Plug 'tpope/vim-fugitive'
call plug#end()

let g:mapleader=" "

color gruvbox

nnoremap <leader>t :tab term<cr>

nnoremap <silent> <leader>sf :w<cr>
nnoremap <silent> <leader>so :so %<cr>
nnoremap <silent> <leader>sn :so $MYVIMRC<cr>
nnoremap <silent> <leader>st :! tmux source-file ~/.tmux.conf<cr>
nnoremap <silent> <leader>q :bd<cr>
nnoremap <silent> <leader><cr> :nohl<cr>

nnoremap <silent> <C-d> <C-d>zz
nnoremap <silent> <C-u> <C-u>zz

nnoremap <silent> <leader>fw :HopWord<cr>
highlight HopNextKey  guifg=#d5c4a1
highlight HopNextKey1 guifg=#d5c4a1
highlight HopNextKey2 guifg=#d5c4a1

nnoremap <silent> <leader>ff <cmd>Telescope find_files<cr>
nnoremap <silent> <leader>fg <cmd>Telescope live_grep<cr>
nnoremap <silent> <leader>fb <cmd>Telescope buffers<cr><esc>
nnoremap <silent> <leader>fh <cmd>Telescope help_tags<cr>
nnoremap <silent> <leader>fm <cmd>Telescope marks<cr><esc>
nnoremap <silent> <leader>fs <cmd>Telescope sessions<cr><esc>

nnoremap <leader>gs :G<cr>
nnoremap <leader>gw :Gwrite<cr>
nnoremap <leader>go :Git commit --no-verify<cr>
nnoremap <leader>gp :Git push --no-verify<cr>
nnoremap <leader>gl :Git pull<cr>
nnoremap <leader>gm :Git merge master<cr>

nnoremap <down> :m .+1<CR>==
nnoremap <up> :m .-2<CR>==
inoremap <down> <Esc>:m .+1<CR>==gi
inoremap <up> <Esc>:m .-2<CR>==gi
vnoremap <down> :m '>+1<CR>gv=gv
vnoremap <up> :m '<-2<CR>gv=gv

nmap <silent> <C-j> :wincmd j<CR>
nmap <silent> <C-k> :wincmd k<CR>
nmap <silent> <C-h> :wincmd h<CR>
nmap <silent> <C-l> :wincmd l<CR>

nnoremap <leader>e :26Vex<cr>
set splitbelow
set splitright

nnoremap <leader>cp :let @+=expand('%:p')<CR>

let g:netrw_browse_split=4
let g:netrw_liststyle=3
let g:netrw_banner=0

set completeopt=menu,menuone,noselect,noinsert

" LSP config (the mappings used in the default file don't quite work right)
nnoremap <silent> gd <cmd>lua vim.lsp.buf.definition()<CR>
nnoremap <silent> gD <cmd>lua vim.lsp.buf.declaration()<CR>
nnoremap <silent> gr <cmd>lua vim.lsp.buf.references()<CR>
nnoremap <silent> gi <cmd>lua vim.lsp.buf.implementation()<CR>
nnoremap <silent> K <cmd>lua vim.lsp.buf.hover()<CR>
nnoremap <silent> <leader>rn <cmd>lua vim.lsp.buf.rename()<CR>
nnoremap <silent> <leader>ca <cmd>lua vim.lsp.buf.code_action()<CR>

autocmd BufWritePre *.js lua vim.lsp.buf.formatting_sync(nil, 20)
autocmd BufWritePre *.jsx lua vim.lsp.buf.formatting_sync(nil, 20)
autocmd BufWritePre *.ts lua vim.lsp.buf.formatting_sync(nil, 20)
autocmd BufWritePre *.tsx lua vim.lsp.buf.formatting_sync(nil, 20)

lua << EOF
  require('nvim-treesitter.configs').setup({
    ensure_installed = 'maintained',
    highlight = {
      enable = true
    }
  })

  require('lualine').setup({
    theme = 'gruvbox'
  })

  require('hop').setup()

  require('telescope').setup({ 
    defaults = { 
      file_ignore_patterns = {"node_modules", "__mocks__", "backup/"},  
      layout_strategy = 'vertical',
    } 
  })

  local cmp = require('cmp')

  cmp.setup({
    snippet = {
      expand = function(args)
        vim.fn["vsnip#anonymous"](args.body)
      end,
    },
    mapping = {
      ['<Tab>'] = cmp.mapping(cmp.mapping.select_next_item(), { 'i', 's' }),
      ['<S-Tab>'] = cmp.mapping(cmp.mapping.select_prev_item(), { 'i', 's' }),
      ['<C-Space>'] = cmp.mapping(cmp.mapping.complete(), { 'i', 'c' }),
      ['<C-y>'] = cmp.config.disable,
      ['<C-e>'] = cmp.mapping({
        i = cmp.mapping.abort(),
        c = cmp.mapping.close(),
      }),
      ['<cr>'] = cmp.mapping.confirm({ select = true }),
    },
    sources = cmp.config.sources({
      { name = 'nvim_lsp' },
      { name = 'vsnip' },
    }, {
      { name = 'buffer' },
    })
  })

  cmp.setup.cmdline('/', {
    sources = {
      { name = 'buffer' },
    }
  })

  cmp.setup.cmdline(':', {
    sources = cmp.config.sources({
      { name = 'path' }
    }, {
      { name = 'cmdline' }
    })
  })

  local nvim_lsp = require('lspconfig')

  local capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())

  local servers = { 'html', 'tsserver' }
  for _, lsp in ipairs(servers) do
    nvim_lsp[lsp].setup {
      capabilities = capabilities,
      flags = {
        debounce_text_changes = 150,
      }
    }
  end

EOF

