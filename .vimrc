set nocompatible " suspend compatibility with vi

set number "line number
" This line is just highlight linenumber meaninglessly
" highlight LineNr term=bold cterm=NONE ctermfg=White ctermbg=NONE gui=NONE guifg=White guibg=NONE

set nowrap
set list " show empty characters
set listchars=tab:--,trail:-,nbsp:%
set whichwrap=b,s,h,l,<,>,[,],~ " enable to go to next line at the end of previous line
set title
set backspace=indent,eol,start
set autoread " read automatically when file updated outside
set noswapfile
set wrapscan " go back to head when searched till end

" stop beeping
set vb t_vb=
set novisualbell

" disable ex mode
nnoremap Q <Nop>

" set leader
let mapleader = "\<Space>"

"""""""""""""""""""""""""""""""""""""""
" search
"""""""""""""""""""""""""""""""""""""""
set ignorecase " ignore case on search
set hlsearch

"""""""""""""""""""""""""""""""""""""""
" indent
"""""""""""""""""""""""""""""""""""""""
" use tab for makefile
let _curfile=expand("%:r")
let _curfilewithext=expand("%")
if _curfile =~# 'Makefile' || _curfilewithext =~# '.*\.s' || _curfilewithext =~# '.*\.scr'
  set noexpandtab
else
  set expandtab
endif

set tabstop=4
set smarttab
set shiftwidth=4
set autoindent
set smartindent

let b:did_indent = 1 " indent guard

"""""""""""""""""""""""""""""""""""""""
" status line
"""""""""""""""""""""""""""""""""""""""
set laststatus=2
set showmode
set showcmd
set ruler

"""""""""""""""""""""""""""""""""""""""
" key bind
"""""""""""""""""""""""""""""""""""""""

