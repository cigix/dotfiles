" use Vim options instead of Vi
set nocompatible

" ###   EDITION   ###
" allow backspacing on...
set backspace=indent,eol,start
" indent automatically on carriage return insertion (overridden by cindent)
" set autoindent
" indent like in C (overridden by filetype indent on)
" set cindent
" indent automatically as defined in vim filetypes' formats
filetype indent on
filetype plugin indent on
" always keep 2 lines of context around the cursor
set scrolloff=2
" allow space, backspace, left and right to wrap around lines
set whichwrap=b,s,<,>,[,]
" allow Omni completion
filetype plugin on
" automatically set fold markers based on syntax
set foldmethod=syntax
" automatically opens all folds
set foldlevelstart=99
" locations to look for tags files
set tags=tags,../tags,./*/tags
" because that's quite handy
set ignorecase
" remapping for j, k, Up and Down to move only 1 character, even on wrapped lines, even in insert mode
map k gk
map <Up> gk
map j gj
map <Down> gj
imap <silent> <Up> <C-o>gk
imap <silent> <Down> <C-o>gj
" save the file as a superuser
command W w !sudo tee % >/dev/null
" because that happens way too much
imap :w<Enter> <Esc>:w<Cr>
imap :wq<Enter> <Esc>:wq<Cr>
imap :wa<Enter> <Esc>:wa<Cr>
imap :wqa<Enter> <Esc>:wqa<Cr>
map Q <Nop>
" set everything in K&R
command KR :g/^\s*{/normal kJ
" set everything in Allman
command Allman :g/).*{\s*$/execute 's/\S\s*{\s*$/\r{/' | normal == \
" mappings to remove trailing white spaces and write with F5
map <F5> :%s/\s\+$//e<CR>:w<CR>
imap <F5> <Esc><F5>i
" virtual block selection
set virtualedit=block

" ###   LAYOUT   ###
" always display cursor position in lower right hand corner
set ruler
" format for ruler : epoch, date, time, line, column(, virtual column), position
set rulerformat=%50(%{strftime('%s\ \ %a\ %e\ %b\ \ %k:%M')}\ %5l,%-6(%c%V%)\ %P%)
" show partially typed command in lower right hand corner
set showcmd
" activate colors and highlighting if gui permits it
if &t_Co > 1
  syntax enable
endif
if &t_Co > 2 || has("gui_running")
  syntax on
  set hlsearch
endif
" display line number left of each line
set number
" minimum height for a focused window
set winheight=5
" minimum height for a window
set winminheight=2
" always display a status line
set laststatus=2
" options regarding abbreviation, truncating, or prompting. all deactivated, only useful for autowrite
set shortmess=o
" higlight column 81 to not go over 80 columns
set colorcolumn=81

" ###   BEHAVIOR   ###
" file browser starts in the same directory as the currently edited file
set browsedir=buffer
" jumps to last read line on file load
autocmd BufReadPost *
      \ if line("'\"") > 1 && line("'\"") <= line("$") |
      \   exe "normal! g`\"" |
      \ endif
" automatically write files when losing focus
set autowriteall
" automatically reload file if it has been changed outside vim
set autoread

" ###   AUTOCOMMANDS   ###
" rules per filetype
au Filetype * set expandtab tabstop=2 shiftwidth=2 softtabstop=2
au Filetype make,automake set noexpandtab tabstop=8 shiftwidth=8 softtabstop=8
au Filetype python,sh set tabstop=4 shiftwidth=4 softtabstop=4
au Filetype c,cpp set tw=80 fdm=syntax com=s:/*,m:**,ex:*/ colorcolumn=81
au FileType php,javascript set ts=4 sw=4
au FileType tex set fdm=indent
au FileType gitcommit set tw=70
au FileType tiger set cindent
au Filetype mail set colorcolumn=73
" shortcut to insert matching curly brackets when edditing C/C++ files
au Filetype c,cpp inoremap {<Enter> <CR>{<CR>}<Esc>O
