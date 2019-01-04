""""""""""""""""""""""""""""""""""""""""
""""""""""begin vundle config"""""""""""
""""""""""""""""""""""""""""""""""""""""
"enable VIM mode, not compatible with VI
set nocompatible
filetype off

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

"let vundle manage the plugins
Plugin 'gmarik/Vundle.vim'

"file directory searcher
Plugin 'scrooloose/nerdtree'
Plugin 'scrooloose/syntastic'
"code completion plugin
Plugin 'Valloric/YouCompleteMe'
"class outline and function viewer
Plugin 'majutsushi/tagbar'
Plugin 'fatih/vim-go'

Plugin 'wesQ3/vim-windowswap'

"Plugin 'LaTeX-Suite-aka-Vim-LaTeX'
Plugin 'junegunn/rainbow_parentheses.vim'


call vundle#end()
filetype plugin indent on

""""""""""""""""""""""""""""""""""""""""
"""""""""""end vundle config""""""""""""
""""""""""""""""""""""""""""""""""""""""

"""""""""""""""""""""""""""""""""""""""""""
"""""""""""begin general config""""""""""""
"""""""""""""""""""""""""""""""""""""""""""
"Show trailing whitespace chars
"set list
set listchars=tab:>-,trail:.,extends:#,nbsp:.
"
set foldmethod=syntax
set foldnestmax=1

set title
"inoremap { {<CR><BS>}<Esc>ko
highlight statement cterm=bold
highlight Folded ctermbg=NONE

let mapleader = ','

let g:windowswap_map_keys = 0 "prevent default bindings
nnoremap <silent> <leader>yw :call WindowSwap#MarkWindowSwap()<CR>
nnoremap <silent> <leader>pw :call WindowSwap#DoWindowSwap()<CR>
nnoremap <silent> <leader>ww :call WindowSwap#EasyWindowSwap()<CR>

