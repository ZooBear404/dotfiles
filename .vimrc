syntax on
filetype on
" set expandtab
set bs=2
set tabstop=4
set shiftwidth=4
set autoindent
set smartindent
set smartcase
set ignorecase
set modeline
set nocompatible
set encoding=utf-8
set hlsearch
set history=700
set t_Co=256
set termguicolors
set background=dark
set tabpagemax=1000
set ruler
set nojoinspaces
set shiftround
set nonumber
set number

set nolbr
set tw=0


let mapleader = " "


" Visual mode pressing * or # searches for the current selection
" Super useful! From an idea by Michael Naumann
vnoremap <silent> * :call VisualSelection('f')<CR>
vnoremap <silent> # :call VisualSelection('b')<CR>


" Disable highlight when <leader><cr> is pressed
map <silent> <leader><cr> :noh<cr>

" Smart way to move between windows
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l

" I accidentally hit F1 all the time
imap <F1> <Esc>

" nice try, Ex mode
map Q <Nop>
" who uses semicolon anyway?
map ; :

	" ==== custom macros ====
	" Delete a function call. example:  floor(int(var))
	"         press when your cursor is       ^        results in:
	"                                   floor(var)
	map <C-H> ebdw%x<C-O>x
nnoremap gp `[v`]

" Toggle paste mode on and off
map <leader>v :setlocal paste!<cr>

" run ctags in current directory
filetype plugin on
map <C-F12> :!ctags -R -I --c++-kinds=+p --fields=+iaS --extra=+q .<CR>

" Tagbar shortcut
nmap <Leader>tb :TagbarToggle<CR>

let g:zig_fmt_autosave = 1

"" Plugins 
call plug#begin()

Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'preservim/tagbar'
Plug 'liuchengxu/vim-which-key', { 'on': ['WhichKey', 'WhichKey!'] }
Plug 'dense-analysis/ale'
Plug 'vim-airline/vim-airline'
Plug 'sheerun/vim-polyglot'
Plug 'wakatime/vim-wakatime'

call plug#end()

"" plugin config

" tagbar
nmap <F8> :TagbarToggle<CR>
" end tagbar
" ale

" end ale
" fzf

" Insert mode completion
imap <c-x><c-k> <plug>(fzf-complete-word)
imap <c-x><c-f> <plug>(fzf-complete-path)
imap <c-x><c-l> <plug>(fzf-complete-line)

" Path completion with custom source command
inoremap <expr> <c-x><c-f> fzf#vim#complete#path('fd')
inoremap <expr> <c-x><c-f> fzf#vim#complete#path('rg --files')

" Word completion with custom spec with popup layout option
inoremap <expr> <c-x><c-k> fzf#vim#complete#word({'window': { 'width': 0.2, 'height': 0.9, 'xoffset': 1 }})

" Replace the default dictionary completion with fzf-based fuzzy completion
inoremap <expr> <c-x><c-k> fzf#vim#complete('cat /usr/share/dict/words')

" my fzf shortcuts
nmap <Leader>fb :Buffers<CR>
nmap <Leader>ff :Files<CR>
nmap <Leader>fgf :GFiles<CR>
nmap <Leader>fc :Colors<CR>
nmap <Leader>frg :Rg<CR>
nmap <Leader>frG :RG<CR>
nmap <Leader>fl :Lines<CR>
nmap <Leader>fbl :BLines<CR>
nmap <Leader>ft :Tags<CR>
nmap <Leader>fbt :BTags<CR>
nmap <Leader>fch :Changes<CR>
nmap <Leader>fm :Marks<CR>
nmap <Leader>fj :Jumps<CR>
nmap <Leader>fw :Windows<CR>
nmap <Leader>fgc :Commits<CR>
nmap <Leader>fgbc :BCommits<CR>
nmap <Leader>fcm :Commands<CR>
nmap <Leader>fht :Helptags<CR>
nmap <Leader>fft :FileTypes<CR>



function! s:fzf_statusline()
  " Override statusline as you like
  highlight fzf1 ctermfg=161 ctermbg=251
  highlight fzf2 ctermfg=23 ctermbg=251
  highlight fzf3 ctermfg=237 ctermbg=251
  setlocal statusline=%#fzf1#\ >\ %#fzf2#fz%#fzf3#f
endfunction

autocmd! User FzfStatusLine call <SID>fzf_statusline()

" end fzf
" which key 
nnoremap <silent> <leader> :WhichKey '<Space>'<CR>
" end which key

"" End Plugins