" yank till the end of te line
nnoremap Y y$
" f to move a word forward
nnoremap f w
" split window vertically
nnoremap <silent> <Bslash> :vsp<CR>
" split window horizontally
nnoremap <silent> - :sp<CR>
" move widely
noremap <S-h>   <S-b>
"noremap <S-h>   ^
noremap <S-q>   <S-j>
noremap <S-j>   }
noremap <S-k>   {
noremap <S-l>  <S-w>
"noremap <S-l>   $
noremap <C-e> $

" select all
nnoremap <C-a> ggVG
xnoremap <C-a> vggVG

" jump to head/tail of the function you are in
noremap <[[> [[?^?s*$<CR>jz<CR>
noremap <]]> /^?s*$<CR>]]?^?s*$<CR>jz<CR>

" back from insert mode
inoremap <silent> jj <ESC>
" move as bash alias
imap <C-j> <Down>
imap <C-k> <Up>
imap <C-h> <Left>
imap <C-l> <Right>
imap <C-e> <End>
imap <C-a> <Home>
imap <C-f> <C-o>w
imap <C-b> <C-o>b
" delete in insert mode
inoremap <C-d> <Del>
inoremap <C-x> <Del>
inoremap <C-s> <BS>
inoremap <C-o> <ESC>o

" indentation in insert mode

" since <Tab> is same as <C-i>, wont be able to jump forward anymore by this setting...
" nnoremap <Tab> >>_
nnoremap <S-Tab> <<_
inoremap <S-Tab> <ESC><<_i
vnoremap <Tab> >gv
vnoremap <S-Tab> <gv
nnoremap >> >>_
nnoremap << <<_

" moving aroung in command mode
cnoremap <C-j> <Down>
cnoremap <C-k> <Up>
cnoremap <C-h> <Left>
cnoremap <C-l> <Right>
cnoremap $ <End>
cnoremap <C-e> <End>
cnoremap ^ <Home>
cnoremap <C-a> <Home>
cnoremap <C-b> <S-Left>
cnoremap <C-f> <S-Right>
" delete in command mode
cnoremap <C-d> <Del>
cnoremap <C-x> <Del>
cnoremap <C-s> <BS>

" f to move a word forward in visual mode
xmap f w

" tab bind
nnoremap tl :tabnext<CR>
nnoremap th :tabprev<CR>
nnoremap tn :tabnew<CR>
nnoremap td :tabclose<CR>
nnoremap t0 :tabfirst<CR>
nnoremap t$ :tablast<CR>

"""""""""""""""""""""""""""""""""""""""
" command alias
"""""""""""""""""""""""""""""""""""""""
:command Full echo expand('%:p')
:command FULL echo expand('%:p')

"""""""""""""""""""""""""""""""""""""""
" dein
"""""""""""""""""""""""""""""""""""""""

" directory where plugins are installed
if has('nvim')
  let s:dein_dir= expand($DOTFILES . '/.cache/nvim/dein')
else
  let s:dein_dir= expand($DOTFILES . '/.cache/vim/dein')
endif

" dein itself
let s:dein_repo_dir = s:dein_dir . '/repos/github.com/Shougo/dein.vim'

" get dein from git if it doesnt exist
if &runtimepath !~ '/dein.vim'
  if !isdirectory(s:dein_repo_dir)
    execute '!git clone https://github.com/Shougo/dein.vim' s:dein_repo_dir
  endif
  execute 'set runtimepath+=' . fnamemodify(s:dein_repo_dir, ':p')
endif

if dein#load_state(s:dein_dir)
  call dein#begin(s:dein_dir)
  " toml file to list plugins being used
  let g:rc_dir    = expand($DOTFILES . '/.vim/rc')
  let s:toml      = g:rc_dir . '/dein.toml'
  let s:lazy_toml = g:rc_dir . '/dein_lazy.toml'
  call dein#load_toml(s:toml,      {'lazy': 0})
  call dein#load_toml(s:lazy_toml, {'lazy': 1})

  call dein#end()
  call dein#save_state()
endif

" install if any is missing
if dein#check_install()
  call dein#install()
endif

"""""""""""""""""""""""""""""""""""""""
" color scheme (needs to be after dein)
"""""""""""""""""""""""""""""""""""""""

" color scheme and syntax
set t_Co=256 " don't remember why I added this.
let g:hybrid_custom_term_colors = 1
let g:hybrid_reduced_contrast = 1 " Remove this line if using the default palette.
set background=dark
colorscheme hybrid

" syntax highlight
syntax on
set cursorline
"hi clear CursorLine
"highlight CursorLine cterm=underline ctermfg=NONE ctermbg=NONE
"highlight CursorLine gui=underline guifg=NONE guibg=NONE
hi Visual term=reverse cterm=reverse guibg=Grey

"""""""""""""""""""""""""""""""""""""""
" unite 
"""""""""""""""""""""""""""""""""""""""

" start in insert mode
" let g:unite_enable_start_insert = 1

" do not distinguish capital
let g:unite_enable_ignore_case = 1
let g:unite_enable_smart_case = 1

" unite key map
nnoremap [unite]    <Nop>
nmap     <Space> [unite]
" all buffers
nnoremap <silent> [unite]b :<C-u>Unite buffer<CR>
" all files
nnoremap <silent> [unite]f :<C-u>UniteWithBufferDir -buffer-name=files file<CR>
" all registers
nnoremap <silent> [unite]r :<C-u>Unite -buffer-name=register register<CR>
" all files recently used
nnoremap <silent> [unite]m :<C-u>Unite file_mru<CR>
" all
nnoremap <silent> [unite]a :<C-u>UniteWithBufferDir -buffer-name=files buffer file_mru bookmark file<CR>
" grep
nnoremap <silent> [unite]g :<C-u>Unite grep:. -buffer-name=search-buffer<CR>
" grep specifying the directory
nnoremap <silent> [unite]d :<C-u>Unite grep: -buffer-name=search-buffer<CR>
" grep the word where cursor is on
nnoremap <silent> [unite]c :<C-u>Unite grep:. -buffer-name=search-buffer<CR><C-R><C-W><CR>
" resume grep result
"nnoremap <silent> [unite]r :<C-u>UniteResume search-buffer<CR>
" something is already assigned to r... need to find it later.
nnoremap <silent> ,vr :<C-u>UniteResume search-buffer<CR>
" outline (use tagbar instead)
" nnoremap <silent> [unite]o :<C-u>Unite outline<CR>

" use ag for unite grep
if executable('ag')
  let g:unite_source_grep_command = 'ag'
  let g:unite_source_grep_default_opts = '--nogroup --nocolor --column'
  let g:unite_source_grep_recursive_opt = ''
endif

" use unite gtags
let g:unite_source_gtags_project_config = {
\ 'gtags_libpath': ['/usr/include/']
\ }
let g:unite_source_gtags_ref_option= "r"
let g:unite_source_gtags_def_option= ""
let g:unite_source_gtags_result_option= "ctags-x"

""""""""""""""""""""""""""""""""""""""""
" terminal mode
""""""""""""""""""""""""""""""""""""""""
if has('nvim')
  tnoremap <silent> <ESC> <C-\><C-n>
  tnoremap <silent> jj <C-\><C-n>

  nnoremap <silent> ,rc :TREPLSendFile<cr>
  nnoremap <silent> ,rl :TREPLSendLine<cr>
  vnoremap <silent> ,rl :TREPLSendSelection<cr>
  nnoremap <silent> vt :Ttoggle<cr>
  nnoremap <silent> vs :terminal<cr>
endif

""""""""""""""""""""""""""""""""""""""""
" ctags
""""""""""""""""""""""""""""""""""""""""
" show a list of candidates
nnoremap <C-]> g<C-]>

