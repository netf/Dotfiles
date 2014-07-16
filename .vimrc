set nocompatible


set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

syntax on
filetype off

Plugin 'gmarik/Vundle.vim' 
" UI
Plugin 'bling/vim-airline'
Plugin 'bling/vim-bufferline'
Plugin 'flazz/vim-colorschemes'
Plugin 'ujihisa/unite-colorscheme'


" Fuzzy search
Plugin 'Shougo/vimproc.vim'
Plugin 'Shougo/unite.vim'
Plugin 'thinca/vim-unite-history'
Plugin 'mileszs/ack.vim'
Plugin 'kien/ctrlp.vim'

" Code
Plugin 'MarcWeber/vim-addon-mw-utils'
Plugin 'tomtom/tlib_vim'
Plugin 'SirVer/ultisnips'
Plugin 'ervandew/supertab'
Plugin 'honza/vim-snippets'
Plugin 'vim-scripts/OmniCppComplete'
Plugin 'Valloric/YouCompleteMe'
Plugin 'klen/python-mode'

" File browsing
Plugin 'scrooloose/nerdtree'
Plugin 'Shougo/vimfiler.vim'
Plugin 'tpope/vim-vinegar'
Plugin 'majutsushi/tagbar'

" Syntax
Plugin 'kchmck/vim-coffee-script'
Plugin 'jnwhiteh/vim-golang'
Plugin 'groenewege/vim-less'
Plugin 'othree/html5.vim'
Plugin 'plasticboy/vim-markdown'
Plugin 'puppetlabs/puppet-syntax-vim'
Plugin 'vim-scripts/scons.vim'

" Git
Plugin 'tpope/vim-fugitive'
Plugin 'airblade/vim-gitgutter'
Plugin 'gregsexton/gitv'
Plugin 'junegunn/vim-github-dashboard'

" Misc
Plugin 'sjl/gundo.vim'
Plugin 'scrooloose/syntastic'
Plugin 'Yggdroot/indentLine'

Plugin 'vim-scripts/Align'
Plugin 'tpope/vim-surround'
Plugin 'gregsexton/MatchTag'
Plugin 'Lokaltog/vim-easymotion'
Plugin 'vim-scripts/TwitVim'

call vundle#end()


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => General
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
filetype plugin indent on " Enable filetype plugins

set history=700           " Sets how many lines of history VIM has to remember
set autoread              " Set to auto read when a file is changed from the outside

let mapleader = ","
let g:mapleader = ","

nmap ; :

" Fast saving
nmap <leader>w :w!<cr>

" Fast quitting 
nmap <leader>q :q<cr>
nmap <leader>x :qa!<cr>


" Fast run makefile
nnoremap <leader>m :silent make\|redraw!\|cc<CR>

" Fast Mode change
set timeoutlen=1000 ttimeoutlen=100

" Fast buffer alternation
noremap <Leader><Leader> <C-^>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => VIM user interface
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

set so=7                       " Set 7 lines to the cursor - when moving vertically using j/k
set wildmenu                   " Turn on the WiLd menu, better command completion
set wildignore=*.o,*~,*.pyc    " Ignore compiled files
set ruler                      " Always show current position
set cmdheight=1                " Height of the command bar
set hid                        " A buffer becomes hidden when it is abandoned
set backspace=eol,start,indent " Configure backspace so it acts as it should act
set whichwrap+=<,>,h,l
set ignorecase                 " Ignore case when searching
set smartcase                  " When searching try to be smart about cases
set hlsearch                   " Highlight search results
set incsearch                  " Makes search act like search in modern browsers
set lazyredraw                 " Don't redraw while executing macros (good performance config)
set magic                      " For regular expressions turn magic on
set showmatch                  " Show matching brackets when text indicator is over them
set mat=2                      " How many tenths of a second to blink when matching brackets
set fillchars+=vert:\          " Window split styling
set cursorline

autocmd WinLeave * setlocal nocursorline
autocmd WinEnter * setlocal cursorline

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Colors and Fonts
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

syntax enable            " Enable syntax highlighting
set background=dark      " Default dark background
colorscheme jellybeans    " molokai xoria256

set t_Co=256             " Enable 256 colours
set encoding=utf8        " Set utf8 as standard encoding and en_US as the standard language
set ffs=unix,dos,mac     " Use Unix as the standard file type
if &term =~ '256color'
  set t_ut=
