let mapleader = " "

" Line numbers
set number relativenumber

" Colors
colorscheme monokai-bold
syntax on

" Search options
set hlsearch
hi Search ctermbg=81
nnoremap <leader>q :noh<CR>

" Chaning .swp, .bak, and undo location
set directory^=$HOME/.vim/swp//
set backupdir^=$HOME/.vim/bak//
set undodir^=$HOME/.vim/undo//
set undofile

" Remove trailing whitespace
autocmd BufWritePre * :%s/\s\+$//e

" Tab management
set softtabstop=4 shiftwidth=4
set expandtab
let g:indentLine_char_list = ['|', '¦', '┆', '┊']
retab

" Better word wrapping to prevent words from being split in the middle
set linebreak

" Weather
map <F2> :!weather <CR>

" Add line at letter 80 for pep8 compliance
set colorcolumn=80
highlight ColorColumn ctermbg=232

" Python stuffz
" For anything other then WSL use 3.8 or 3.7
augroup pythonStuffz
    au BufEnter *.py38 map <F7> <esc>:w\|!python38.exe "%"<CR>
    au BufEnter *.py37 map <F7> <esc>:w\|!python37.exe "%"<CR>
    au BufEnter *.py36 map <F7> <esc>:w\|!python36.exe "%"<CR>
    au BufEnter *.py35 map <F7> <esc>:w\|!python35.exe "%"<CR>
    " Default python editor
    au BufEnter *.py map <F7> <esc>:w\|!python3.8.8 "%"<CR>
augroup END

augroup filetypePython
    au BufNewFile,BufRead *.py38 set filetype=python
    au BufNewFile,BufRead *.py37 set filetype=python
    au BufNewFile,BufRead *.py36 set filetype=python
    au BufNewFile,BufRead *.py35 set filetype=python
augroup END

"Which window is selected
nnoremap <leader>h :wincmd h<CR>
nnoremap <leader>j :wincmd j<CR>
nnoremap <leader>k :wincmd k<CR>
nnoremap <leader>l :wincmd l<CR>

" Resizing windows (Leader + ctrl + yuio)
nnoremap <leader><C-u> :resize -2<CR>
nnoremap <leader><C-i> :resize +2<CR>
nnoremap <leader><C-y> :vertical resize -2<CR>
nnoremap <leader><C-o> :vertical resize +2<CR>

"File explorer
nnoremap <leader>pv :wincmd v<bar> :Ex <bar> :vertical resize 40<CR>

" Enabling spellcheck
nnoremap <leader>c :set spell<CR>

" Yank line
nnoremap <leader>y ^<C-v>$y

"Split window
nnoremap <F3> :wincmd v<CR>
nnoremap <F4> :split<CR>

" Commenting and uncommenting
nnoremap <leader>w ^<S-i># <Esc><Esc>h
nnoremap <leader>s ^xx
        "Comment and move
        nnoremap <leader>[ ^<S-i># <Esc><Esc>hk
        nnoremap <leader>] ^xk
        nnoremap <leader>; ^<S-i># <Esc><Esc>hj
        nnoremap <leader>' ^xj

" Quickly insert an empty new line without entering insert mode
nnoremap <Leader>o o<Esc>
nnoremap <Leader>O O<Esc>

" Unmapping ex mode
nnoremap Q <nop>

" Status line settings
set statusline=
set statusline+=%#PmenuSel#
set statusline+=\ %M
set statusline+=\ %r
set statusline+=\ %F
set statusline+=%= " Right side settings
set statusline+=\ %l:%L
set statusline+=\ %p%%
set laststatus=2  " Enable status line for all files

" See invisible characters
set list listchars=tab:>\ ,trail:+,eol:$

" Get current song (Space + F2)
map <leader><F2> :!deadbeef-vs --nowplaying "\%a - \%t"<CR>

set visualbell
set title