""""""""""""""""""""""""""""""""""""""""
" gtags (C-o jump back, C-i jump forward)
""""""""""""""""""""""""""""""""""""""""

" gtags key map
nnoremap [gtags]    <Nop>
nmap     , [gtags]

" grep
"nnoremap <silent> [gtags]g :Gtags -g 
nnoremap <silent> [gtags]g :Unite gtags/grep<CR>
" function list
"nnoremap <silent> [gtags]l :Gtags -f %<CR>
" jump
nnoremap <silent> [gtags]j :Gtags <C-r><C-w><CR>
" completion
nnoremap <silent> [gtags]c :Unite gtags/completion<CR>
" ref
nnoremap <silent> [gtags]r :Unite gtags/ref<CR>
" def
nnoremap <silent> [gtags]d :Unite gtags/def<CR>
" file
nnoremap <silent> [gtags]f :Unite gtags/file<CR>
" path
nnoremap <silent> [gtags]p :Unite gtags/path<CR>
" usage
"nnoremap <silent> [gtags]u :Gtags -r <C-r><C-w><CR>
" next
nmap <C-n> :cn<CR>
" previous
nmap <C-p> :cp<CR>
" jump back
nnoremap <silent> [gtags]b <C-o>
" jump forward
nnoremap <silent> [gtags]i <C-i>

"""""""""""""""""""""""""""""""""""""""
" neocomplete (C-n move forward, C-p move backward)
"""""""""""""""""""""""""""""""""""""""

if !has('nvim')
  " general setting
  let g:neocomplete#disable_auto_complete = 0
  let g:neocomplete#enable_auto_select = 0
  let g:neocomplete#enable_at_startup = 1
  let g:neocomplete#enable_ignore_case = 1
  let g:neocomplete#enable_smart_case = 1
  " key completion
  if !exists('g:neocomplete#keyword_patterns')
    let g:neocomplete#keyword_patterns = {}
  endif
  let g:neocomplete#keyword_patterns._ = '\h\w*'
  " omni completion
  if !exists('g:neocomplete#force_omni_input_patterns')
    let g:neocomplete#force_omni_input_patterns = {}
  endif
  let g:neocomplete#force_overwrite_completefunc = 1
  "let g:neocomplete#force_overwrite_completefunc = 0
  let g:neocomplete#force_omni_input_patterns.c = '[^.[:digit:] *\t]\%(\.\|->\)'
  let g:neocomplete#force_omni_input_patterns.cpp = '[^.[:digit:] *\t]\%(\.\|->\)\|\h\w*::'
endif

"""""""""""""""""""""""""""""""""""""""
" python 3 for nvim
"""""""""""""""""""""""""""""""""""""""

if has('nvim')
  set runtimepath+=$DOTFILES/.cache/nvim/dein/repos/github.com/Shougo/deoplete.nvim
  let g:python3_host_prog = $INSTALLDIR . '/bin/python3'

  " python3 plugins
  call remote#host#RegisterPlugin('python3', $DOTFILES . '/.cache/nvim/dein/repos/github.com/Shougo/deoplete.nvim/rplugin/python3/deoplete.py', [
        \ {'sync': 1, 'name': 'DeopleteInitializePython', 'type': 'command', 'opts': {}},
       \ ])
endif

"""""""""""""""""""""""""""""""""""""""
" deoplete for nvim
"""""""""""""""""""""""""""""""""""""""