endif

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Files, backups and undo
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set nobackup " Turn backup off, since most stuff is in SVN, git et.c anyway...
set nowb
set noswapfile

if exists('+undofile')
  set undofile
  set undodir=~/.vim/.cache/undo
endif

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Text, tab and indent related
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set expandtab     " Use spaces instead of tabs
set smarttab      " Be smart when using tabs ;)
set shiftwidth=2  " Setup default ts
set tabstop=2
set softtabstop=2
set lbr           " Linebreak on 500 characters
set tw=500
set ai            " Auto indent
set si            " Smart indent
set wrap          " Wrap lines
set mouse=nicr    " Remove ME
set mousehide
set number        " line numbers
set list
set listchars=tab:│\ ,trail:•,extends:❯,precedes:❮
set linebreak
let &showbreak='↪ '
set iskeyword-=_  " Word breaks around underscores

set scrolljump=5 "minimum number of lines to scroll
set ttyfast
set viewoptions=folds,options,cursor,unix,slash     "unix/windows compatibility




""""""""""""""""""""""""""""""
" => Visual mode related
""""""""""""""""""""""""""""""

" Retain visual selection after identing
vnoremap < <gv
vnoremap > >gv

" Smash escape
inoremap jk <Esc>
inoremap kj <Esc>

" Yank to Clipboard 
nnoremap <C-y> "+y
vnoremap <C-y> "+y

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Moving around, tabs, windows and buffers
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Treat long lines as break lines (useful when moving around in them)
map j gj
map k gk

" Home row jump to start and end of line
noremap H ^
noremap L $

" Map <Space> to / (search) and Ctrl-<Space> to ? (backwards search)
map <space> /
map <c-space> ?

" Disable highlight when <leader><cr> is pressed
map <silent> <leader><cr> :noh<cr>

" Smart way to move between windows
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l

" Unmap arrow keys
noremap <Up> <c-W>k
noremap <Down> <c-W>j
noremap <Left> :bprev <CR>
noremap <Right> :bnext<CR>

" close a buffer
nnoremap <Leader>k <C-w>c
nnoremap <silent><Leader>k :bd!<CR>

" Adjust viewports to the same size
map <Leader>= <C-w>=

" Specify the behavior when switching between buffers
try
  set switchbuf=useopen,usetab,newtab
  set stal=2
catch
endtry

" set viminfo^=% " Remember info about open buffers on close

""""""""""""""""""""""""""""""
" => Status line
""""""""""""""""""""""""""""""
set laststatus=2 " Always show the status line

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Editing mappings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Remap VIM 0 to first non-blank character
map 0 ^

autocmd BufWrite *.py :call DeleteTrailingWS()
autocmd BufWrite *.coffee :call DeleteTrailingWS()

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Spell checking
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Pressing ,ss will toggle and untoggle spell checking
map <leader>ss :setlocal spell!<cr>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Misc
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Remove the Windows ^M - when the encodings gets messed up
noremap <Leader>m mmHmt:%s/<C-V><cr>//ge<cr>'tzt'm

" TODO: Revise paste options
" Toggle paste mode on and off
map <leader>pp :setlocal paste!<cr>

" Paste toggles
nnoremap <F5> :set invpaste paste?<Enter>
imap <F5> <C-O><F5>
set pastetoggle=<F5> " Hit f5 before pasting into terminal

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Tagbar 
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
map <leader>t :TagbarToggle<CR>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Nerd Tree
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let NERDTreeIgnore=['\~$', '\.swp$', '\.git', '\.hg', '\.svn', '\.bzr']
:nmap ,e :NERDTreeToggle<CR>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => YCM
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:ycm_key_list_select_completion = ['<C-Tab>', '<Down>']
let g:ycm_key_list_previous_completion = ['<C-S-Tab>', '<Up>']
let g:SuperTabDefaultCompletionType = '<C-Tab>'

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => UtilSnips
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:snips_author = 'Piotr Wreczycki'
let g:snips_email = 'piotr@wreczycki.com'
let g:snips_github = 'https://github.com/netf'

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => CtrlP
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

highlight Pmenu ctermbg=238 gui=bold

