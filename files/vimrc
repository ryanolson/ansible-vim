set nocompatible              " be iMproved, required
filetype off                  " required

" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'VundleVim/Vundle.vim'
Plugin 'altercation/vim-colors-solarized'
Plugin 'ervandew/supertab'
Plugin 'valloric/youcompleteme'
Plugin 'SirVer/ultisnips'
Plugin 'honza/vim-snippets'
Plugin 'ekalinin/Dockerfile.vim'
Plugin 'tpope/vim-fugitive'
Plugin 'scrooloose/syntastic'
Plugin 'glench/vim-jinja2-syntax'
Plugin 'chase/vim-ansible-yaml'
Plugin 'mitsuhiko/vim-python-combined'
call vundle#end()            " required
filetype plugin indent on    " required

let g:solarized_termcolors=256

" YouCompleteMe and UltiSnips compatibility, with the helper of supertab
" (via http://stackoverflow.com/a/22253548/1626737)
let g:SuperTabDefaultCompletionType    = '<C-n>'
let g:SuperTabCrMapping                = 0
let g:UltiSnipsListSnippets            = '<c-l>'
let g:UltiSnipsExpandTrigger           = '<tab>'
let g:UltiSnipsJumpForwardTrigger      = '<tab>'
let g:UltiSnipsJumpBackwardTrigger     = '<s-tab>'
let g:UltiSnipsNewDir                  = '~/.vim/UltiSnips'
let g:UltiSnipsEditSplit               = 'vertical'
let g:ycm_key_list_select_completion   = ['<C-j>', '<c-n>', '<Down>']
let g:ycm_key_list_previous_completion = ['<C-k>', '<c-p>', '<Up>']

let mapleader=" "

set runtimepath+=~/.vim

syntax on
syntax enable
set number
set encoding=utf-8
set background=dark
colorscheme solarized

set wildmenu              " Turn on menu-based tab completion for commands
set autoread
set splitbelow splitright " More intuitive than default split behavior
set noswapfile            " Not much need for swapfiles in the 21st century
set nojoinspaces          " Use only one space after period when joining lines

set shiftwidth=4          " Spaces to use for each indent step (>>, <<, etc.)
set shiftround            " Round indent to multiple of shiftwidth
set softtabstop=4         " Spaces to use for <tab> and <BS> editing operations
set expandtab             " Use appropriate # of spaces for <tab> in insert mode
set smarttab              " Be smart when using tabs

set autoindent            " Copy indent from current line when starting new line
set smartindent           " Who want dumb intenting
set copyindent            " Copy indent style
set backspace=2
set bs=indent,eol,start   " Backspace over autoindent, EOL, and start of insert
set linebreak             " Soft-wrap at word instead of character

set ignorecase            " Case-insensitive search
set smartcase             " Case-sensitive search if query contains uppercase

set showmatch             " Briefly jump to matching bracket when inserted
set visualbell t_vb=      " Turn off bell: most annoying default ever created

:imap jw <Esc>

" python support
" --------------
"  don't highlight exceptions and builtins. I love to override them in local
"  scopes and it sucks ass if it's highlighted then. And for exceptions I
"  don't really want to have different colors for my own exceptions ;-)
autocmd FileType python setlocal expandtab shiftwidth=4 tabstop=8
\ formatoptions=croqj softtabstop=4 textwidth=74 comments=:#\:,:#
let python_highlight_all=1
let python_highlight_exceptions=0
let python_highlight_builtins=0
let python_slow_sync=1

"let g:syntastic_python_checkers=['flake8', 'python']
let g:syntastic_python_checkers=[]

" Don't warn on
"   E121 continuation line indentation is not a multiple of four
"   E128 continuation line under-indented for visual indent
"   E711 comparison to None should be 'if cond is not None:'
"   E301 expected 1 blank line, found 0
"   E261 at least two spaces before inline comment
"   E241 multiple spaces after ':'
"   E124 closing bracket does not match visual indentation
"   E126 continuation line over-indented for hanging indent
"   E721 do not compare types, use 'isinstance()'
let g:syntastic_python_flake8_args='--ignore=E121,E128,E711,E301,E261,E241,E124,E126,E721
    \ --max-line-length=84'

" ruby support
" ------------
autocmd FileType ruby setlocal expandtab shiftwidth=2 tabstop=2 softtabstop=2
autocmd BufNewFile,BufRead Podfile setlocal ft=ruby

" go support
" ----------
autocmd BufNewFile,BufRead *.go setlocal ft=go
autocmd FileType go setlocal shiftwidth=4 tabstop=4 softtabstop=4

