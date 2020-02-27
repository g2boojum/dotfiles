" Configuration file for vim
" Heavily cribbed from ciaranm and agriffis
" Most recent update: Fri 21 Feb 2020 04:24:59 PM CST

" Keep this at the top of the file
set nocompatible " Don't be compatible with vi

"vim-plug
call plug#begin()
Plug 'tpope/vim-sensible'
Plug 'ciaranm/inkpot'
Plug 'fholgado/minibufexpl.vim'
Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }
Plug 'fs111/pydoc.vim'
Plug 'klen/python-mode'
Plug 'kien/rainbow_parentheses.vim'
Plug 'kien/ctrlp.vim'
Plug 'agriffis/screenrepl'
Plug 'tpope/vim-classpath'
Plug 'guns/vim-clojure-static'
Plug 'kovisoft/paredit'
Plug 'altercation/vim-colors-solarized'
Plug 'tpope/vim-fireplace', { 'for': 'clojure' }
Plug 'tpope/vim-fugitive'
Plug 'jamessan/vim-gnupg'
Plug 'vim-latex/vim-latex'
Plug 'kshenoy/vim-signature'
Plug 'tpope/vim-surround'
Plug 'g2boojum/vim-mcnp'
Plug 'g2boojum/vim-pweave'
Plug 'g2boojum/vim-sweave-rst'
Plug 'jnurmine/ZenBurn'
Plug 'zah/nim.vim'
Plug 'vim-airline/vim-airline'
Plug 'w0rp/ale'
" Plug 'ambv/black'
Plug 'archseer/colibri.vim' " colibri color scheme
Plug 'kalekundert/vim-coiled-snake'
Plug 'Konfekt/FastFold'
Plug 'christoomey/vim-tmux-navigator'
Plug 'NLKNguyen/papercolor-theme'
call plug#end()

"-----------------------------------------------------------------------
" settings from agriffis
"-----------------------------------------------------------------------

set autowrite           " write before a make
if v:version >= 603 || (v:version == 602 && has('patch481'))
    set backupcopy+=breakhardlink " good for working on git/merc/etc. repos
endif
" set clipboard=autoselectml,unnamedplus
set encoding=utf-8      " unicode me, baby
set hidden              " don't unload buffer when it is abandoned
set listchars=tab:»·,trail:·    " how to display some special chars
set modeline modelines=5 " security peskurity
set nojoinspaces        " two spaces after a period is for old fogeys
set paragraphs=         " otherwise NROFF macros screw up CSS
set report=0            " threshold for reporting nr. of lines changed
set shortmess+=at       " list of flags, reduce length of messages
set showmode            " message on status line to show current mode
set showmatch           " briefly jump to matching bracket
"set swapsync=""         " don't call fsync() or sync(); let linux handle it
set nowarn              " don't warn for shell command when buffer changed
set wildmode=longest,list,full

" Statusline thanks to Ciaran
set laststatus=2        " always show a status line (with the current filename)
set statusline=
set statusline+=%{winnr()}:%-3.3n\           " window number:buffer number
set statusline+=%f\                          " file name
set statusline+=%h%m%r%w                     " flags
set statusline+=\[%{strlen(&ft)?&ft:'none'}, " filetype
set statusline+=%{&encoding},                " encoding
set statusline+=%{&fileformat}]              " file format
set statusline+=%=                           " right align
set statusline+=0x%-8B\                      " current char
set statusline+=%-14.(%l,%c%V%)\ %<%P        " offset

" Tabs and Indents
set autoindent
set comments=b:#,b:##,n:>,fb:-,fb:*
set expandtab           " default but see autocmds
" formatoptions are in the order presented in fo-table
"   a and w are left out because we set them in muttrc for format=flowed
set formatoptions+=t    " auto-wrap using textwidth (not comments)
set formatoptions+=c    " auto-wrap comments too
set formatoptions+=r    " continue the comment header automatically on <CR>
set formatoptions-=o    " don't insert comment leader with 'o' or 'O'
set formatoptions+=q    " allow formatting of comments with gq
"set formatoptions-=w   " double-carriage-return indicates paragraph
"set formatoptions-=a   " don't reformat automatically
set formatoptions+=n    " recognize numbered lists when autoindenting
set formatoptions+=2    " use second line of paragraph when autoindenting
set formatoptions-=v    " don't worry about vi compatiblity
set formatoptions-=b    " don't worry about vi compatiblity
set formatoptions+=l    " don't break long lines in insert mode
set formatoptions+=1    " don't break lines after one-letter words, if possible
set shiftround          " round indent < and > to multiple of shiftwidth
set shiftwidth=4        " but see override in c_linux-kernel.vim
set smarttab            " use shiftwidth when inserting <Tab>
set tabstop=8           " number of spaces that <Tab> in file uses
set textwidth=75        " by default, although plugins or autocmds can modify

