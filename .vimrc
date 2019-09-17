" Use VIM settings rather than VI settings (much better!)
" This must go first, because it changes other options as sideeffect
set nocompatible

let g:python3_host_prog = '/usr/local/bin/python3.7'


" =============== If you are using .vim.before =========
" Source ~/.vimrc.before if it exists.
if filereadable(expand("~/.vimrc.before"))
source ~/vimrc.before
endif
" ======================================================






" ====================== Mappings ======================

" " Copy to clipboard
vnoremap  <leader>y  "+y
nnoremap  <leader>Y  "+yg_
nnoremap  <leader>y  "+y
nnoremap  <leader>yy  "+yy

" " Paste from clipboard
nnoremap <leader>p "+p
nnoremap <leader>P "+P
vnoremap <leader>p "+p
vnoremap <leader>P "+P
tnoremap <Esc> <C-\><C-n>

" Change leader to a comma because the backslash is too far away
" That means all the \x commands turn into ,x
" The mapleader has to be set before vundle starts loading all
" the plugins.
let mapleader=","

" ============== Copy and Paste to clipboard ====

noremap <Leader>y "*y
noremap <Leader>p "*p
noremap <Leader>Y "+y
noremap <Leader>P "+p

" ============== Get Syntax Highlight Group =====
nnoremap <F10> :HLT

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






" ========================= Quality of life params ======================
set nocursorline                "Removes whole line highlighting. If you want it - 'set cursorline'
set number relativenumber	      "Line numbers are relative to current line
set backspace=indent,eol,start  "Allow backspace in insert mode
set history=1000		            "Store lots of :cmfline history
set showcmd			                "Show incomplete cmds down the bottow
set showmode			              "Show current mode down the bottom
set gcr=a:blink0		            "Disable cursor blink
set visualbell			            "No annoying sounds of error or something
set autoread			              "Reload files changed outside vim
set modifiable                  "This is mainly for NERDTree buffer to become modifiable with m+*key*
set inccommand=split            "Dynamically show substitutions with :s in a split window

" This makes VIM act like a normal editor, buffers can
" exist in the background without being in a window
" http://items.sjbach.com/319/configuring-vim-right
set hidden

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

set scrolloff=8		    "Start scrolling when we are 8 lines away from margin
set sidescroll=1      "Enables sidescroll
set sidescrolloff=15  "Start scrolling when we are 15 symbols from margin

" ============= Search ===============

set incsearch		"Find the next match as we type the search
set hlsearch		"Highlight searches by default
set ignorecase	"Ignore case when searching...
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
if !has('nvim')
        set term=xterm-256color
endif
filetype plugin indent on
syntax on

" Set max line length

highlight ColorColumn ctermbg=grey
set colorcolumn=100






"==================== ALE ================================
" https://github.com/dense-analysis/ale
" Run linters and fixers for any language you want

let g:ale_linters = {
\   'elixir': ['elixir-ls'],
\   'ruby': ['rubocop', 'ruby'],
\}
let g:ale_fixers = {
\   'elixir': ['mix_format'],
\}

