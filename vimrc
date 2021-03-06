﻿"LastModified: 2016-08-14 11:28:00

source ~/.vim/bundles.vim

" encoding dectection
set fileencodings=utf-8,gb2312,gb18030,gbk,ucs-bom,cp936,latin1
set termencoding=utf-8
set encoding=utf-8

" enable filetype dectection and ft specific plugin/indent
filetype plugin indent on

" enable syntax hightlight and completion
syntax on


" highlight current line
"au WinLeave * set nocursorline nocursorcolumn
"au WinEnter * set cursorline cursorcolumn
"set cursorline cursorcolumn

"search 
set incsearch
set ignorecase
set smartcase

"editor settings
set history=1000
set nocompatible
" disable folding"
set nofoldenable 

" prompt when existing from an unsaved file
"set confirm 

" More powerful backspacing
set backspace=indent,eol,start

" Explicitly tell vim that the terminal has 256 colors "
"set t_Co=256


"set mouse=a

"editor config
set report=0
set number
"set nowrap
set scrolloff=5
set showmatch " show matching bracket (briefly jump)
set matchtime=2  " show matching bracket for 0.2 seconds

set showcmd
set title
set laststatus=1

set nobackup
set ruler
set showmode
set nowrapscan
set hlsearch
set viminfo='20,"10,h

" Default Indentation
set autoindent
set smartindent     " indent when
set tabstop=4
set softtabstop=4
set shiftwidth=4
set expandtab
set cindent

autocmd FileType python,javascript setlocal tabstop=4 shiftwidth=4 softtabstop=4 textwidth=240

colo ron
set t_ti= t_te=

"Vim UI
colorscheme darkblue

map <F3> :Tlist<CR>
map <F4> :NERDTreeToggle<CR>
map <F5> :call Run()<CR>
map <F6> \cc
map <F7> \ci
map <F10> :call Search_Word()<CR>
map <F11> :nohlsearch<CR>

autocmd FileType c,cpp set formatoptions=croql cindent comments=sr:/*,mb:*,el:*/,://
au BufRead,BufNewFile *.go set filetype=go 


" au! QuickFixCmdPre *.[ch] call Search_Word() 
func Search_Word() 
  let w = expand("<cword>")             " 在当前光标位置抓词 
  exe "grep " w " *.cpp *.h" 
  exe 'copen' 
endfun 

func! Run()
    exec "w"
    if &filetype == "php"
        exec "!php %"
    elseif &filetype == "python"
        exec "!python2.7 %"
    elseif &filetype == "go"
        exec "!go run %"
    elseif &filetype == "sh"
        exec "! ./%"
    elseif &filetype == 'cpp'
        exec "!g++ % -o %<"
        exec "! ./%<"
    elseif &filetype == 'c'
        exec "!gcc % -o %<"
        exec "! ./%<"
    endif
endfunction

autocmd BufWritePre,FileWritePre *.py   ks|call LastModified()|'s
autocmd BufWritePre,FileWritePre .vimrc  ks|call LastModified()|'s


fun LastModified()
    if line("$") > 10
        let l = 10
    else
        let l = line("$")
    endif

    exe "1,".l. "s/[L]ast modified: .*/Last modified:  ".
      \ strftime("%F %T") . "/e"

endfun
 
autocmd BufNewFile *.py call SetPyComment() 
fun SetPyComment()
    call append(0, "#coding:utf8" )
    call append(1, "")
    call append(2, "\"\"\"")
    call append(3, "Author:    funnylin@tencent.com")
    call append(4, "FileName:  ".expand("%:t"))
    call append(5, "Last modified: <date item>")
    call append(6, "\"\"\"")
endfun

fun SetJsComment()
    call append(0, "#coding:utf8" )
    call append(1, "")
    call append(2, "\"\"\"")
    call append(3, "Author:    funnylin@tencent.com")
    call append(4, "FileName:  ".expand("%:t"))
    call append(5, "Last modified: <date item>")
    call append(6, "\"\"\"")
endfun


let Tlist_Auto_Open=0
let Tlist_Ctags_Cmd='/usr/bin/ctags'
let Tlist_Show_One_File = 1
let Tlist_Exit_OnlyWindow = 1


"easier navigation between split windows
nnoremap <c-j> <c-w>j
nnoremap <c-k> <c-w>k
nnoremap <c-h> <c-w>h
nnoremap <c-l> <c-w>l


" Neosnippet key-mappings.
imap <C-k>     <Plug>(neosnippet_expand_or_jump)
smap <C-k>     <Plug>(neosnippet_expand_or_jump)
xmap <C-k>     <Plug>(neosnippet_expand_target)


" SuperTab like snippets behavior.
"imap <expr><TAB>
" \ pumvisible() ? "\<C-n>" :
" \ neosnippet#expandable_or_jumpable() ?
" \    "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"
smap <expr><TAB> neosnippet#expandable_or_jumpable() ?
\ "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"

" For conceal markers.
if has('conceal')
  set conceallevel=2 concealcursor=niv
endif


" Enable snipMate compatibility feature.
let g:neosnippet#enable_snipmate_compatibility = 1

" Tell Neosnippet about the other snippets
let g:neosnippet#snippets_directory='~/.vim/bundle/vim-snippets/snippets'

au FileType python let b:delimitMate_nesting_quotes = ['"']