" Search and completion settings
set complete-=t         " don't search tags files by default
set complete-=i         " don't search included files -- takes too long
set incsearch           " incremental search
set ignorecase          " "foo" matches "Foo", etc
set infercase           " adjust the case of the match with ctrl-p/ctrl-n
set smartcase           " ignorecase only when the pattern is all lower
set nohlsearch          " by default, don't highlight matches after they're found

" Windowing settings
"set splitright splitbelow
set splitright
set equalalways         " keep windows equal when splitting (default)
set eadirection=both    " ver/hor/both - where does equalalways apply
"set winheight=6         " height of current window
"set winwidth=75         " width of current window

" When using the taglist plugin, don't attempt to resize the terminal
let Tlist_Inc_Winwidth=0

" Configure the CtrlP plugin
let g:ctrlp_user_command = {
  \ 'types': {
    \ 1: ['.git', 'cd %s && git ls-files'],
    \ 2: ['.hg', 'hg --cwd %s locate -I .'],
    \ },
  \ 'fallback': 'find %s -type f'
  \ }
let g:ctrlp_extensions = ['tag']
let g:ctrlp_cmd = 'CtrlPMixed'
let g:ctrlp_root_markers = ['.topdir']

" shell is bash
let g:is_bash=1

" Use .vim/bak for backups
if ! isdirectory($HOME."/.vim/bak") && exists("*system")
  call system("mkdir -p $HOME/.vim/bak")
endif
if isdirectory($HOME."/.vim/bak")
  set backup
  set backupdir=~/.vim/bak,.
endif

" Use .vim/swap for swapfiles
if ! isdirectory($HOME."/.vim/swap") && exists("*system")
  call system("mkdir -p $HOME/.vim/swap")
endif
if isdirectory($HOME."/.vim/swap")
  set directory=~/.vim/swap,.
endif

" Use .vim for viminfo; directory will be made above
if isdirectory($HOME."/.vim")
  if has("viminfo")
    set viminfo='50,n~/.vim/viminfo
  endif
  let $CVIMSYN='~/.vim/'
endif

" Reformat current paragraph
nmap Q }{gq}
vmap Q gq 

"================================== Python =================================
" If this option is set to 1, pymode will enable the following options
" for python buffers:
"
"     setlocal complete+=t
"     setlocal formatoptions-=t
"     if v:version > 702 && !&relativenumber
"         setlocal number
"     endif
"     setlocal nowrap
"     setlocal textwidth=79
"     setlocal commentstring=#%s
"     setlocal define=^\s*\\(def\\\\|class\\)
"
let g:python3_host_prog = '/home/grant/Envs/neovim_py37/bin/python'
let g:pymode_options = 1

" Additional pymode settings
let g:pymode_trim_whitespaces = 0
let g:pymode_folding = 1
let g:pymode_indent = 1  " PEP8
let g:pymode_lint_on_fly = 0
let g:pymode_lint_on_write = 0
let g:pymode_lint_unmodified = 0
let g:pymode_lint_ignore = "E301,E302,E261,E501"
let g:pymode_rope_complete_on_dot = 0
let g:pymode_rope_autoimport = 1
let g:pymode_rope_goto_definition_cmd = 'e'

" pymode bindings
let g:pymode_rope_completion_bind = ''       " <C-Space>

" The g:pyindent settings only take effect if g:pymode_indent == 0
" http://stackoverflow.com/questions/3538785/how-to-turn-off-double-indentation-in-vim
let g:pyindent_open_paren = '&sw'
let g:pyindent_nested_paren = '&sw'
let g:pyindent_continue = '&sw'

function! LoadTypePython()
  " When working in a virtualenv, this relies on the virtualenv.vim
  " plugin to set sys.path properly.  Vim links to the system libpython
  " and doesn't know about the virtualenv path otherwise.
  if has('python')
    python import os, sys, vim
    python vim.command("setlocal path+=" + ",".join(sys.path[1:]))
  endif

  " Override g:pymode_options
  "setlocal nonumber
  setlocal tabstop=8

  " Additional default settings for Python
  setlocal shiftwidth=4
  setlocal noshiftround

  " Unfold by default
  normal zR
endfunction

augroup ag_python
  autocmd!
  autocmd FileType python call LoadTypePython()
augroup END


"-----------------------------------------------------------------------
" settings from g2boojum
"-----------------------------------------------------------------------


" From old agriffis stuff
if has("gui_gtk3") || has("gui_gtk2")
	"set guifont=Monospace\ 8
	"set guifont=LucidaTypewriter\ 7
	set guifont=JetBrains\ Mono\ 8
	"set guifont=Anonymous\ Pro\ 8
	"set guifont=LucidaTypewriter\ 9
	set guioptions-=T "turn off toolbar
        set guioptions-=l
        set guioptions-=L
        set guioptions-=r
        set guioptions-=R
        "set guioptions-=m "turn off menubar
else
	set guifont=-b&h-lucidatypewriter-medium-r-normal-sans-10-100-75-75-m-60-iso8859-1
endif

