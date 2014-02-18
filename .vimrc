" All system-wide defaults are set in $VIMRUNTIME/debian.vim (usually just
" /usr/share/vim/vimcurrent/debian.vim) and sourced by the call to :runtime
" you can find below.  If you wish to change any of those settings, you should
" do it in this file (/etc/vim/vimrc), since debian.vim will be overwritten
" everytime an upgrade of the vim packages is performed.  It is recommended to
" make changes after sourcing debian.vim since it alters the value of the
" 'compatible' option.

" This line should not be removed as it ensures that various options are
" properly set to work with the Vim-related packages available in Debian.
runtime! debian.vim

" Uncomment the next line to make Vim more Vi-compatible
" NOTE: debian.vim sets 'nocompatible'.  Setting 'compatible' changes numerous
" options, so any other options should be set AFTER setting 'compatible'.
"set compatible

" Vim5 and later versions support syntax highlighting. Uncommenting the
" following enables syntax highlighting by default.
if has("syntax")
  syntax on
endif

" If using a dark background within the editing area and syntax highlighting
" turn on this option as well
"set background=dark

" Uncomment the following to have Vim jump to the last position when
" reopening a file
"if has("autocmd")
"  au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
"endif

" Uncomment the following to have Vim load indentation rules and plugins
" according to the detected filetype.
if has("autocmd")
  filetype plugin indent on
endif

set expandtab
set shiftwidth=2
set softtabstop=2

set so=7


":set statusline=%F%m%r%h%w\ [FORMAT=%{&ff}]\ [TYPE=%Y]\ [ASCII=\%03.3b]\ [HEX=\%02.2B]\ [POS=%04l,%04v][%p%%]\ [LEN=%L]

:set statusline=%F%m%r%h%w\ %Y\ %04l,%04v\ %L

:set laststatus=2

nnoremap <silent>+ :set paste<CR>m`o<Esc>``:set nopaste<CR>
nnoremap <silent>- :set paste<CR>m`O<Esc>``:set nopaste<CR>


" I like to have a faster way to go back after jumping around
nnoremap < <C-O>
nnoremap > <C-I>

" Up and down are more logical with g..
nnoremap <silent> k gk
nnoremap <silent> j gj
inoremap <silent> <Up> <Esc>gka
inoremap <silent> <Down> <Esc>gja

" Create Blank Newlines and stay in Normal mode
nnoremap <silent> zj o<Esc>
nnoremap <silent> zk O<Esc>

" Search mappings: These will make it so that going to the next one in a
" search will center on the line it's found in.
map N Nzz
map n nzz

" With a map leader it's possible to do extra key combinations
" like <leader>w saves the current file
let mapleader = ","
let g:mapleader = ","

" Fast saving
nmap <leader>w ;w!<cr>

" Useful mappings for managing tabs
map <leader>tn ;tabnew
map <leader>to ;tabonly<cr>
map <leader>tc ;tabclose<cr>
map <leader>ta ;tabn<cr>
map <leader>ts ;tabp<cr>
map <leader>tm ;tabmove

" Y yanks to end of line now to match D and C
nnoremap Y y$

" Use the OS register
map <leader>p "0p
map <leader>P "0P

" Opens a new tab with the current buffer's path
" Super useful when editing files in the same directory
map <leader>te ;tabedit <c-r>=expand("%:p:h")<cr>/

""""""""""""""""""""""""""""""
" => Visual mode related
""""""""""""""""""""""""""""""
vnoremap * :<C-u>call <SID>VSetSearch()<CR>//<CR>
vnoremap # :<C-u>call <SID>VSetSearch()<CR>??<CR>

" Do :help cope if you are unsure what cope is. It's super useful!
"
" When you search with vimgrep, display your results in cope by doing:
"   <leader>cc
"
" To go to the next search result do:
"   <leader>n
"
" To go to the previous search results do:
"   <leader>p
"
map <leader>cc ;botright cope<cr>
map <leader>co ggVGy;tabnew<cr>;set syntax=qf<cr>pgg
map <leader>n ;cn<cr>
"map <leader>p ;cp<cr>

" Window naviation
nnoremap <C-j> <C-w>j
nnoremap <C-h> <C-w>h
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

""set up undo file
set undolevels=10000 " number of changes that can be undone
if exists("+undofile")
    set undofile " use an undo file
    set undodir=~/.vim/tmp/undo// " set undo file location
    set undoreload=10000 " save this many lines on buffer reload
endif

" U is redo, instead of undo on line
nnoremap U <C-r>

" Swap ; and :  Convenient, yet dangerous (must change : to ;).
nnoremap ; :
nnoremap : ;

" Return to last edit position when opening files (You want this!)
autocmd BufReadPost *
     \ if line("'\"") > 0 && line("'\"") <= line("$") |
     \   exe "normal! g`\"" |
     \ endif
" Remember info about open buffers on close
set viminfo^=%

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Editing mappings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Remap VIM 0 to first non-blank character
map 0 ^

map <leader>sp ;setlocal paste!<cr>
map <leader>sr ;set mouse=r<cr>
map <leader>sa ;set mouse=a<cr>
" Remove the Windows ^M - when the encodings gets messed up
noremap <Leader>m mmHmt:%s/<C-V><cr>//ge<cr>'tzt'm

" The following are commented out as they cause vim to behave a lot
" differently from regular Vi. They are highly recommended though.
set showcmd		" Show (partial) command in status line.
set showmatch		" Show matching brackets.
set ignorecase		" Do case insensitive matching
set smartcase		" Do smart case matching
set incsearch		" Incremental search
set autowrite		" Automatically save before commands like :next and :make
set hidden             " Hide buffers when they are abandoned
"set mouse=r		" Enable mouse usage (all modes)

"fix mouse scrolling
set ttymouse=xterm2
set mouse=a

set history=500

" Wildmenu settings
if has("wildmenu")
    set wildmenu " command-line completion in an
" enhanced mode
    set wildmode=list:longest " when more than one match, list
" all matches and complete till
" longest common string
    if has("wildignore")
        set wildignore+=*.bak,*.e,*~ " wildmenu: ignore extensions
        set wildignore+=.hg,.git,.svn " Version control
        set wildignore+=*.aux,*.out,*.toc " LaTeX intermediate files
        set wildignore+=*.jpg,*.bmp,*.gif " binary images
        set wildignore+=*.png,*.jpeg " binary images
        set wildignore+=*.o,*.obj,*.exe " compiled object files
        set wildignore+=*.dll,*.manifest " compiled object files
        set wildignore+=*.spl " compiled spelling word lists
        set wildignore+=*.sw? " Vim swap files
        set wildignore+=*.DS_Store " OSX bullshit
        set wildignore+=*.luac " Lua byte code
        set wildignore+=migrations " Django migrations
        set wildignore+=*.pyc " Python byte code
        set wildignore+=*.orig " Merge resolution files
    endif
endif

function! CmdLine(str)
    exe "menu Foo.Bar ;" . a:str
    emenu Foo.Bar
    unmenu Foo
endfunction

function! s:VSetSearch()
    let temp = @@
    norm! gvy
    let @/ = '\V' . substitute(escape(@@, '\'), '\n', '\\n', 'g')
    let @@ = temp
endfunction

" Source a global configuration file if available
if filereadable("/etc/vim/vimrc.local")
  source /etc/vim/vimrc.local
endif