if has('nvim')
  let g:deoplete#enable_at_startup = 1
  " <TAB>: completion.
  inoremap <silent><expr> <TAB>
        \ pumvisible() ? "\<C-n>" :
        \ <SID>check_back_space() ? "\<TAB>" :
        \ deoplete#manual_complete()
  function! s:check_back_space() abort "{{{
    let col = col('.') - 1
    return !col || getline('.')[col - 1]  =~ '\s'
  endfunction"}}}

  " <S-TAB>: completion back.
  inoremap <expr><S-TAB>  pumvisible() ? "\<C-p>" : "\<C-h>"

  " <BS>: close popup and delete backword char.
  inoremap <expr><BS> deoplete#smart_close_popup()."\<C-h>"

  " Use auto delimiter
  call deoplete#custom#set('_', 'converters', [
        \ 'converter_remove_paren',
        \ 'converter_remove_overlap',
        \ 'converter_truncate_abbr',
        \ 'converter_truncate_menu',
        \ 'converter_auto_delimiter',
  \ ])

  let g:deoplete#enable_camel_case = 1
endif

"""""""""""""""""""""""""""""""""""""""
" neosnippet
"""""""""""""""""""""""""""""""""""""""

" Plugin key-mappings.
imap <C-n> <Plug>(neosnippet_expand_or_jump)
smap <C-n> <Plug>(neosnippet_expand_or_jump)
xmap <C-n> <Plug>(neosnippet_expand_target)

" SuperTab like snippets behavior.
imap <expr><TAB> neosnippet#expandable_or_jumpable() ?
\ "\<Plug>(neosnippet_expand_or_jump)"
\: pumvisible() ? "\<C-n>" : "\<TAB>"
smap <expr><TAB> neosnippet#expandable_or_jumpable() ?
\ "\<Plug>(neosnippet_expand_or_jump)"
\: "\<TAB>"

" For snippet_complete marker.
if has('conceal')
 set conceallevel=2 concealcursor=i
endif

"""""""""""""""""""""""""""""""""""""""
" vim filer
"""""""""""""""""""""""""""""""""""""""

" enable file functions
let g:vimfiler_safe_mode_by_default = 0

" use vim filer as default explorer
" let g:vimfiler_as_default_explorer = 1

" use vim filer as default explorer
let g:vimfiler_enable_auto_cd = 1

call vimfiler#custom#profile('default', 'context', {
\ 'columns' : '',
\ 'explorer_columns' : '',
\ })

" open with vim filer
" autocmd VimEnter * VimFilerExplorer
" autocmd FileType vimfiler  nnoremap <buffer><silent>/  :<C-u>Unite file -default-action=vimfiler<CR>

""""""""""""""""""""""""""""""""""""""_
" vim-clang
"""""""""""""""""""""""""""""""""""""""

if !has('nvim')
  let g:clang_auto = 0
  let g:clang_complete_auto = 0
  let g:clang_auto_select = 0
  let g:clang_use_library = 1
  "let g:clang_debug = 1

  let g:clang_c_completeopt   = 'menuone'
  let g:clang_cpp_completeopt = 'menuone'
  let g:clang_exec = 'clang'
  let g:clang_format_exec = 'clang-format'
  
  let g:clang_c_options = '-std=c11'
  let g:clang_cpp_options = '-std=c++11 -stdlib=libc++'
  let g:clang_compilation_database = '.'
endif

""""""""""""""""""""""""""""""""""""""_
" deoplete-clang
"""""""""""""""""""""""""""""""""""""""
if has('nvim')
  " deoplete clang
  " let g:deoplete#sources#clang#libclang_path = $INSTALLDIR . '/lib/libclang.so.3.9'
  let g:deoplete#sources#clang#libclang_path = $INSTALLDIR . '/lib/libclang.so.5'
  let g:deoplete#sources#clang#clang_header = $INSTALLDIR . '/include/clang'
  "let g:deoplete#sources#clang#clang_complete_database = "./compile_commands.json"
  let g:deoplete#sources#clang#std#cpp = 'c++11'
  let g:deoplete#sources#clang#sort_algo = 'priority'
endif

