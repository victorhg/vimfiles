" Based on @mislav post http://mislav.uniqpath.com/2011/12/vim-revisited/
set nocompatible                " choose no compatibility with legacy vi
syntax enable
set encoding=utf-8
set showcmd														" display incomplete commands
filetype plugin indent on							" load file type plugins + indentation

"" Whitespace
set nowrap														" don't wrap lines
set tabstop=2 shiftwidth=2						" a tab is two spaces (or set this to 4)
set expandtab													" use spaces, not tabs (optional)
set backspace=indent,eol,start				" backspace through everything in insert mode

"" Searching
set hlsearch													" highlight matches
set incsearch													" incremental searching
set ignorecase												" searches are case insensitive...
set smartcase													" ... unless they contain at least one capital letter

" My customizations
set ls=2															" always show status bar
set number														" show line numbers
set cursorline												" display a marker on current line
colorscheme railscasts								" set colorscheme

set wildignore+=*.o,*.obj,.git,*.class									" ignore files 
set completeopt=menuone,longest				" simple autocomplete for anything
set wildmode=list:longest,full				" autocomplete for paths and files

set hidden														" change buffers without warnings even when there are unsaved changes

set backupdir=/tmp										" directory used to save backup files
set directory=/tmp										" directory used to save swap files

set t_Co=256													" forces terminal to use 256 colors
set gfn=Monospace\ 13									" forces gVim to use this font

call pathogen#infect()								" initializes pathogen to manage plugins

" NERDTree
silent! nmap <silent> <Leader>p :NERDTreeToggle<CR>			" map nerdtree
let NERDTreeChDirMode=1								" change currentDir to one related to the one opened by nerdtree

"Command-T configuration                                                                                                                                  
let g:CommandTMaxHeight=10
let g:CommandTMatchWindowAtTop=1
">> nnoremap <leader>t :CommandT<CR>  "map to CommandT TextMate style finder 


""""STATUS LINE
function! HighlightSearch()
  if &hls
    return 'H'
  else
    return ''
  endif
endfunction

" Customizing statusline
set statusline=
set statusline+=%7*\[%n]                                  "buffernr
set statusline+=%1*\ %<%F\                                "File+path
set statusline+=%2*\ %y\                                  "FileType
set statusline+=%3*\ %{''.(&fenc!=''?&fenc:&enc).''}      "Encoding
set statusline+=%3*\ %{(&bomb?\",BOM\":\"\")}\            "Encoding2
set statusline+=%5*\ %{&spelllang}\%{HighlightSearch()}\  "Spellanguage & Highlight on?
set statusline+=%8*\ %=\ row:%l/%L\ (%03p%%)\             "Rownumber/total (%)
set statusline+=%9*\ col:%03c\                            "Colnr
set statusline+=%0*\ \ %m%r%w\ %P\ \                      "Modified? Readonly? Top/bot.
" Colors
hi User1 guifg=#ffdad8  guibg=#880c0e
hi User2 guifg=#000000  guibg=#F4905C
hi User3 guifg=#292b00  guibg=#f4f597
hi User4 guifg=#112605  guibg=#aefe7B
hi User5 guifg=#051d00  guibg=#7dcc7d
hi User7 guifg=#ffffff  guibg=#880c0e gui=bold
hi User8 guifg=#ffffff  guibg=#5b7fbb
hi User9 guifg=#ffffff  guibg=#810085
hi User0 guifg=#ffffff  guibg=#094afe
