call plug#begin()

" heuristically adjusts tab/space
Plug 'tpope/vim-sleuth'

" swtich between source files and header files
Plug 'vim-scripts/a.vim'

" fancy status bar
Plug 'vim-airline/vim-airline'

" fuzzey finder
Plug 'junegunn/fzf'
Plug 'junegunn/fzf.vim'

" color themes
Plug 'vim-airline/vim-airline-themes'
Plug 'sainnhe/sonokai'

" AST highlight
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'nvim-treesitter/playground'

" show indentation level
Plug 'Yggdroot/indentLine'

" language server protocol
Plug 'neovim/nvim-lspconfig'

" auto completion
Plug 'hrsh7th/nvim-cmp'
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-vsnip'
Plug 'hrsh7th/vim-vsnip'

call plug#end()


runtime airline_config.vim
runtime netrw_config.vim
runtime fzf_config.vim

lua require("treesitter_config")
lua require("lsp_config")
lua require("cmp_config")