let g:ale_elixir_elixir_ls_release=$HOME.'/work/elixir-ls/release/' " Path must be complete!
let g:ale_completion_enabled = 0                       " Deoplete serves as a completion plugin instead
let g:ale_sign_error = '✘'
let g:ale_sign_warning = '⚠'
let g:ale_lint_on_enter = 0                            " I prefer to lint on save
let g:ale_lint_on_text_changed = 'never'
highlight ALEErrorSign ctermbg=NONE ctermfg=red
highlight ALEWarningSign ctermbg=NONE ctermfg=yellow
let g:ale_linters_explicit = 1
let g:ale_lint_on_save = 1
let g:ale_fix_on_save = 1
noremap <Leader>ad :ALEGoToDefinition<CR>
nnoremap <leader>af :ALEFix<cr>
noremap <Leader>ar :ALEFindReferences<CR>
"Move between linting errors
nnoremap ]r :ALENextWrap<CR>
nnoremap [r :ALEPreviousWrap<CR>






"======================== Alchemist ======================
let g:alchemist_tag_disable = 1    " It interfered with Ctags mapping on ctrl-], so I turned it off.
                                   " I prefer Ctags more






"========================= Autoclose =====================
let g:AutoClosePumvisible = {"ENTER": "<C-Y>", "ESC": "<ESC>"} " To press esc only once after autocomplete






" ======================= Vim Plug Start =================
call plug#begin()

Plug 'slim-template/vim-slim'        " Slim integration
Plug 'pangloss/vim-javascript'       " JS integration
Plug 'vim-scripts/vim-coffee-script' " Coffee-script integration
Plug 'posva/vim-vue'                 " Vue.js integration
Plug 'tpope/vim-rails'               " Rails integration
Plug 'vim-ruby/vim-ruby'             " Ruby language integration
Plug 'elixir-editors/vim-elixir'     " Elixir integration
Plug 'slashmili/alchemist.vim'       " Elixir integration
Plug 'mattreduce/vim-mix'            " Mix integration (Elixir)
Plug 'mhinz/vim-mix-format'          " Mix-format integration
Plug 'rust-lang/rust.vim'            " Rust integration
Plug 'racer-rust/vim-racer'          " Racer integration

Plug '/usr/local/opt/fzf'            " FZF integration
Plug 'junegunn/fzf.vim'              " change directory to your FZF install directory

Plug 'w0rp/ale'                      " ALE (Asynchronous Lint Engine) is a plugin providing linting
                                     " (syntax checking and semantic errors)

Plug 'tpope/vim-fugitive'            " The best Git wrapper of all time

Plug 'scrooloose/nerdtree'           " Files tree to your left. open with <leader>n

Plug 'Xuyuanp/nerdtree-git-plugin'   " Plugin to show git status flags in NERDTree

Plug 'tjammer/blayu.vim'             " A vim color scheme

Plug 'tpope/vim-endwise'             " Endings after defs. Not really needed with vim-ruby and vim-elixir though.

Plug 'kergoth/vim-hilinks'           " A plugin which traces the highlighting linkages.
                                     " Good if you want to set custom color highlights

Plug 'ervandew/supertab'             " Perform all your vim insert mode completions with Tab

Plug 'romainl/vim-cool'              " Vim-cool disables search highlighting when you are done 
                                     " searching and re-enables it when you search again.

Plug 'Townk/vim-autoclose'           " This plugin for Vim enable an auto-close chars feature for you.
                                     " For instance if you type an '(', ``autoclose`` will automatically insert a ')' 

Plug 'itchyny/lightline.vim'         " A light and configurable statusline/tabline plugin for Vim

Plug 'machakann/vim-highlightedyank' " Highlights what you just yanked

Plug 'tpope/vim-repeat'               " Allow '.' to repeat not only native editor commands

"============Global Search and Replace ===============

Plug 'vim-scripts/Greplace.vim'
" Overview
" The Global Replace plugin allows you to search and replace a pattern
" across multiple files. The lines containing a specified pattern in multiple
" files are displayed in a buffer. You can edit the lines in this buffer and 
" make the desired modifications to them. The plugin can then 
" incorporate these changes back into the corresponding files interactively.

" The following commands are provided by this plugin:

" :Gsearch         Search for a given pattern in the specified group of
"                  files and display the matches in the replace buffer.
" :Gbuffersearch   Search for a given pattern in all the buffers
"                  in the Vim buffer list.
" :Gargsearch      Search for a given pattern in all the files in the
"                  Vim argument list.
" :Gqfopen         Use the results from the quickfix list.
" :Greplace        Incorporate the modifications from the replace buffer
"                  into the corresponding files.

" Refer to the greplace.txt help file for more information (available with the
" plugin).


"============= Multiple Cursors ======================
Plug 'terryma/vim-multiple-cursors'
"usable by Ctrl+N

"============= Vim Renamer ===========================
Plug 'qpkorr/vim-renamer'
" Invoke with :Renamer, change names of file, apply with :Ren

" ======================== Emmet =====================
" is a vim plug-in which provides support for expanding abbreviations similar to emmet
Plug 'mattn/emmet-vim'
" CTRL+Y, <leader>

"================== Vim Eunich =======================
Plug 'tpope/vim-eunuch'

" Vim sugar for the UNIX shell commands that need it the most. Features include:

" :Delete: Delete a buffer and the file on disk simultaneously.
" :Unlink: Like :Delete, but keeps the now empty buffer.
" :Move: Rename a buffer and the file on disk simultaneously.
" :Rename: Like :Move, but relative to the current file's containing directory.
" :Chmod: Change the permissions of the current file.
" :Mkdir: Create a directory, defaulting to the parent of the current file.
" :Cfind: Run find and load the results into the quickfix list.
" :Clocate: Run locate and load the results into the quickfix list.
" :Lfind/:Llocate: Like above, but use the location list.
" :Wall: Write every open window. Handy for kicking off tools like guard.
" :SudoWrite: Write a privileged file with sudo.
" :SudoEdit: Edit a privileged file with sudo.
" File type detection for sudo -e is based on original file name.
" New files created with a shebang line are automatically made executable.
" New init scripts are automatically prepopulated with /etc/init.d/skeleton.


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

"========================== deoplete =========================
" Autocompletion plugin
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
let g:deoplete#enable_at_startup = 1
"============================================================

call plug#end()






"============================== Color Scheme =========
colorscheme solarized                     " This colorscheme is custom
set noeb vb t_vb=

"============================== Racer ===============
au FileType rust nmap gd <Plug>(rust-def)
au FileType rust nmap gs <Plug>(rust-def-split)
au FileType rust nmap gx <Plug>(rust-def-vertical)
au FileType rust nmap <leader>gd <Plug>(rust-doc)

"============================== Rails.vim ===========

let g:rubycomplete_buffer_loading = 1
let g:rubycomplete_rails = 1

"============================== Rust.vim ==========="
let g:rustfmt_autosave = 1

"============================== Supertab ===========

let g:SuperTabDefaultCompletionType = ""

"======== Racer for Rust programming language =======

let g:racer_cmd = "/Users/konstantingavrilov/.cargo/bin/racer"

"======================= Lightline ==================
let g:lightline = {
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'gitbranch', 'readonly', 'filename', 'modified' ] ]
      \ },
      \ 'component_function': {
      \   'gitbranch': 'fugitive#head'
      \ },
      \ }

""========= NERDTree syntax highlighting ============="
"let g:NERDTreeExtensionHighlightColor = {}
"let g:NERDTreeExtensionHighlightColor['ex'] = "834F79"
"let g:NERDTreeExtensionHighlightColor['exs'] = "834F79"
"let g:NERDTreeExtensionHighlightColor['eex'] = "834F79"
"let g:NERDTreeExtensionHighlightColor['leex'] = "834F79"
"let g:NERDTreeHighlightCursorline = 0