if &term =~ "xterm.*"
    let &t_ti = &t_ti . "\e[?2004h"
    let &t_te = "\e[?2004l" . &t_te
    function! XTermPasteBegin(ret)
        set pastetoggle=<Esc>[201~
        set paste
        return a:ret
    endfunction
    map <expr> <Esc>[200~ XTermPasteBegin("i")
    imap <expr> <Esc>[200~ XTermPasteBegin("")
    vmap <expr> <Esc>[200~ XTermPasteBegin("c")
    cmap <Esc>[200~ <nop>
    cmap <Esc>[201~ <nop>
endif

"better buffer management - hide buffers instead of closing them
set hidden
set history=100
set undolevels=100


"Spacebar for pagedown, pageup
"nmap <Space> <C-f>
"nmap <BackSpace> <C-b>

set splitbelow
set splitright

"Copy to OSX clipboard
map <C-c> "*y<CR><CR>

"Keep several lines visible at the top or bottom of the screen
set scrolloff=4

map <Tab><Tab> <C-W>w
nnoremap <F2><F2> :vsplit<CR>
nnoremap <F3><F3> <C-W>w
nnoremap <F4><F4> :set invwrap wrap?<CR>
nnoremap <F5><F5> :set invhls hls?<CR>

"keep tabs, but view them as 4 spaces
"set tabstop=4 shiftwidth=4 softtabstop=4 noexpandtab
" use 4 spaces for tabs
set tabstop=4 softtabstop=4 shiftwidth=4


" display indentation guides
set list listchars=tab:\❘\ ,trail:·,extends:»,precedes:«,nbsp:×

" convert spaces to tabs when reading file
autocmd FileType !javascript ! bufreadpost * set noexpandtab | retab! 4

" convert tabs to spaces before writing file
autocmd FileType !javascript ! bufwritepre * set expandtab | retab! 4

" convert spaces to tabs after writing file (to show guides again)
autocmd FileType !javascript ! bufwritepost * set noexpandtab | retab! 4
"function Use8 ()
"   set tabstop=8 shiftwidth=8 softtabstop=8 noexpandtab
"endfunction

"Enable virtual space
set ve=block

autocmd FileType javascript setlocal tabstop=2 shiftwidth=0 softtabstop=2 expandtab
"disable arrow keys
"map <up> <nop>
"map <down> <nop>
"map <left> <nop>
"map <right> <nop>

"ignore case of searches if all lowercase, else case sensitive(like normal)
set smartcase
set ignorecase

"set highlight color
hi Search cterm=NONE ctermfg=Blue  ctermbg=Magenta

"highlight matches when searching
set hlsearch
"incrementally search for matches
set incsearch


"set indenting
set autoindent
set smartindent

"line numbers
set nu

"cursor line and column position
set ruler

"Turn on spellcheck for certian filetypes
"autocmd BufRead,BufNewFile *.md setlocal spell spelllang=en_us
"autocmd BufRead,BufNewFile *.txt setlocal spell spelllang=en_us
"autocmd FileType gitcommit setlocal spell spelllang=en_us

"enable colors
syntax on

"allow backspacing over more than current line
set backspace=indent,eol,start

"set terminal colors
set t_Co=256
"vertical bar on 80 columns and autowrap to next line if over
set textwidth=119
set colorcolumn=120
hi ColorColumn ctermbg=4

"""""begin the keymappings!""""
nmap j gj
nmap k gk
map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l
cmap w!! w !sudo tee % >/dev/null
nnoremap ; :

"nnoremap <CR> :noh<CR><CR>

let g:highlighting = 0
function! Highlighting()
    if g:highlighting == 1 && @/ =~ '^\\<'.expand('<cword>').'\\>$'
        let g:highlighting = 0
        return ":silent nohlsearch\<CR>"
    endif
    let @/ = '\<'.expand('<cword>').'\>'
    let g:highlighting = 1
    return ":silent set hlsearch\<CR>"
endfunction
nnoremap <silent> <expr> <CR> Highlighting()

autocmd VimEnter * RainbowParentheses

set makeprg=make\ CPP\ ../build\ -j9
"""""""""""""""""""""""""""""""""""""""""
"""""""""""end general config""""""""""""
"""""""""""""""""""""""""""""""""""""""""
filetype plugin indent on

""""""""""""""""""""""""""""""""""""""""""
"""""""""""begin plugin config""""""""""""
""""""""""""""""""""""""""""""""""""""""""


"let syntastic populate errors messages wthin lists
let g:syntastic_always_populate_loc_list=1
let g:syntastic_c_remove_include_errors = 1
let g:syntastic_c_no_include_search = 1
let g:syntastic_python_python_exec = 'python3'

let g:syntastic_c_checkers = ['gcc', 'make']

"set a global YouCompleteMe config file for syntax checking
let g:ycm_collect_identifiers_from_tags_files = 1
let g:ycm_global_ycm_extra_conf = '~/.vim/.ycm_extra_conf.py'
let g:ycm_register_as_syntastic_checker = 1
let g:ycm_confirm_extra_conf = 0
let g:ycm_path_to_python_interpreter = '/usr/local/bin/python'
let g:ycm_max_diagnostics_to_display = 10000


"use python3 for syntax checking
"""""keymappings for plugins"""""
nnoremap tt :TagbarOpenAutoClose<CR>


""""""""""""""""""""""""""""""""""""""""
"""""""""""end plugin config""""""""""""
""""""""""""""""""""""""""""""""""""""""
" REQUIRED. This makes vim invoke Latex-Suite when you open a tex file.
 filetype plugin on

 " IMPORTANT: win32 users will need to have 'shellslash' set so that latex
 " can be called correctly.
 set shellslash

 " IMPORTANT: grep will sometimes skip displaying the file name if you
 " search in a singe file. This will confuse Latex-Suite. Set your grep
 " program to always generate a file-name.
 set grepprg=grep\ -nH\ $*

 " OPTIONAL: This enables automatic indentation as you type.
 filetype indent on

 " OPTIONAL: Starting with Vim 7, the filetype of empty .tex files defaults to
 " 'plaintex' instead of 'tex', which results in vim-latex not being loaded.
 " The following changes the default filetype back to 'tex':
 let g:tex_flavor='latex'