" php support
" -----------
autocmd FileType php setlocal shiftwidth=4 tabstop=8 softtabstop=4 expandtab

" template language support (SGML / XML too)
" ------------------------------------------
" and disable that stupid html rendering (like making stuff bold etc)
autocmd FileType xml,html,htmljinja,htmldjango setlocal expandtab shiftwidth=2 tabstop=2 softtabstop=2
autocmd FileType html,htmljinja,htmldjango imap <buffer> <c-e> <Plug>SparkupExecute
autocmd FileType html,htmljinja,htmldjango imap <buffer> <c-l> <Plug>SparkupNext
autocmd FileType html setlocal commentstring=<!--\ %s\ -->
autocmd FileType htmljinja setlocal commentstring={#\ %s\ #}
let html_no_rendering=1
let g:syntastic_html_checkers = []

" CSS
" ---
autocmd FileType css setlocal expandtab shiftwidth=4 tabstop=4 softtabstop=4
autocmd FileType css setlocal commentstring=/*\ %s\ */
autocmd FileType css noremap <buffer> <leader>r :call CSSBeautify()<cr>

" Less
" ----
autocmd FileType less setlocal expandtab shiftwidth=2 tabstop=8 softtabstop=2

" Sass
" ----
autocmd FileType scss setlocal expandtab shiftwidth=2 tabstop=8 softtabstop=2

" Java
" ----
autocmd FileType java setlocal shiftwidth=2 tabstop=8 softtabstop=2 expandtab
autocmd FileType java setlocal commentstring=//\ %s

" rst
" ---
autocmd BufNewFile,BufRead *.txt setlocal ft=rst
autocmd FileType rst setlocal expandtab shiftwidth=4 tabstop=4 softtabstop=4
\ formatoptions+=nqt textwidth=74

" C#
autocmd FileType cs setlocal tabstop=8 softtabstop=4 shiftwidth=4 expandtab
autocmd FileType cs setlocal commentstring=//\ %s

" C/Obj-C/C++
autocmd FileType c setlocal tabstop=4 softtabstop=4 shiftwidth=4 expandtab
autocmd FileType cpp setlocal tabstop=4 softtabstop=4 shiftwidth=4 expandtab
autocmd FileType objc setlocal tabstop=4 softtabstop=4 shiftwidth=4 expandtab
autocmd FileType c setlocal commentstring=/*\ %s\ */
autocmd FileType cpp,objc setlocal commentstring=//\ %s
let c_no_curly_error=1
let g:syntastic_cpp_include_dirs = ['include', '../include']
let g:syntastic_cpp_compiler = 'clang++'
let g:syntastic_c_include_dirs = ['include', '../include']
let g:syntastic_c_compiler = 'clang'

" Octave/Matlab
autocmd FileType matlab setlocal tabstop=8 softtabstop=2 shiftwidth=2 expandtab

" vim
" ---
autocmd FileType vim setlocal expandtab shiftwidth=2 tabstop=8 softtabstop=2

" Javascript
" ----------
autocmd FileType javascript setlocal expandtab shiftwidth=2 tabstop=2 softtabstop=2
autocmd FileType javascript setlocal commentstring=//\ %s
autocmd FileType javascript noremap <buffer> <leader>r :call JsBeautify()<cr>
autocmd FileType javascript let b:javascript_fold = 0
let javascript_enable_domhtmlcss=1
let g:syntastic_javascript_checkers = ['jshint'] 
let g:syntastic_javascript_jshint_args='--config ~/.vim/extern-cfg/jshint.json'

" JSON
" ----
autocmd FileType json setlocal expandtab shiftwidth=2 tabstop=2 softtabstop=2

" Typescript
" ----------
let g:syntastic_typescript_checkers = []

" CoffeeScript
" ------------
autocmd FileType coffee setlocal expandtab shiftwidth=2 tabstop=2 softtabstop=2

" cmake support
" -------------
autocmd BufNewFile,BufRead CMakeLists.txt setlocal ft=cmake

" YAML support
" ------------
autocmd FileType yaml setlocal expandtab shiftwidth=2 tabstop=8 softtabstop=2
autocmd BufNewFile,BufRead *.sls setlocal ft=yaml

" Lua support
" -----------
autocmd FileType lua setlocal shiftwidth=2 tabstop=2 softtabstop=2

" Docker/Jinja
" ------------
autocmd BufRead,BufNewFile Dockerfile.j2 set ft=Dockerfile.jinja
