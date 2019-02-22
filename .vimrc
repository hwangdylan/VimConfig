"let g:ale_sign_column_always = 1
"ensures that there is no lag. Without it, there is a lot of lag.  
"let g:ale_lint_on_text_changed = 0
"let g:ale_pattern_options = {'\.tex$': {'ale_enabled': 0}}
"let g:ale_set_signs='1'
"let g:ale_fixers = {'python': ['yapf']}
"highlight clear ALEWarningSign
"let g:ale_set_highlights = 0

set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 0
let g:syntastic_check_on_wq = 1

let g:syntastic_quiet_messages = {
    \ "!level":  "errors",
    \ "type":    "style", 
    \ "file:p": ['\.tex$'], 
    \}



" Disable overfull/underfull \hbox and all package warnings
let g:vimtex_quickfix_latexlog = {
      \ 'overfull' : 0,
      \ 'underfull' : 0,
      \ 'packages' : {
      \   'default' : 0,
      \ },
      \}
let g:tex_flavor='latex'
"let g:vimtex_fold_manual=1
"let g:vimtex_fold_enabled=1
let g:vimtex_view_method = 'skim'
let g:vimtex_quickfix_mode=2

"disables the insert mode mapping
let g:vimtex_imaps_enabled=0
"to make switching between lines faster. 
let g:matchup_matchparen_deferred = 1

"fixed the problem of autoindenting back in latex when typing ( 
let vimtex_indent_enabled=0 

"ultisnips stuff
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<c-j>"
let g:UltiSnipsJumpBackwardTrigger="<c-k>"
" If you want :UltiSnipsEdit to split your window.
let g:UltiSnipsEditSplit="vertical"

let g:UltiSnipsSnippetsDir='/Users/dylanhwang/.vim/ultisnips'
let g:UltiSnipsSnippetDirectories=["ultisnips"]

"Airline stuff
let g:airline_theme='solarized'
let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts = 1

"NERDTree stuff
autocmd VimEnter * NERDTree
"so when you open a file, it will not automatically start in NERDTree window
autocmd VimEnter * wincmd p
"vim will automatically close if only left window is open 
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
map <C-n> :NERDTreeToggle<CR>
let NERDTreeWinSize = 20
"This is so NERDTree opens automatically when vim starts up on opening directory (vim .)
"autocmd StdinReadPre * let s:std_in=1
"autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | endif

call plug#begin('~/.vim/plugged')

Plug 'lervag/vimtex'
"Plug 'w0rp/ale'
Plug 'SirVer/ultisnips'
"Plug 'honza/vim-snippets'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'https://github.com/scrooloose/nerdtree.git'
"Plug 'https://github.com/Townk/vim-autoclose'
" Plug 'https://github.com/vim-syntastic/syntastic'
Plug 'https://github.com/tpope/vim-commentary'

call plug#end()



"for CtrlP
set runtimepath^=~/.vim/bundle/ctrlp.vim
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'
set wildignore+=*/.git/*,*/*.aux


syntax  on
set  number 

imap jj <Esc>
"supposed to help with always deleting the last word when using <C-W> 
set backspace=indent,eol,start

filetype plugin indent  on
" show existing tab with 4 space width
set tabstop=4
"when indenting with '>', use 4 space width
set shiftwidth=4
"On pressing tab, insert 4 spaces
set expandtab

"for spell check 
set spell
"hi clear SpellBad
hi SpellBad cterm=underline 
"ctermfg=Lightred
"for indentation
set breakindent
set showbreak=..

"using shift-tab to indent backwards
inoremap <S-Tab> <C-d>

"automatically hard-wrap text (inserts a new line into text file)
set textwidth=95
set wrapmargin=0
set formatoptions+=t

"enables scrolling with mouse wheel in tmux vim 
"set mouse=a
"
"let macvim_skip_colorscheme = 1
set background=dark
colorscheme gruvbox
"set nosmartindent
set viminfo='100,f1

"ignores case in search 
set ignorecase 
"will be case sensitive if search contains uppercase letter 
set smartcase 

"for buffers
set hid 

" To open a new empty buffer
" This replaces :tabnew which I used to bind to this mapping
nmap <leader>T :enew<cr>

" Move to the next buffer
nmap <leader>k :bnext<CR>

" Move to the previous buffer
nmap <leader>j :bprevious<CR>

" Close the current buffer and move to the previous one
" This replicates the idea of closing a tab
nmap <leader>bq :bp <BAR> bd #<CR>

" Show all open buffers and their status
nmap <leader>bl :ls<CR>

"set foldmethod=syntax
"set nofoldenable

"open vimtex table of contents with <leader> t
nmap <leader>t :VimtexTocOpen<Return>

"moves cursor one over without leaving insert mode
inoremap <c-l> <esc>%%a

nnoremap <leader>q :bp<cr>:bd #<cr>

"after 'updatetime' milliseocnd the user hasn't pressed a key, then it will update. 
autocmd CursorHold * update

"for some reaosn iterm interprets back
"ption deleet as escape delete. so this will map to delete word.  
imap <Esc><BS> <C-w>
