call plug#begin()

" heuristically adjusts tab/space
Plug 'tpope/vim-sleuth'

" swtich between source files and header files
Plug 'vim-scripts/a.vim'

" fancy status bar
Plug 'vim-airline/vim-airline'

" themes of vim-airline
Plug 'vim-airline/vim-airline-themes'

" AST highlight
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}

" show treesitter information
Plug 'nvim-treesitter/playground'

" language server protocol
Plug 'neovim/nvim-lspconfig'

" auto completion
Plug 'hrsh7th/nvim-cmp'
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-vsnip'
Plug 'hrsh7th/vim-vsnip'

call plug#end()


runtime airline_config.vim

lua require("treesitter_config")

runtime netrw_config.vim

lua require("lsp_config")

lua require("cmp_config")
