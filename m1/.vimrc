syntax on " enable syntax colouring
colorscheme elflord " I like this one
set number "enable row numbers
set smartcase

"enable the dang mouse
set mouse=v

"disable arrow keys to break bad habits
noremap <Up> <Nop>
noremap <Down> <Nop>
noremap <Left> <Nop>
noremap <Right> <Nop>

"fix backspace behaviour becaus some bad habits are ok
set backspace=indent,eol,start
"fix clipboard things
set clipboard=unnamed
"I would like tabs to be 4 wide, but I also want them to be tabs
set tabstop=4
set shiftwidth=4
set expandtab
"fast scrolling
set ttyfast
"highlight matching brackets
set matchpairs+=<:>
"highlight matching search patterns
set hlsearch
"enable incremental search
set incsearch
"Include matching uppercase words with lowercase search term
set ignorecase
"Include only uppercase words with uppercase search term
set smartcase
"ctags
set tags=.tags;/

function SetPythonAutocmdOptions()
    set tabstop=8
    set expandtab
    set shiftwidth=4
    set softtabstop=4
endfunction

