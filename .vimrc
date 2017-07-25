" Automatic reloading of .vimrc
autocmd! bufwritepost .vimrc source %
syntax on
filetype plugin indent on
" vim currently recognises md as modula2 files
autocmd BufNewFile,BufRead *.md set filetype=markdown
" show existing tab with 4 spaces
set tabstop=4
" set indenting for 4 spaces
set shiftwidth=4
" on pressing tab, insert 4 spaces
set expandtab
set backspace=2
au BufNewFile,BufRead *.py
    \ set shiftwidth=4 | 
    \ set textwidth=99 | 
    \ set expandtab | 
    \ set autoindent |
    \ set fileformat=unix |
    \ set softtabstop=4

" map leader key to ,
let mapleader = ","
" better copy paste
set pastetoggle=<F2>
set relativenumber
set number
function! NumberToggle()
  if(&relativenumber == 1)
    set number
  else
    set relativenumber
  endif
endfunc
nnoremap <C-n> :call NumberToggle()<cr>



"---------- Plug-in manager config-------------
" Dein.vim
let s:dein_dir = expand('~/.cache/dein')
let s:dein_repo_dir = s:dein_dir . '/repos/github.com/Shougo/dein.vim'

if &runtimepath !~# '/dein.vim'
    if !isdirectory(s:dein_repo_dir)
        execute '!git clone https://github.com/Shougo/dein.vim' s:dein_repo_dir
    endif
    execute 'set runtimepath^=' . fnamemodify(s:dein_repo_dir, ':p')
endif

call dein#begin(expand('~/.vim/dein'))
"" add desired plugin here
call dein#add('scrooloose/nerdtree')
call dein#add('easymotion/vim-easymotion')
call dein#add('Shougo/neosnippet')

call dein#end()
if dein#check_install()
    call dein#install()
endif

"--------------Plugin manager end---------------
filetype plugin indent on
" For setting in python files

" plugins
nmap <leader>nt :NERDTree<cr>


" neosnippet
" use NeoSnippetEdit for personal snippets
let g:neosnippet#snippets_directory='~/.vim/vim-snippets/snippets'
let g:neosnippet#disable_runtime_snippets = {
\   '_' : 1,
\ }
" neosnippet plugin key-mappings.
imap <C-k>     <Plug>(neosnippet_expand_or_jump)
