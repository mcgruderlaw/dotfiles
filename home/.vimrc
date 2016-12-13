set nocompatible
filetype off

set rtp+=~/.vim/bundle/Vundle.vim

call vundle#begin()
Plugin 'gmarik/Vundle.vim'
Plugin 'tpope/vim-fugitive'
Plugin 'godlygeek/tabular'
Plugin 'waylan/Python-Markdown'
Plugin 'poise/python'
Plugin 'vim-scripts/python.vim'
Plugin 'klen/python-mode'
Plugin 'Lokaltog/powerline-fonts'
Plugin 'airblade/vim-gitgutter'
Plugin 'tyru/open-browser.vim'
Plugin 'scrooloose/syntastic'
" Plugin 'scrooloose/nerdtree'
Plugin 'hallison/vim-markdown'
Plugin 'flazz/vim-colorschemes'
Plugin 'altercation/vim-colors-solarized'
Plugin 'astrumas/evervim'
Plugin 'VitaliyRodnenko/geeknote'
Plugin 'vim-scripts/ScrollColors'
Plugin 'yuratomo/w3m.vim'
" Plugin 'Lokaltog/vim-easymotion'
Plugin 'kien/ctrlp.vim'
Plugin 'vimoutliner/vimoutliner'
Plugin 'SirVer/ultisnips'
" Plugin 'themoken/canto-next'
" Plugin 'sjl/clam.vim'
Plugin 'mileszs/ack.vim'
Plugin 'rosenfeld/conque-term'
Plugin 'vim-scripts/Gundo'
Plugin 'vim-scripts/ag.vim'
Plugin 'vim-pandoc/vim-pandoc'
Plugin 'vim-pandoc/vim-pandoc-syntax'
Plugin 'itchyny/vim-gitbranch'
" Plugin 'mikewest/vimroom'
Plugin 'xolox/vim-easytags'
Plugin 'xolox/vim-misc'
" Plugin 'psyrendust/dedrm-ebook-tools'
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-obsession'
Plugin 'gerw/vim-latex-suite'
Plugin 'gerw/vim-tex-syntax'
Plugin 'stefandtw/quickfix-reflector.vim'
" Plugin 'Valloric/YouCompleteMe'
" Plugin 'noahfrederick/vim-noctu'
" Plugin 'noahfrederick/vim-hemisu'
Plugin 'jonathanfilip/lucius'
Plugin 'tpope/vim-vinegar'
" Plugin 'bling/vim-airline'
" Plugin 'bling/vim-bufferline'
" Plugin 'honza/vim-snippets'
" Plugin 'themoken/canto-curses'
" Plugin 'vim-scripts/Command-T'
" Plugin 'maciakl/vim-neatstatus.git'
Plugin 'vim-scripts/taglist.vim'
Plugin 'chrisbra/unicode.vim'
Plugin 'amperser/proselint', {'rtp': 'plugins/vim/syntastic_proselint/'}

call vundle#end()

filetype plugin indent on
syntax on

let mapleader = ","
let maplocalleader = "\\"

set cursorline          " highlight current line
" set statusline+=%F
" set statusline=%<\ %n:%F\ %m%r%y%=%-40.(line:\ %l\ of\ %L,\ col:\ %c%V\ (%P)%)
" set statusline=%F%m%r%h%w\ [FORMAT=%{&ff}]\ [TYPE=%Y]\ [POS=%l,%v][%p%%]\ %{strftime(\"%d/%m/%y\ -\ %H:%M\")}
" set statusline=[%n]\ %<%F\ \ \ [%M%R%H%W%Y][%{&ff}]\ \ %=\ line:%l/%L\ col:%c\ \ \ %p%%\ \ \ @%{strftime(\"%H:%M:%S\")}
" set statusline=[%n]\ %<%f\ \ \ [%M%R%H%W%Y]\ \ %=\ %l,%L\ \ \ %c\ \ \ %p%%
set statusline=\"%f\"\ \ \ %m%r%h%w%y\ \ %=\ %l,%L\ \ \ %c\ \ \ %p%%
"    set statusline+=%#warningmsg#
"    set statusline+=%{SyntasticStatuslineFlag()}
"    set statusline+=%*
"	set statusline+=%{ObsessionStatus()}
set showmatch           " highlight matching [{()}]
set showmatch           " highlight matching [{()}]
set wildmenu            " visual autocomplete for command menu
set foldenable          " enable folding
set foldlevelstart=10   " open most folds by default
set foldnestmax=10      " 10 nested fold max
set foldmethod=indent   " fold based on indent level
set showcmd
set pastetoggle=<F2>
set clipboard=unnamed
set equalprg=''
set incsearch
set complete=.,k,w,b,u,t,i
set omnifunc=syntaxcomplete#Complete

