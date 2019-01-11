" Use VIM settings rather than VI settings (much better!)
" This must go first, because it changes other options as sideeffect
set nocompatible

" Source ~/.vimrc.before if it exists.
if filereadable(expand("~/.vimrc.before"))
source ~/vimrc.before
endif

" =============== General Config =================

set number relativenumber	"Line numbers are good
set backspace=indent,eol,start  "Allow backspace in insert mode
set history=1000		"Store lots of :cmfline history
set showcmd			"Show incomplete cmds down the bottow
set showmode			"Show current mode down the bottom
set gcr=a:blink0		"Disable cursor blink
set visualbell			"No sounds
set autoread			"Reload files changed outside vim

" This makes VIM act like a normal editor, buffers can
" exist in the background without being in a window
" http://items.sjbach.com/319/configuring-vim-right
set hidden

" Change leader to a comma because the backslash is too far away
" That means all the \x commands turn into ,x
" The mapleader has to be set before vundle starts loading all
" the plugins.
let mapleader=","
set timeout timeoutlen=1500

" ============== Turn Off Swap Files ============

set noswapfile
set nobackup
set nowb

" ============== Persistent Undo =============
" Keep undo history across sessions, by storing in file.
" Only works all the time.
if has('persistent undo') && !isdirectory(expand('~').'/.vim/backups')
silent !mkdir ~/.vim/backups > /dev/null 2>&1
set undodir=~/.vim/backups
set undofile
endif

" ============== Folds =======================

set foldmethod=indent  "fold based on indent
set foldnestmax=3      "deepest fold is 3 levels
set nofoldenable       "dont fold by default

" ============= Scrolling ===================

set scrolloff=8		"Start scrolling when we are 8 lines away from margin
set sidescrolloff=15
set sidescroll=1

" ============= Search ===============

set incsearch		"Find the next match as we type the search
set hlsearch		"Highlight searches by default
set ignorecase		"Ignore case when searching...
set smartcase		" ...unless we type a capital

" ================ Indentation ======================

set autoindent
set smartindent
set smarttab
set shiftwidth=2
set softtabstop=2
set tabstop=2
set expandtab

" Display tabs and trailing spaces visually
set list listchars=tab:\ \ ,trail:·

set linebreak    "Wrap lines at convenient points

" =============== Term Settings ===================
set term=xterm-256color
filetype plugin indent on
syntax on

" ================ Custom Settings ========================

" Window pane resizing
nnoremap <silent> <Leader>[ :exe "resize " . (winheight(0) * 3/2)<CR>
nnoremap <silent> <Leader>] :exe "resize " . (winheight(0) * 2/3)<CR>

" Navigating tabs
nnoremap th  :tabfirst<CR>
nnoremap tk  :tabnext<CR>
nnoremap tj  :tabprev<CR>
nnoremap tl  :tablast<CR>
nnoremap tt  :tabedit<Space>
nnoremap tn  :tabnext<Space>
nnoremap tm  :tabm<Space>
nnoremap td  :tabclose<CR>

" Opening NERDTree
nnoremap <Leader>n :NERDTreeToggle<CR>

" FZF

nnoremap <C-p> :Files<Cr>

" ======================= Vim Plug Start =================
call plug#begin()
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-rails'
Plug 'vim-ruby/vim-ruby'
Plug 'scrooloose/nerdtree'
Plug 'tjammer/blayu.vim'
Plug 'tpope/vim-endwise'
Plug 'gerw/vim-hilinktrace'
Plug '/usr/local/opt/fzf'
Plug 'junegunn/fzf.vim'
Plug 'ervandew/supertab'
Plug 'romainl/vim-cool'
Plug 'slim-template/vim-slim'
Plug 'posva/vim-vue'
Plug 'vim-scripts/vim-coffee-script'
Plug 'pangloss/vim-javascript'
Plug 'Townk/vim-autoclose'

"=====================================================
Plug 'joequery/stupid-easymotion'
"<Leader><Leader>w<sign>                -->> Move to a word on a line
"<Leader><Leader>f<query><sign>         -->> Search and move to a word
"=====================================================

"=====================================================
Plug 'tpope/vim-surround'
"ys[noun][delimeter]                    -->> Surround with a delimeter
"yss[delimeter]                         -->> Surround the whole line
"ds[noun][delimeter}                     -->> Unsurround
"cs[current_delimeter][new_delimeter}   -->> Change delimeter
"VS[delimeter]                          -->> Visually surround a line
"=====================================================

"=====================================================
Plug 'tpope/vim-commentary'
"Comment stuff out. Use [gcc] to comment out a line (takes a count), gc to
"comment out the target of a motion (for example, gcap to comment out a
"paragraph), gc in visual mode to comment out the selection, and gc in
"operator pending mode to target a comment. You can also use it as a command,
"either with a range like :7,17Commentary, or as part of a :global invocation
"like with :g/TODO/Commentary. That's it.
"=====================================================

"=====================================================
Plug 'vim-scripts/ReplaceWithRegister'
" [count]["x]gr{motion}   Replace {motion} text with the contents of register x.
"                         Especially when using the unnamed register, this is
"                         quicker than "_d{motion}P or" "_c{motion}<C-R>"
" [count]["x]grr          Replace [count] lines with the contents of register x.
"                         To replace from the cursor position to the end of the
"                         line use ["x]gr$
" {Visual}["x]gr          Replace the selection with the contents of register x.
"=====================================================

"=====================================================
Plug 'vim-scripts/ReplaceWithSameIndentRegister'
"[count]["x]grR          Replace [count] lines with the contents of register x
"                        and adjust the indent to the first replaced line (like
"                        pasting with ]p).
"{Visual}["x]gR          Replace the selection with the contents of register x
"                        and adjust the indent to the first selected line.
"                        As the replacement is always entire lines, this only
"                        works with linewise selections (V).
"=====================================================

"=====================================================
Plug 'christoomey/vim-titlecase'
"The [gt] mapping will wait for a text object or motion before completing the titlecase operation.
"This means [gti'] will titlecase inside of single quotes, gtap will titlecase a paragraph, etc. gt will also work on a visual selection.
"In addition, [gT] will titlecase the current line.
"=====================================================

"=====================================================
Plug 'christoomey/vim-sort-motion'
"gs2j => Sort down two lines (current + 2 below)
"gsip => Sort the current paragraph
"gsii => Sort the current indentation level (requires text-obj-indent plugin)
"gsi( => Sort within parenthesis. (b, c, a) would become (a, b, c)
"=====================================================

"=====================================================
Plug 'christoomey/vim-system-copy'
"cpiw => copy word into system clipboard
"cpi' => copy inside single quotes to system clipboard
"=====================================================
call plug#end()

"============================== Color Scheme =========
colorscheme solarized
set noeb vb t_vb=

"============================== Rails.vim ===========

let g:rubycomplete_buffer_loading = 1
let g:rubycomplete_rails = 1

"============================== Supertab ===========

let g:SuperTabDefaultCompletionType = ""
