"Set Modifiable"
:set ma

"Remove double status bar"
set noshowmode

"Color Scheme of Editor
let g:gruvbox_contrast_dark = 'hard'
:set bg=dark
let g:gruvbox_italic = '1'
let g:gruvbox_bold   = '1'
let g:gruvbox_transparent_bg = '1'
let g:gruvbox_italicize_comments = '0'
"let g:gruvbox_improved_strings = '1'
autocmd VimEnter * hi Normal ctermbg=none

if (empty ($TMUX))
    if (has("nvim"))
        let $NVIM_TUI_ENABLE_TRUE_COLOR=1
    endif
    if (has("termguicolors"))
        set termguicolors
    endif
endif


"Status Bar
set laststatus=2


"Plugins
call plug#begin('~/local/share/nvim/plugged')

"Cool commandbar with airline feature and colorschemes"
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
"let g:airline_theme='gruvbox'
let g:airline_theme='nord'

Plug 'cocopon/iceberg.vim'

Plug 'nordtheme/vim'

Plug 'vim-syntastic/syntastic'

Plug 'deathlyfrantic/vim-distinguished'

"Fuzzy Vim Plugin"
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim' 

"AutoComplete Plugin"
Plug 'vim-scripts/AutoComplPop'
set complete+=kspell
set completeopt=menuone,longest


Plug 'morhetz/gruvbox'

"NerdTree Plugin
Plug 'preservim/nerdtree'
    "Settings for nerdTree"
    "Start NERDTree and put cursor in other window 
    autocmd VimEnter * NERDTree | wincmd p
    autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

call plug#end()
"Set Colorscheme to gruvbox"
":colorscheme gruvbox
:colorscheme nord
":colorscheme distinguished
":colorscheme iceberg
"Line Numbers
:set number

"Syntax Coloring Enabled
:syntax enable

"Wrap taxt that extends beyond screen
set wrap

" Allow crosshair cursor highlighting.
hi CursorLine   cterm=NONE ctermbg=0
hi CursorColumn cterm=NONE ctermbg=0
nnoremap <Leader>c :set cursorline! cursorcolumn!<CR>
set tabstop=4 "Sets indent size of tabs"
set softtabstop=4 "Soft tabs"
set expandtab "Turns tabs into spaces"
set shiftwidth=4 "Sets auto-indent size"
set autoindent "Turns on auto-indenting"
set copyindent "Copy the previous indentation on autoindenting"
set smartindent "Remembers previous indent when creating new lines"

"Autocomplete Brackets
inoremap { {}<Esc>ha
inoremap ( ()<Esc>ha
inoremap [ []<Esc>ha
inoremap " ""<Esc>ha
inoremap ' ''<Esc>ha
inoremap ` ``<Esc>ha''']]))}}

"Switch between paste and nopaste modes"
set pastetoggle=<F3>


"Fuzzy Vim Keybinds"            
nnoremap <silent> <C-p> :Tags<CR>
""nnoremap <silent> <C-p> :Files<CR>
""nnoremap <silent> <C-g> :Gfiles<CR>
""nnoremap <silent> <C-o> :Buffers<CR>
""nnoremap <C-f> :Rg 
""let g:fzf_layout = { 'window': '~45%' }

set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