let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'
let g:ctrlp_custom_ignore = '\.git$\|\.hg$\|\.svn$'
let g:ctrlp_working_path_mode = 'ra'  " search for nearest ancestor like .git, .hg, and the directory of the current file
let g:ctrlp_match_window_bottom = 1   " show the match window at the top of the screen
let g:ctrlp_max_height = 10     " maxiumum height of match window
let g:ctrlp_switch_buffer = 'et'    " jump to a file if it's open already
let g:ctrlp_use_caching = 1       " enable caching
let g:ctrlp_clear_cache_on_exit=0     " speed up by not removing clearing cache evertime
let g:ctrlp_show_hidden = 1       " show me dotfiles
let g:ctrlp_mruf_max = 250        " number of recently opened files


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Syntastic
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
nmap <silent><Leader>N :SyntasticCheck<CR>:Errors<CR>

let g:syntastic_python_pylint_exe = "pylint2"
let g:syntastic_mode_map = { 'mode': 'active',
            \ 'active_filetypes': [],
            \ 'passive_filetypes': ['python'] }

let g:syntastic_error_symbol='✗'
let g:syntastic_warning_symbol='⚠'
let g:syntastic_style_error_symbol  = '⚡'
let g:syntastic_style_warning_symbol  = '⚡'

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Airline
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:bufferline_echo=0
let g:airline_left_sep = '»'
let g:airline_left_sep = '▶'
let g:airline_right_sep = '«'
let g:airline_right_sep = '◀'

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Golang 
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
autocmd FileType go autocmd BufWritePre <buffer> Fmt

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Supertab + Omnicomplete 
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:SuperTabDefaultCompletionType = "context"
let g:clang_complete_copen = 1
let g:clang_snippets = 1
let g:clang_use_library = 1
map <leader>a :!ctags -R --sort=yes --c++-kinds=+p --fields=+iaS --extra=+q .<CR>
set omnifunc=syntaxcomplete#Complete " override built-in C omnicomplete with C++ OmniCppComplete plugin
let OmniCpp_GlobalScopeSearch   = 1
let OmniCpp_DisplayMode         = 1
let OmniCpp_ShowScopeInAbbr     = 0 "do not show namespace in pop-up
let OmniCpp_ShowPrototypeInAbbr = 1 "show prototype in pop-up
let OmniCpp_ShowAccess          = 1 "show access in pop-up
let OmniCpp_SelectFirstItem     = 1 "select first item in pop-up
set completeopt=menuone,menu,longest
let g:SuperTabDefaultCompletionType = "<C-X><C-O>"

autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
autocmd FileType ruby setlocal omnifunc=rubycomplete#Complete
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags



"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Gundo 
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:gundo_width = 60
let g:gundo_preview_height = 40
let g:gundo_right = 1
nnoremap <leader>u :GundoToggle<CR>


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Fugitive
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
nnoremap <Leader>gn :Unite output:echo\ system("git\ init")<CR>
nnoremap <Leader>ga :Git add %:p<CR><CR>
nnoremap <Leader>gs :Gstatus<CR>
nnoremap <Leader>gw :Gwrite<CR>
nnoremap <Leader>go :Gread<CR>
nnoremap <Leader>gR :Gremove<CR>
nnoremap <Leader>gm :Gmove<Space>
nnoremap <Leader>gc :Gcommit -a -v -q<CR>
nnoremap <Leader>gd :Gdiff<CR>
nnoremap <Leader>gb :Gblame<CR>
nnoremap <Leader>gB :Gbrowse<CR>
nnoremap <Leader>gp :Git! push<CR>
nnoremap <Leader>gP :Git! pull<CR>
nnoremap <Leader>gi :Git!<Space>
nnoremap <Leader>ge :Gedit<CR>
nnoremap <Leader>gE :Gedit<Space>
nnoremap <Leader>gl :exe "silent Glog <Bar> Unite -no-quit
            \ quickfix"<CR>:redraw!<CR>
nnoremap <Leader>gL :exe "silent Glog -- <Bar> Unite -no-quit
            \ quickfix"<CR>:redraw!<CR>
nnoremap <Leader>gt :!tig<CR>:redraw!<CR>
nnoremap <Leader>gS :exe "silent !shipit"<CR>:redraw!<CR>
nnoremap <Leader>gg :exe 'silent Ggrep -i '.input("Pattern: ")<Bar>Unite
            \ quickfix -no-quit<CR>
nnoremap <Leader>ggm :exe 'silent Glog --grep='.input("Pattern: ").' <Bar>
            \Unite -no-quit quickfix'<CR>