""""""""""""""""""""""""""""""""""""""_
" jedi (python completion)
"""""""""""""""""""""""""""""""""""""""
nnoremap [jedi] <Nop>
xnoremap [jedi] <Nop>
nmap <Leader>j [jedi]
xmap <Leader>j [jedi]

let g:jedi#auto_initialization = 1
let g:jedi#auto_vim_configuration = 1
let g:jedi#completions_command = "<C-Space>"  " completion key (not sure how to use though)
let g:jedi#goto_assignments_command = "<C-g>" " jump to the definition of variable
let g:jedi#goto_definitions_command = "<C-d>" " jump to the class or function definition
let g:jedi#documentation_command = "<C-k>"    " show pydoc
let g:jedi#rename_command = "[jedi]r"
let g:jedi#usages_command = "[jedi]n"
let g:jedi#popup_select_first = 0
let g:jedi#popup_on_dot = 0

" do not show documentation window
autocmd FileType python setlocal completeopt-=preview
if ! dein#check_install(['neocomplete.vim'])
    autocmd FileType python setlocal omnifunc=jedi#completions
    let g:jedi#completions_enabled = 0
    let g:jedi#auto_vim_configuration = 0
    let g:neocomplete#force_omni_input_patterns.python =
        \ '\%([^. \t]\.\|^\s*@\|^\s*from\s.\+import \|^\s*from \|^\s*import \)\w*'
endif

"""""""""""""""""""""""""""""""""""""""
" tagbar
"""""""""""""""""""""""""""""""""""""""
autocmd FileType qf wincmd J
let g:tagbar_show_linenumbers = 1


"""""""""""""""""""""""""""""""""""""""
" quick run
"""""""""""""""""""""""""""""""""""""""
if !exists("g:quickrun_config")
    let g:quickrun_config={}
endif

let g:quickrun_config._ = {
\   'runner'    : 'vimproc',
\   'runner/vimproc/updatetime' : 60,
\   'outputter' : 'error',
\   'outputter/error/success' : 'quickfix',
\   'outputter/error/error'   : 'quickfix',
\   'outputter/buffer/split'  : ':rightbelow 8sp',
\   'outputter/buffer/close_on_empty' : 1,
\}

if filereadable(expand('~/.vimrc.run'))
  source ~/.vimrc.run
endif

"""""""""""""""""""""""""""""""""""""""
" conque gdb/term
"""""""""""""""""""""""""""""""""""""""

let g:ConqueGdb_Leader = '@'

let g:ConqueTerm_Color = 2         " 1: strip color after 200 lines, 2: always with color
let g:ConqueTerm_CloseOnEnd = 1    " close conque when program ends running
let g:ConqueTerm_StartMessages = 0 " display warning messages if conqueTerm is configured incorrectly

"""""""""""""""""""""""""""""""""""""""
" fswitch
"""""""""""""""""""""""""""""""""""""""
" from .h to .C, .C to .h
au! BufEnter *.C let b:fswitchdst = 'H,h' | let b:fswitchlocs = 'reg:/src/include/,reg:|src|include/**|,ifrel:|/src/|../include|'
au! BufEnter *.h let b:fswitchdst = 'c,cpp,m,C' | let b:fswitchlocs = 'reg:/include/src/,reg:/include.*/src/,ifrel:|/include/|../src|'
nmap <silent> <Leader>ss :FSHere<cr>

"""""""""""""""""""""""""""""""""""""""
" IDE setting
"""""""""""""""""""""""""""""""""""""""

:function Func()
:  VimFilerExplorer -toggle -no-quit -auto-cd
:  TagbarToggle
:endfunction

:function Tags()
:  CreateGtags
:endfunction

:function Bash()
:  if !exists('g:below_terminal')
:    let g:below_terminal = conque_term#open('/bin/bash', ['belowright split', 'resize 20'], 0)
:  else
:    call g:below_terminal.close()
:    unlet g:below_terminal
:  endif
:endfunction

:function Gdb()
:  if !exists('g:below_terminal')
:    let g:below_terminal = conque_gdb#open('gdb', ['belowright split', 'resize 20'], 0)
:  else
:    call g:below_terminal.close()
:    unlet g:below_terminal
:  endif
:endfunction

:command IDE call Func()
:command TAGS call Tags()
:command BASH call Bash()
:command GDB call Gdb()

" path
nnoremap <F2> :VimFilerExplorer -toggle -no-quit -auto-cd<CR>
nnoremap <F3> :TagbarToggle<CR>
nnoremap <F4> :BASH<CR>
nnoremap <F5> :GDB<CR>

"""""""""""""""""""""""""""""""""""""""
" SQL setting
"""""""""""""""""""""""""""""""""""""""

if filereadable(expand('~/.vimrc.db'))
  source ~/.vimrc.db
endif
