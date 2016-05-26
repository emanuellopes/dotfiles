set nocompatible

"Pathogen, carregar plugins em ~/.vim/bundle
call pathogen#helptags()
call pathogen#infect()

syntax on
set encoding=utf-8
set hidden "esconder buffers em vez de os fechar
set tabstop=4 "1 tab sao 4 espacos
set backspace=indent,eol,start
set autoindent
filetype plugin indent on
set shiftwidth=4 "numero de espacos para o autoident
set number "mostrar sempre a linha
set showcmd "show current command on bottom
set hlsearch
set incsearch
set ignorecase
set smartcase
set smarttab
"modo paste
set pastetoggle=<F2>
"nao fazer backups
set nobackup
set noswapfile
" Auto complete HTML
filetype plugin on
set omnifunc=syntaxcomplete#Complete
autocmd FileType javascript set omnifunc=javascriptcomplete#CompleteJS

"--Keybindings
"close html tags on <//
inoremap <lt>// </<C-X><C-O>


" limpar buffer de procura
nmap <silent> º :nohlsearch<CR>

"usar w!! para gravar quando esqucer do sudo
cmap w!! w !sudo tee % >/dev/null

"VIM AIRLINE CONF
" Enable the list of buffers
let g:airline#extensions#tabline#enabled = 1
" Show just the filename
let g:airline#extensions#tabline#fnamemod = ':t'
" Enable powerline fonts
let g:airline_powerline_fonts = 1
" Always show bottomline
set laststatus=2

"Template Vars
let g:username = 'emanuelx'
let g:email = 'emanuel.lopes.pt@gmail.com'
let g:licence = 'GPL v3.0'