nnoremap <Leader>ggt :exe 'silent Glog -S='.input("Pattern: ").' <Bar>
            \Unite -no-quit quickfix'<CR>

nnoremap <Leader>ggc :silent! Ggrep -i<Space>

" for the diffmode
noremap <Leader>du :diffupdate<CR>

if !exists(":Gdiffoff")
    command Gdiffoff diffoff | q | Gedit
endif
noremap <Leader>dq :Gdiffoff<CR>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Gitv
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
nnoremap <silent> <leader>gv :Gitv --all<CR>
nnoremap <silent> <leader>gV :Gitv! --all<CR>
vnoremap <silent> <leader>gV :Gitv! --all<CR>

let g:Gitv_OpenHorizontal = 'auto'
let g:Gitv_WipeAllOnClose = 1
let g:Gitv_DoNotMapCtrlKey = 1

autocmd FileType git set nofoldenable

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Github dashboard
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
nnoremap <Leader>gD :exe 'GHD! '.input("Username: ")<CR>
nnoremap <Leader>gA :exe 'GHA! '.input("Username or repository: ")<CR>

function! GHDashboard (...)
  if &filetype == 'github-dashboard'
    " first variable is the statusline builder
    let builder = a:1

    call builder.add_section('airline_a', 'GitHub ')
    call builder.add_section('airline_b',
                \ ' %{get(split(get(split(github_dashboard#statusline(), " "),
                \ 1, ""), ":"), 0, "")} ')
    call builder.add_section('airline_c',
                \ ' %{get(split(get(split(github_dashboard#statusline(), " "),
                \ 2, ""), "]"), 0, "")} ')

    " tell the core to use the contents of the builder
    return 1
  endif
endfunction

autocmd FileType github-dashboard call airline#add_statusline_func('GHDashboard')

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Indent line
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
map <silent> <Leader>L :IndentLinesToggle<CR>
let g:indentLine_enabled = 0
let g:indentLine_char = '┊'
let g:indentLine_color_term = 239


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Python mode
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Keyboard shortcuts:
" K             Show python docs
" <Ctrl-Space>  Rope autocomplete
" <Ctrl-c>g     Rope goto definition
" <Ctrl-c>d     Rope show documentation
" <Ctrl-c>f     Rope find occurrences
" <Leader>b     Set, unset breakpoint (g:pymode_breakpoint enabled)
" [[            Jump on previous class or function (normal, visual, operator modes)
" ]]            Jump on next class or function (normal, visual, operator modes)
" [M            Jump on previous class or method (normal, visual, operator modes)
" ]M            Jump on next class or method (normal, visual, operator modes)

nmap <silent><Leader>n :PymodeLint<CR>

let g:pymode_breakpoint_bind = '<Leader>B'

let g:pymode_lint = 1
let g:pymode_lint_on_write = 1
let g:pymode_lint_checkers = ['pylint', 'pep8', 'mccabe']
let g:pymode_lint_ignore = ''
let g:pymode_virtualenv = 1
let g:pymode_rope = 1

let g:pymode_rope_completion = 0
let g:pymode_rope_complete_on_dot = 1

let g:pymode_syntax = 1
let g:pymode_syntax_all =1
let g:pymode_syntax_indent_errors = g:pymode_syntax_all
let g:pymode_syntax_space_errors = g:pymode_syntax_all

let g:pymode_folding = 0

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => TwitVim
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
nnoremap <Leader>tp :PosttoTwitter<CR>
nnoremap <Leader>tf :FriendsTwitter<CR>
nnoremap <Leader>tu :UserTwitter<CR>
nnoremap <Leader>tm :MentionsTwitter<CR>
nnoremap <Leader>ts :SearchTwitter<CR>


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Helper functions
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Delete trailing white space on save, useful for Python and CoffeeScript ;)
func! DeleteTrailingWS()
  exe "normal mz"
  %s/\s\+$//ge
  exe "normal `z"
endfunc

function! DeleteHiddenBuffers()
    let tpbl=[]
    call map(range(1, tabpagenr('$')), 'extend(tpbl, tabpagebuflist(v:val))')
    for buf in filter(range(1, bufnr('$')), 'bufexists(v:val) && index(tpbl, v:val)==-1')
        silent execute 'bwipeout' buf
    endfor
endfunction
