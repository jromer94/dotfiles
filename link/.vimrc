set nocompatible              " required
filetype off                  " required

call plug#begin('~/.vim/plugged')

Plug 'vim-scripts/indentpython.vim'
Plug 'vim-syntastic/syntastic'
Plug 'nvie/vim-flake8'
Plug 'NLKNguyen/papercolor-theme'
Plug 'morhetz/gruvbox'
Plug 'wincent/command-t'
Plug 'w0rp/ale'
Plug 'tpope/vim-vinegar'
Plug 'tpope/vim-obsession'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-commentary'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'christoomey/vim-tmux-navigator'
Plug 'rust-lang/rust.vim'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
" Initialize plugin system
call plug#end()

filetype plugin indent on    " required


let mapleader = "\<Space>"
inoremap jk <ESC>
inoremap jj <ESC>

"Basic settings"
set hidden
set backspace=indent,eol,start "makes backspace work"
set history=500 "Sets undo history size"
set number "Turns on line numbering"
set tabstop=4 "Sets indent size of tabs"
set softtabstop=4 "Soft tabs"
set expandtab "Tabs suck. Spaces rule."
set shiftwidth=4 "Sets auto-indent size"
set autoindent "Turns on auto-indenting"
set copyindent "Copy the previous indentation on autoindenting"
set smartindent "Remembers previous indent when creating new lines"
set wildignorecase "Ignore case while autocompletting search results"
set clipboard=unnamedplus "enable clipboard"

au BufNewFile,BufRead *.js,*.jsx*,*.rb,*.html,*.xml,*.wat,*.scss,*.css :setlocal sw=2 ts=2 sts=2 " Two spaces for js/ruby/etc files "

let python_highlight_all=1
syntax on

"color settings"
" This is only necessary if you use "set termguicolors".
let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"

set t_Co=256
set background=dark

set termguicolors
colorscheme gruvbox
let g:airline_theme='gruvbox'
let g:airline_powerline_fonts = 1

if has('linebreak')
    set breakindent "indents wrapped lines to match start"
    set linebreak "linebreak without breaking words"
    let &showbreak='⤷ '                 " ARROW POINTING DOWNWARDS THEN CURVING RIGHTWARDS (U+2937, UTF-8: E2 A4 B7)
    if exists('&breakindentopt')
        set breakindentopt=shift:2 "indents linebreaks extra 2 spaces"
    endif
endif

set list                              " show whitespace
set listchars=nbsp:⦸                  " CIRCLED REVERSE SOLIDUS (U+29B8, UTF-8: E2 A6 B8)
set listchars+=tab:▷┅                 " WHITE RIGHT-POINTING TRIANGLE (U+25B7, UTF-8: E2 96 B7)
                                      " + BOX DRAWINGS HEAVY TRIPLE DASH HORIZONTAL (U+2505, UTF-8: E2 94 85)
set listchars+=extends:»              " RIGHT-POINTING DOUBLE ANGLE QUOTATION MARK (U+00BB, UTF-8: C2 BB)
set listchars+=precedes:«             " LEFT-POINTING DOUBLE ANGLE QUOTATION MARK (U+00AB, UTF-8: C2 AB)
set listchars+=trail:•                " BULLET (U+2022, UTF-8: E2 80 A2)
set nojoinspaces "don't autoinsert spaces after join command"

set scrolloff=3 "Start scrolling 3 lines before edge of viewport"
set shiftround "indents by multiple of shiftwidth"
set shortmess+=A                      " ignore annoying swapfile messages
set shortmess+=I                      " no splash screen
set shortmess+=O                      " file-read message overwrites previous
set shortmess+=T                      " truncate non-file messages in middle
set shortmess+=W                      " don't echo "[w]"/"[written]" when writing
set shortmess+=a                      " use abbreviations in messages eg. `[RO]` instead of `[readonly]`
set shortmess+=o                      " overwrite file-written messages
set shortmess+=t                      " truncate file messages at start

if has('windows')
  set splitbelow                      " open horizontal splits below current window
endif

if has('vertsplit')
  set splitright                      " open vertical splits to the right of the current window
endif

if has('folding')
  if has('windows')
    set fillchars=vert:┃              " BOX DRAWINGS HEAVY VERTICAL (U+2503, UTF-8: E2 94 83)
  endif
  set foldmethod=indent               " not as cool as syntax, but faster
  set foldlevelstart=99               " start unfolded
endif

if exists('$SUDO_USER')
  set nobackup                        " don't create root-owned files
  set nowritebackup                   " don't create root-owned files
else
  set backupdir=~/.vim/tmp/backup//    " keep backup files out of the way
endif

if has('persistent_undo')
  if exists('$SUDO_USER')
    set noundofile                    " don't create root-owned files
  else
    set undodir=~/.vim/tmp/undo//      " keep undo files out of the way
    set undofile                      " actually use undo files
  endif
endif

if has('viminfo')
  if exists('$SUDO_USER')
    set viminfo=                      " don't create root-owned files
  else
    set viminfo+=n~/.vim/tmp/viminfo " override ~/.viminfo default
    if !empty(glob('~/.vim/tmp/viminfo'))
      if !filereadable(expand('~/.vim/tmp/viminfo'))
        echoerr 'warning: ~/.vim/tmp/viminfo exists but is not readable'
      endif
    endif
  endif
endif

if exists('$SUDO_USER')
  set noswapfile                      " don't create root-owned files
else
  set directory=~/.vim/tmp/swap//     " keep swap files out of the way
endif

if has('mksession')
  set viewdir=~/.vim/tmp/view//       " override ~/.vim/view default
  set viewoptions=cursor,folds        " save/restore just these (with `:{mk,load}view`)
endif

set cursorline "highlight current line"
set guifont=Source\ Code\ Pro\ Light:h13
set guioptions-=T                     " don't show toolbar
set hidden                            " allows you to hide buffers with unsaved changes without being prompted
set highlight+=@:ColorColumn          " ~/@ at end of window, 'showbreak'
set highlight+=N:DiffText             " make current line number stand out a little
set highlight+=c:LineNr               " blend vertical separators with line numbers
set laststatus=2                      " always show status line
set lazyredraw                        " don't bother updating screen during macro playback

if has('wildmenu')
  set wildmenu                        " show options as list when switching buffers etc
endif
set wildmode=longest:full,full        " shell-like autocomplete to unambiguous portion

"Command-t settings"
let g:CommandTFileScanner='git'

"Ale settings"
let g:ale_linters = {
\    'javascript': ['eslint'],
\    'python': ['flake8']
\}

"vinegar/netrw settings"
augroup netrw_mapping
    autocmd!
    autocmd filetype netrw call NetrwMapping()
augroup END

function! NetrwMapping()
    nmap <buffer> f <cr> " f opens directories/files "
    nmap <buffer> dd <C-^> " dd returns to current buffer "
    nmap <buffer> F - " F goes up a directory "
endfunction