" Syntastic Settings
"set statusline+=%#warningmsg#
"set statusline+=%{SyntasticStatuslineFlag()}
"set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 2
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_tex_checkers = ["lacheck", "chktex", "proselint"]
let g:syntastic_loc_list_height = 5
let g:syntastic_aggregate_errors = 1

if &term =~ '256color'
" Disable Background Color Erase (BCE) so that color schemes
" work properly when Vim is used inside tmux and GNU screen.
set t_ut=
endif

set spelllang=en_us   " US English spelling
set dictionary+=/usr/share/dict/cracklib-small "use standard dictionary
""set spellfile=$HOME/Sync/vim/spell/en.utf-8.add   " my whitelist
set thesaurus+=/home/dmc/.vim/thesaurus/files/mthesaur.txt

nnoremap <leader>f :echo expand("%:p")<cr>
nnoremap <leader>ev :vsp $HOME/.homesick/repos/dotfiles/home/.vimrc<cr>
nnoremap <leader>sv :source $HOME/.homesick/repos/dotfiles/home/.vimrc<cr>
nnoremap <leader>eb :vsp $HOME/.homesick/repos/dotfiles/home/.bashrc<cr>
nnoremap <c-j> <c-w>j
nnoremap <c-k> <c-w>k
nnoremap <c-l> <c-w>l
nnoremap <c-h> <c-w>h
nnoremap <leader>" viw<esc>a"<esc>hbi"<esc>lel
nnoremap <leader>' viw<esc>a'<esc>hbi'<esc>lel
vnoremap <leader>" <esc>`<i"<esc>`>a"<esc>
"cnoremap sudow :w !sudo tee % >/dev/null
nnoremap <leader>sq "qy:call ExecuteSQL()<CR>
nnoremap <leader>ss :w !sudo tee % >/dev/null<cr>
nnoremap <leader>s <esc>:w<cr>
inoremap <leader>s <esc>:w<cr>
"nnoremap ; :
vnoremap > >gv
vnoremap < <gv
nnoremap <leader>lp :!pdflatex %<cr>
nnoremap <leader>tt :TTarget<CR>
nnoremap <leader>TT :TTemplate<CR>
nnoremap <leader>sp :!aspell check %<CR>
nnoremap <leader>ca :e $HOME/Documents/ofc/Cases/<CR>
nnoremap <leader>ho :e $HOME/.homesick/repos/dotfiles/home/<CR>
nnoremap <leader>no :e $HOME/Documents/Notes/<CR>
nnoremap / /\v
"Sentence Junctions
nnoremap fc. r.wvUb
nnoremap fc, r,wvub
nnoremap fc; r;wvub
nnoremap fc- s -<esc>wvub
xnoremap fc. s.<esc>wvUb
xnoremap fc, s,<esc>wvub
xnoremap fc; s;<esc>wvub

" Spell checking  ---
if version >= 700
  hi clear SpellBad
  hi clear SpellCap
  hi clear SpellRare
  hi clear SpellLocal
  hi SpellBad    ctermfg=9
  hi SpellCap    ctermfg=3    cterm=underline
  hi SpellRare   ctermfg=13   cterm=underline
  hi SpellLocal  cterm=None
endif

" Evervim
"let g:evervim_devtoken set in ~/.vim/evervim/evervim.vim for security
source ~/.vim/evervim/evervim.vim
nnoremap <silent> <leader>el :<C-u>EvervimNotebookList<CR>
nnoremap <silent> <leader>eT :<C-u>EvervimListTags<CR>
nnoremap <silent> <leader>en :<C-u>EvervimCreateNote<CR>
nnoremap <silent> <leader>eB :<C-u>EvervimOpenBrowser<CR>
nnoremap <silent> <leader>ec :<C-u>EvervimOpenClient<CR>
nnoremap <leader>es :<C-u>EvervimSearchByQuery<SPACE>
nnoremap <leader>af :<C-u>EvervimSearchByQuery Affirmation<CR>
nnoremap <leader>wf :<C-u>EvervimSearchByQuery My Workflow<CR>
nnoremap <silent> <leader>et :<C-u>EvervimSearchByQuery<SPACE>tag:1-Now,tag:2-Next,tag:3-Soon<CR>
nnoremap <silent> <leader>etl :<C-u>EvervimSearchByQuery<SPACE>tag:4-Later -tag:5-Someday<CR>
"let g:evervim_splitoption=''
let g:evervim_usermarkdown='1'

"open-browswer
let g:openbrowser_default_search = "duckduckgo"
let g:openbrowser_search_engines = {
	  \    'favorite': 'http://duckduckgo.com/?q={query}'
	  \}
let g:netrw_nogx = 1 " disable netrw's gx mapping.
let g:netrw_banner = 1 
let g:netrw_localcopycmd ="cp"
let g:netrw_localcopydircmd ="cp -R"
let g:netrw_keepdir= 0
let g:netrw_rsync_cmd="rsync -a --delete -e ssh"
let g:netrw_liststyle= 0
nnoremap gx <Plug>(openbrowser-smart-search)
vnoremap gx <Plug>(openbrowser-smart-search)

function! OpenBrowserLine()
        let matched = matchlist(getline("."), 'https\?://[0-9A-Za-z_#?~=\-+%\.\/:]\+')
        if len(matched) == 0
                break
        endif
        execute "OpenBrowser " . matched[0]
endfunction

nmap br <Plug>(openbrowser-smart-search)
vmap br <Plug>(openbrowser-smart-search)

"For Statusline
"set encoding=utf-8
"set t_Co=256
"set fillchars+=stl:\ ,stlnc:\
"set term=xterm-256color
"set termencoding=utf-8
function! AirlineThemePatch(palette)
          let a:palette.accents.bold_yellow = [ '#ffffff', '', 0, '', 'bold' ]
endfunction
let g:airline_theme_patch_func = 'AirlineThemePatch'
let g:Powerline_symbols = 'fancy'
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#fnamemod = ':t'
"let g:airline#extensions#tabline#left_sep = ' '
"let g:airline#extensions#tabline#left_alt_sep = '|'
let g:airline#extensions#quickfix#quickfix_text = 'Quickfix'
let g:airline#extensions#quickfix#location_text = 'Location'
let g:airline#extensions#bufferline#enabled = 1
let g:airline#extensions#bufferline#overwrite_variables = 1
let g:airline#extensions#tabline#buffer_nr_show = 1

"set statusline=%<%f\ %{fugitive#statusline()}\ %h%m%r%=%-14.(%l,%c%V%)\
"%P
"set rtp+=~/.vim/bundle/powerline/powerline/bindings/vim

"autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o
autocmd BufNewFile,BufReadPost *.md set filetype=markdown
au BufEnter,BufRead *.py setlocal smartindent cinwords=if,elif,else,for,while,try,except,finally,def,class

set shellslash
set grepprg=grep\ -nH\ $*
set sw=2
let g:tex_flavor='latex'
"let g:Tex_CompileRule_dvi = 'latex --interaction=nonstopmode $*'
"let g:Tex_CompileRule_ps = 'dvips -Ppdf -o $*.ps $*.dvi'
"let g:Tex_CompileRule_pdf = 'ps2pdf $*.ps'

"let g:Tex_CompileRule_pdf = 'latexmk -pdf "$*"'

let g:Tex_DefaultTargetFormat = 'pdf'
let g:Tex_CompileRule_pdf = 'pdflatex --synctex=-1 -src-specials -interaction=nonstopmode $*'
let g:Tex_MultipleCompileFormats='dvi,pdf'
let g:Tex_ViewRule_pdf = 'zathura'
let g:Tex_GotoError = 1

let g:pandoc#command#autoexec_on_writes = 1
let g:pandoc#command#latex_engine = "pdflatex"
let g:pandoc#formatting#smart_autoformat_on_cursormoved = 1
let g:pandoc#command#autoexec_command = "Pandoc pdf"
let g:pandoc#formatting#mode = "hA"
let g:pandoc#formatting#textwidth = 72
let g:pandoc#formatting#equalprg = "pandoc -t markdown --reference-links [--columns {g:pandoc#formatting#textwidth}|no-wrap]"
let g:pandoc#spell#enabled = 1



set number
"set relativenumber
"set rulerformat=%55(%{strftime('%a\ %b\ %e\ %I:%M\ %p')}\ %5l,%-6(%c%V%)\%P%)

set laststatus=0
set list
set listchars=tab:→\ ,eol:¬
"set listchars=eol:$
set showcmd
"set splitbelow
"set splitright
set wildmode=list:longest,list:full
" Necessary order
set linebreak
set textwidth=74
set display=lastline
set formatoptions=tcq
" set wrapmargin=5

"Nerdtree opens automatically if no files specified
"autocmd vimenter * if !argc() | NERDTree | endif

"Close vim if only window left open is Nerdtree
"autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif

"Ctl-n opens Nerdtree
" nnoremap <C-n> :NERDTreeToggle<CR><C-w>=:set relativenumber<CR>

set hidden

set rulerformat=%30(%=\:b%n%y%m%r%w\ %l,%c%V\ %P%) " A ruler on steroids
set ruler

set tags=./tags;
let g:easytags_dynamic_files = 1

set autochdir
" let NERDTreeChDirMode=2
" nnoremap <leader>n :NERDTree .<CR>:set number<CR>

syntax enable
set tabstop=4       " number of visual spaces per TAB
set softtabstop=4   " number of spaces in tab when editing
"set expandtab       " tabs are spaces
"set <C-v><Tab>      " for Tab character

"let g:solarized_termcolors=256
 
set background=light
"g:solarized_termcolors = 16
"g:solarized_termtrans = 1
"g:solarized_degrade = 0 | 1 
"g:solarized_bold = 1 | 0 
"g:solarized_underline = 1 | 0 
"g:solarized_italic = 1 | 0 
"g:solarized_contrast = "normal"| "high" or "low"
"g:solarized_visibility= "normal"| "high" or "low"
call togglebg#map("<F8>")
colorscheme hipster
"LuciusDarkHighContrast

"solarized hemisu noctu hipster lucius skittles_dark elflord badwolf starbucks molokai Tomorrow
                            "github mayansmoke zenburn relaxedgreen

"hi Normal ctermfg=NONE ctermbg=NONE cterm=NONE
"hi NonText ctermbg=NONE
"hi Search ctermbg=red

nnoremap <F4> :GundoToggle<CR>

"YouCompleteMe Settings
"let g:ycm_server_python_interpreter = 'python3'
let g:ycm_seed_identifiers_with_syntax = 1
let g:ycm_complete_in_comments = 1
let g:ycm_server_keep_logfiles = 1
let g:ycm_server_log_level = 'info'

"UltiSnips Settings
function! g:UltiSnips_Complete()
    call UltiSnips#ExpandSnippet()
    if g:ulti_expand_res == 0
        if pumvisible()
            return "\<C-n>"
        else
            call UltiSnips#JumpForwards()
            if g:ulti_jump_forwards_res == 0
               return "\<TAB>"
            endif
        endif
    endif
    return ""
endfunction

au BufEnter * exec "inoremap <silent> " . g:UltiSnipsExpandTrigger . " <C-R>=g:UltiSnips_Complete()<cr>"
let g:UltiSnipsJumpForwardTrigger="<tab>"
let g:UltiSnipsListSnippets="<c-e>"
" this mapping Enter key to <C-y> to chose the current highlight item
" and close the selection list, same as other IDEs.
" CONFLICT with some plugins like tpope/Endwise
inoremap <expr> <CR> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"


" Trigger configuration. Do not use <tab> if you use https://github.com/Valloric/YouCompleteMe.
let g:UltiSnipsExpandTrigger='<leader>u'
"let g:UltiSnipsListSnippets='<c-tab>'

"let g:UltiSnipsJumpForwardTrigger='<c-j>'
"let g:UltiSnipsJumpBackwardTrigger='<C-k>'
"let g:UltiSnipsSnippetDirectories=["UltiSnips"]

" If you want :UltiSnipsEdit to split your window.
let g:UltiSnipsEditSplit="vertical"

" CtrlP settings
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'
let g:ctrlp_by_filename = 0
let g:ctrlp_match_window = 'bottom,order:ttb,results:10'
let g:ctrlp_switch_buffer = 'Et'
let g:ctrlp_working_path_mode = '0'
let g:ctrlp_root_markers = ['.tex', '.sty']
let g:ctrlp_user_command = 'ag %s -l --nogroup --nobreak --noheading --ignore Mail --ignore win32 --ignore Desktop --hidden --depth -1 -g ""'
let g:ctrlp_show_hidden = 1
let g:ctrlp_max_height = 20
let g:ctrlp_max_files = 0
let g:ctrlp_max_depth = 150
let g:ctrlp_clear_cache_on_exit=0
let g:ctrlp_open_new_file = 'r'

set wildignore+=*.so,*.swp,*.zip,*/.hg/*,*/.svn/*,*/.mpd/*,*/mpd/*

let g:ctrlp_custom_ignore = '\v[\/]\.(git|hg|svn|mpd|offlineimap|spf13-vim-3|adobe)$'
let g:ctrlp_custom_ignore = '*/Mail/*'

" vimroom configuration
let g:vimroom_width = 74

set backup
set backupdir=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp
set backupskip=/tmp/*,/private/tmp/*
set directory=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp
set writebackup

set nohlsearch

" turn off search highlight
nnoremap <leader><space> :nohlsearch<CR>

" toggle between number and relativenumber
"function! ToggleNumber()
"     if(&relativenumber == 1)
"             set norelativenumber
"             set number
"     else
"             set relativenumber
"     endif
"endfunc

"python-mode (originally Sections 2 and 5 options of pymode.txt)
let g:pymode = 1
let g:pymode_warnings = 1
let g:pymode_paths = []
let g:pymode_trim_whitespaces = 1
let g:pymode_options = 1
let g:pymode_quickfix_minheight = 3
let g:pymode_quickfix_maxheight = 6
let g:pymode_python = 'python'
"let g:pymode_indent = []
let g:pymode_indent = 1
let g:pymode_folding = 1
let g:pymode_motion = 1
let g:pymode_doc = 1
let g:pymode_doc_bind = 'K'
let g:pymode_virtualenv = 1
let g:pymode_virtualenv_path = $VIRTUAL_ENV
let g:pymode_run = 1
let g:pymode_run_bind = '<leader>r'
let g:pymode_breakpoint = 1
let g:pymode_breakpoint_bind = '<leader>b'
let g:pymode_breakpoint_cmd = ''
let g:pymode_lint = 1
let g:pymode_lint_on_write = 1
let g:pymode_lint_unmodified = 0
let g:pymode_lint_on_fly = 0
let g:pymode_lint_message = 1
let g:pymode_lint_checkers = ['pyflakes', 'pep8', 'mccabe']
let g:pymode_lint_ignore = "E501,W"
let g:pymode_lint_select = "E501,W0011,W430"
let g:pymode_lint_sort = []
let g:pymode_lint_cwindow = 1
let g:pymode_lint_signs = 1
let g:pymode_lint_todo_symbol = 'WW'
let g:pymode_lint_comment_symbol = 'CC'
let g:pymode_lint_visual_symbol = 'RR'
let g:pymode_lint_error_symbol = 'EE'
let g:pymode_lint_info_symbol = 'II'
let g:pymode_lint_pyflakes_symbol = 'FF'
let g:pymode_rope = 1
let g:pymode_rope_lookup_project = 0
let g:pymode_rope_project_root = ""
let g:pymode_rope_ropefolder='.ropeproject'
let g:pymode_rope_show_doc_bind = '<C-c>d'
let g:pymode_rope_regenerate_on_write = 1
let g:pymode_rope_completion = 1
let g:pymode_rope_complete_on_dot = 1
let g:pymode_rope_completion_bind = '<C-Space>'
let g:pymode_rope_autoimport = 1
let g:pymode_rope_autoimport_modules = ['os', 'shutil', 'datetime']
let g:pymode_rope_autoimport_import_after_complete = 0
let g:pymode_rope_goto_definition_bind = '<C-c>g'
let g:pymode_rope_goto_definition_cmd = 'new'
let g:pymode_rope_rename_bind = '<C-c>rr'
let g:pymode_rope_rename_module_bind = '<C-c>r1r'
let g:pymode_rope_organize_imports_bind = '<C-c>ro'
let g:pymode_rope_autoimport_bind = '<C-c>ra'
let g:pymode_rope_module_to_package_bind = '<C-c>r1p'
let g:pymode_rope_extract_method_bind = '<C-c>rm'
let g:pymode_rope_extract_variable_bind = '<C-c>rl'
let g:pymode_rope_use_function_bind = '<C-c>ru'
let g:pymode_rope_move_bind = '<C-c>rv'
let g:pymode_rope_change_signature_bind = '<C-c>rs'
let g:pymode_syntax = 1
let g:pymode_syntax_slow_sync = 1
let g:pymode_syntax_all = 1
let g:pymode_syntax_print_as_function = 0
let g:pymode_syntax_highlight_equal_operator = g:pymode_syntax_all
let g:pymode_syntax_highlight_stars_operator = g:pymode_syntax_all
let g:pymode_syntax_highlight_self = g:pymode_syntax_all
let g:pymode_syntax_indent_errors = g:pymode_syntax_all
let g:pymode_syntax_space_errors = g:pymode_syntax_all
let g:pymode_syntax_string_formatting = g:pymode_syntax_all
let g:pymode_syntax_string_format = g:pymode_syntax_all
let g:pymode_syntax_string_templates = g:pymode_syntax_all
let g:pymode_syntax_doctests = g:pymode_syntax_all
let g:pymode_syntax_builtin_objs = g:pymode_syntax_all
let g:pymode_syntax_builtin_types = g:pymode_syntax_all
let g:pymode_syntax_highlight_exceptions = g:pymode_syntax_all
let g:pymode_syntax_docstrings = g:pymode_syntax_all

autocmd FileType tex :setlocal spell spelllang=en_us
autocmd FileType tex :setlocal tw=70
" autocmd BufEnter,WinEnter,FocusGained * :setlocal number relativenumber
" autocmd WinLeave,FocusLost   * :setlocal number norelativenumber
" autocmd BufNew,InsertEnter * :set number
" autocmd InsertLeave * :set relativenumber

" highlight last inserted text
 nnoremap gV `[v`]

" jk is escape
 inoremap jk <esc>
 vnoremap jk <esc>
 cnoremap jk <esc>

" toggle gundo
nnoremap <leader>U :GundoToggle<CR>

" open ag.vim
nnoremap <leader>a :Ag

" Unmap arrow keys
"nnoremap <down> ddp
"nnoremap <up> ddkP

"Auto-center
nnoremap G Gzz
nnoremap n nzz
nnoremap N Nzz
nnoremap } }zz
nnoremap { {zz
"nmap j jzz
"nmap k kzz

" gO to create a new line below cursor in normal mode
nnoremap g<C-o> o<ESC>k

" g<Ctrl+o> to create a new line above cursor (Ctrl to prevent collision with 'go' command)
nnoremap gO O<ESC>j

inoremap <C-u> <esc>bveUe
nnoremap <C-u> bveUe

:command! -complete=file -nargs=1 Rpdf :r !pdftotext -nopgbrk <q-args> - |fmt -csw78

autocmd BufReadPre *.doc set ro
autocmd BufReadPre *.doc set hlsearch!
autocmd BufReadPost *.doc %!antiword "%"

autocmd BufReadPre *.DOC set ro
autocmd BufReadPre *.DOC set hlsearch!
autocmd BufReadPost *.DOC %!antiword "%"

autocmd BufReadPre *.rtf set ro
autocmd BufReadPre *.rtf set hlsearch!
autocmd BufReadPost *.rtf %!catdoc "%"

autocmd BufReadPre *.RTF set ro
autocmd BufReadPre *.RTF set hlsearch!
autocmd BufReadPost *.RTF %!catdoc "%"

au VimResized * :wincmd =

"nnoremap <leader>gq :%!pandoc
"vnoremap <leader>gq :!pandoc

" Auto format in insert mode

"augroup PROSE
"        autocmd InsertEnter * set formatoptions+=a
"        autocmd InsertLeave * set formatoptions-=a
"augroup END

" Reformat
noremap Q gqap

" Spell check drop down menu
nnoremap \s ea<C-X><C-S>

" Switch between code and prose
"command! Prose inoremap <buffer> . .<C-G>u|
"            \ inoremap <buffer> ! !<C-G>u|
"            \ inoremap <buffer> ? ?<C-G>u|
"            \ setlocal spell spelllang=en_us
"            \     nolist nowrap tw=74 fo=t1 nonu|
"            \ augroup PROSE|
"            \   autocmd InsertEnter <buffer> set fo+=a|
"            \   autocmd InsertLeave <buffer> set fo-=a|
"            \ augroup END
"
"command! Code silent! iunmap <buffer> .|
"            \ silent! iunmap <buffer> !|
"            \ silent! iunmap <buffer> ?|
"            \ setlocal nospell list nowrap
"            \     tw=74 fo=tcqr showbreak=… nu|
"            \ silent! autocmd! PROSE * <buffer>

" open with locate or find command
" tutorial video: https://www.youtube.com/watch?v=X0KPl5O006M
map <leader>o :exec '!xdg-open ' . shellescape(getline('.')) <CR><CR>

map <leader>mp :exec '!mplayer ' . shellescape(getline('.')) <CR><CR>

" stream justin tv ..etc
map <leader>ls :exec '!livestreamer -p mplayer ' . shellescape(getline('.')) . 'best' <CR><CR>

" watch streaming videos
map <leader>p :exec '!mplayer $(youtube-dl -g ' . shellescape(getline('.')) . ')' <CR><CR>

" download videos/files
map <leader>yt :exec '!cd ~/Downloads; youtube-dl ' . shellescape(getline('.')) <CR><CR>
map <leader>wg :exec '!cd ~/Downloads; wget -c ' . shellescape(getline('.')) <CR><CR>

" source /home/dmc/scripts/executesql.vim

iabbr Email parkermcgruderlaw@gmail.com
iabbr dem David E. McGruder
iabbr hwp H. Wallace Parker
iabbr prm Parker, McGruder \& Associates, PC
cabbr B ~/.bashrc
cabbr BP ~/.bash_profile

function! Open()
python << endPython

openfile = open('Brief/titlebrief.tex', 'r+')
openfile.read()

print(openfile.read())

endPython
endfunction

function! MakeNewBuffer()
python << endPython

def create_new_buffer(file_name, file_type, contents):
    vim.command('rightbelow vsplit {0}'.format(file_name))
    vim.command('normal! ggdG')
    vim.command('setlocal filetype={0}'.format(file_type))
    vim.command('setlocal buftype=nowrite')
    vim.command('call append(0, {0})'.format(contents))

def make_example_python_buffer():
    contents = ["def example_func():", "    print('I know kung-fu!')"]
    create_new_buffer("Example_buffer", "python", contents)

make_example_python_buffer()

endPython
endfunction


function! NewTexBuffer()
python << endPython

def create_new_buffer(file_name, file_type, contents):
    vim.command('rightbelow vsplit {0}'.format(file_name))
    vim.command('normal! ggdG')
    vim.command('setlocal filetype={0}'.format(file_type))
    vim.command('setlocal buftype=nowrite')
    vim.command('call append(0, {0})'.format(contents))

def make_example_python_buffer():
    contents = ["def example_func():", " open('~/Dropbox/Massa, Damian/Appeal/Bond/Brief/titlebrief.tex', 'r+') "]
    create_new_buffer("Tex_buffer", "tex", contents)

make_example_python_buffer()

endPython
endfunction


function! OpenFile(buf)
  python << endPython
import os, vim
f = vim.eval(str('a:buf'))
be = int(vim.eval("bufexists('%s')" % f))
if be:
  bw=int(vim.eval("bufwinnr('%s')" % f))
  if bw != -1:
	vim.command('%d wincmd w' % bw)
  else:
	vim.command('b %s' % f)
else:
  vim.command('e %s' % f)
endPython
endfunction


function! GitCase(dir)
python << endPython

import os, vim

def gitdir():
	folder = vim.eval("a:dir")
	os.system('mkdir "dir"')
	os.system('cd "dir"')

gitdir()

endPython
endfunction

function! Capdoc()
python << endPython

import shutil, vim, os
shutil.copytree('/home/dmc/Documents/ofc/capdocs6', 'CaptionedDocs')

openfile = open('./CaptionedDocs/Pleadings/casevar.sty', 'r+')
openfile.read()

print(openfile.read())

endPython
endfunction


function! FileSys()
python << endPython

import shutil
shutil.copytree('/home/dmc/Documents/ofc/fileopen/FileSys', 'FileSys')

endPython
endfunction


function! Pleading()
python << endPython

import shutil
shutil.copytree('/home/dmc/Documents/ofc/capdocs5/Pleadings', 'newdoc')

endPython
endfunction


function! Discovery()
python << endPython

import shutil
shutil.copytree('/home/dmc/Documents/ofc/capdocs5/Discovery', 'newdoc')

endPython
endfunction


function! Motion()
python << endPython

import shutil
shutil.copytree('/home/dmc/Documents/ofc/capdocs5/Motions', 'newdoc')

endPython

execute "args newdoc/**/*.sty\<cr>"
execute "argadd ../**/*.tex\<cr>"
execute "echom 'Motion loaded!'"

endfunction

function! FeynmanNote()
python << endPython

import shutil
shutil.copytree('/home/dmc/Documents/notes', 'note')

endPython
endfunction


function! Letter()
python << endPython

import shutil
shutil.copytree('/home/dmc/Documents/ofc/ltr', 'ltr')

endPython
endfunction


function! Memo()
python << endPython

import shutil
shutil.copytree('/home/dmc/Documents/ofc/memo', 'memo')

endPython
endfunction


function! MindMap()
python << endPython

import shutil
shutil.copytree('/home/dmc/Documents/ofc/notes', 'note')

endPython
endfunction


function! Pdfnum()
python << endPython

import shutil
shutil.copytree('/home/dmc/Documents/ofc/pdf', 'pdf')

endPython
endfunction


function! Printfiles()
python << endPython

import glob
print glob.glob("/home/dmc/Dropbox/German, Rashard/litfile/8docsrcvd/CDMSP/2007 Biology Procedures Manual/Procedure Manual/Hyperlinks/*.pdf")

endPython
endfunction