" Try to load a nice colourscheme
fun! LoadColourScheme(schemes)
    let l:schemes = a:schemes . ":"
    while l:schemes != ""
        let l:scheme = strpart(l:schemes, 0, stridx(l:schemes, ":"))
        let l:schemes = strpart(l:schemes, stridx(l:schemes, ":") + 1)
        try
            exec "colorscheme" l:scheme
            break
        catch
        endtry
    endwhile
endfun

if has('gui_running')
    call LoadColourScheme("inkpot:night:rainbow_night:darkblue:elflord:default")
else
    if &t_Co == 88 || &t_Co == 256
        "let g:solarized_termcolors=256
        "set background=light
        "set background=dark
        "call LoadColourScheme("solarized:inkpot:darkblue:elflord:default")
        call LoadColourScheme("PaperColor:zenburn:inkpot:solarized:darkblue:elflord:default")
        set background=light
    else
        call LoadColourScheme("darkblue:elflord:default")
    endif
endif

" Syntax when printing
set popt+=syntax:y
set popt+=paper:letter

"-----------------------------------------------------------------------
" completion
"-----------------------------------------------------------------------
set dictionary=/usr/share/dict/words

" If we're in a wide window, enable line numbers.
fun! <SID>WindowWidth()
    if winwidth(0) > 90
        setlocal number
    else
        setlocal nonumber
    endif
endfun

" Force active window to the top of the screen without losing its
" size.
fun! <SID>WindowToTop()
    let l:h=winheight(0)
    wincmd K
    execute "resize" l:h
endfun

" Force active window to the bottom of the screen without losing its
" size.
fun! <SID>WindowToBottom()
    let l:h=winheight(0)
    wincmd J
    execute "resize" l:h
endfun


" Update .*rc header
fun! <SID>UpdateRcHeader()
    let l:c=col(".")
    let l:l=line(".")
    1,10s-\(Most recent update:\).*-\="Most recent update: ".strftime("%c")-
    call cursor(l:l, l:c)
endfun

augroup ciaranm
    autocmd!
    " For help files, move them to the top window and make <Return>
    " behave like <C-]> (jump to tag)
    autocmd FileType help :call <SID>WindowToTop()
    autocmd FileType help nmap <buffer> <Return> <C-]>
    
    " Automagic line numbers
    autocmd BufEnter * :call <SID>WindowWidth()
    
    " Update header in .vimrc and .bashrc before saving
    autocmd BufWritePre *vimrc  :call <SID>UpdateRcHeader()
    autocmd BufWritePre *bashrc :call <SID>UpdateRcHeader()
augroup END

set winminheight=1

" Settings minibufexpl.vim
let g:miniBufExplModSelTarget = 1
let g:miniBufExplWinFixHeight = 1
let g:miniBufExplMapWindowNavVim = 1
let g:miniBufExplMapWindowNavArrows = 1
let g:miniBufExplMapCTabSwitchBufs = 1


" set numberwidth to 6 so that indentation level and line #s are visible
set nuw=6
 
"clojure stuff
"let vimclojure#NailgunClient = "/home/grant/bin/ng"
"let g:clj_want_gorilla = 1

"vim-latex stuff
let g:tex_flavor='lualatex'
set grepprg=grep\ -nH\ $*
let g:Tex_DefaultTargetFormat='pdf'
let g:Tex_CompileRule_pdf = 'lualatex -synctex=1 -interaction=nonstopmode $*'
"let g:Tex_MultipleCompileFormats='pdf, aux'

"pymode rope fix (hangs)
let g:pymode_rope = 0

"pymode ignores
"let g:pymode_lint_ignore="E226"

"Rainbow parentheses
au VimEnter * RainbowParenthesesToggle
au Syntax * RainbowParenthesesLoadRound
au Syntax * RainbowParenthesesLoadSquare
au Syntax * RainbowParenthesesLoadBraces

"ale
let g:ale_sign_column_always = 1
let g:airline#extensions#ale#enabled = 1
let g:airline_powerline_fonts = 1

"fortran
nmap <S-F> :set syntax=fortran<CR>:let b:fortran_fixed_source=!b:fortran_fixed_source<CR>:set syntax=text<CR>:set syntax=fortran<CR>
"nmap <C-F> :filetype detect<CR>

"clojure
let g:paredit_leader = '\'

" BELOW REPLACED BY vim-tmux-navigator
"" split navs
"nnoremap <C-J> <C-W><C-J>
"nnoremap <C-K> <C-W><C-K>
"nnoremap <C-L> <C-W><C-L>
"nnoremap <C-H> <C-W><C-H>


"-----------------------------------------------------------------------
" final commands
"-----------------------------------------------------------------------

" turn off any existing search
au VimEnter * nohls

" spelling
setlocal spell spelllang=en

if &diff
    " diff mode
    set diffopt+=iwhite
endif

"-----------------------------------------------------------------------
" vim: set shiftwidth=4 softtabstop=4 expandtab tw=72                  :
