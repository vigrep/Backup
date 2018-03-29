" Module's Vimrc
""" INITIATE		{{{
set nocompatible	" ������ģʽ�����ڵ�һ�в��ܱ�֤����ѡ�����
filetype plugin on
syntax on

"set mapleader
let mapleader = ","

" Platform
function! MySys()
	if has("win32")
		return "windows"
	else
		return "linux"
	endif
endfunction

"""""""""""""""""""""""""""""""""""""""""""TEST
"if MySys() == 'windows'
"	map e iwindows
"elseif MySys() == 'linux'
"	map e ilinux
"endif
"""""""""""""""""""""""""""""""""""""""""""

if MySys() == 'windows'
    "source $VIMRUNTIME/vimrc_example.vim
    source $VIMRUNTIME/../vimfiles/mswin-mine.vim
    behave mswin

    set diffexpr=MyDiff()
    function! MyDiff()
        let opt = '-a --binary '
        if &diffopt =~ 'icase' | let opt = opt . '-i ' | endif
        if &diffopt =~ 'iwhite' | let opt = opt . '-b ' | endif
        let arg1 = v:fname_in
        if arg1 =~ ' ' | let arg1 = '"' . arg1 . '"' | endif
        let arg2 = v:fname_new
        if arg2 =~ ' ' | let arg2 = '"' . arg2 . '"' | endif
        let arg3 = v:fname_out
        if arg3 =~ ' ' | let arg3 = '"' . arg3 . '"' | endif
        let eq = ''
        if $VIMRUNTIME =~ ' '
          if &sh =~ '\<cmd'
            let cmd = '""' . $VIMRUNTIME . '\diff"'
            let eq = '"'
          else
            let cmd = substitute($VIMRUNTIME, ' ', '" ', '') . '\diff"'
          endif
        else
          let cmd = $VIMRUNTIME . '\diff'
        endif
        silent execute '!' . cmd . ' ' . opt . arg1 . ' ' . arg2 . ' > ' . arg3 . eq
    endfunction
elseif MySys() == 'linux'
endif


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""" }}}
""" FUNCTION		{{{
let g:M_cmprg=0
function! ChangeMakeprg()
	if g:M_cmprg==0
		setl makeprg=g++\ -Wall\ -I/home/lixl/mysoft/boost_1_42_0\ -o%<.out\ %
		echo "g++ -I/boost"
		" let g:M_cmprg=1
	elseif g:M_cmprg==1
		setl makeprg=make\ -j\ 2
		echo "make -j 2"
		let g:M_cmprg=0
	endif
endfunction

let g:M_hc=0
function! M_HideCursor()
	if g:M_hc==0
		highlight Cursor gui=NONE guifg=NONE guibg=NONE
		let g:M_hc=1
	else
		highlight Cursor gui=NONE guifg=black guibg=yellow
		let g:M_hc=0
	endif
endfunction

function! SwitchToBuf(filename)
	"let fullfn = substitute(a:filename, "^\\~/", $HOME . "/", "")
	" find in current tab
	let bufwinnr = bufwinnr(a:filename)
	if bufwinnr != -1
		exec bufwinnr . "wincmd w"
		return
	else
	" find in each tab
		tabfirst
		let tab = 1
		while tab <= tabpagenr("$")
				let bufwinnr = bufwinnr(a:filename)
				if bufwinnr != -1
					exec "normal " . tab . "gt"
					exec bufwinnr . "wincmd w"
					return
				endif
				tabnext
				let tab = tab + 1
		endwhile
		" not exist, new tab
		exec "tabnew " . a:filename
	endif
endfunction

" lookup file with ignore case ���Դ�СС��ѯ�ļ�
function! LookupFile_IgnoreCaseFunc(pattern)
	let _tags = &tags
	try
		let &tags = eval(g:LookupFile_TagExpr)
		let newpattern = '\c' . a:pattern
		let tags = taglist(newpattern)
	catch
		echohl ErrorMsg | echo "Exception: " . v:exception | echohl NONE
		return ""
	finally
		let &tags = _tags
	endtry
	" Show the matches for what is typed so far.
	let files = map(tags, 'v:val["filename"]')
	return files
endfunction
let g:LookupFile_LookupFunc = 'LookupFile_IgnoreCaseFunc'

" Correct front words
function! CorrectFrontWord()
	normal m`
	normal [s
	normal 1z=
	normal ``
endfunction

" ɾ��ĩβ�Ķ���ո�
function! RemoveTrailingSpace()
	normal m`
	"silent! :%s/\s\+$//e
	silent! :%s/\s\+$//e
	"silent! :noh<cr>
	normal ``
endfunction

" �����С������
let g:MineIfMax=0
function! IfMaxMize()
	if g:MineIfMax == 0
		silent :simalt ~x
		let g:MineIfMax = 1
	else
		silent :simalt ~r
		let g:MineIfMax = 0
	endif
endfunction

let g:MineFdm=1
function! ChangeFdm()
	if g:MineFdm == 0
		silent :set fdm=manual
		let g:MineFdm=1
	elseif g:MineFdm == 1
		silent :set fdm=marker
		let g:MineFdm=2
	elseif g:MineFdm == 2
		silent :set fdm=indent
		let g:MineFdm=0
	endif
endfunction

function! CppSetting()
	set autoindent 		" �̳�ǰһ�е�������ʽ���ر������ڶ���ע��
	set smartindent 	" ΪC�����ṩ�Զ�����
	set cindent 		" ʹ��C��ʽ������
	set tabstop=4
	set shiftwidth=4 	" ��������Ϊ4
	"set softtabstop=4 	" �������Ʊ���
	set nu
	set nowrap
	"Change buffer - without saving
	set hid
	setl tags=tags
	setl fdm=syntax
	setl foldlevel=7
	"if has("gui_running")
		"set cursorline
		"hi cursorline guibg=#333333
		"hi CursorColumn guibg=#333333
	"endif
	setl makeprg=make\ -j\ 2
	"setl makeprg=g++\ -Wall\ -o%<.out\ %
	"setl makeprg=g++\ -Wall\ -I/home/lixl/boost_1_42_0\ -o%<.out\ %
	"setl makeprg=g++\ -Wall\ -o%<.out\ \*.cpp
	"setl makeprg=icc\ -Wall\ -o%<.out\ \*.cpp
	"setl makeprg=icc\ \*.cpp
	"setl makeprg=g++\ -Wall\ -I/home/lixl/boost_1_42_0\ -o%<.out\ \*.cpp
	"setl makeprg=gcc\ -Wall\ -o%<.out\ %
	"setl makeprg=gcc\ -Wall\ -o%<.out\ \*.c
	map <buffer> <leader><space> :wa<cr>:make<cr>
	inoremap <buffer> 0o cout <<
	inoremap <buffer> 0i cin >>
endfunction

" �����С������
let g:MineIfMouse=0
function! IfMouse()
	if g:MineIfMouse == 0
		set mouse=a
		let g:MineIfMouse = 1
	else
		set mouse=""
		let g:MineIfMouse = 0
	endif
endfunction


let filetype_m='objc'
function! ObjcSetting()
	set autoindent 		" �̳�ǰһ�е�������ʽ���ر������ڶ���ע��
	set smartindent 	" ΪC�����ṩ�Զ�����
	set tabstop=4
    set nowrap
    set ignorecase smartcase
	set shiftwidth=4 	" ��������Ϊ4
	set expandtab
	set nu
	set hid
	setl fdm=syntax
	setl foldlevel=7
endfunction



""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""" }}}
""" PLUG SET		{{{

""""""""""""""""""""""""""""""
" markbrowser setting
""""""""""""""""""""""""""""""
nmap <silent> <leader>mk :MarksBrowser<cr>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" SHOWMARK
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"ShowMarks������Ѿ�������һЩ��ݼ���
"<leader>mt - ��/�ر�ShowMarks���
"<leader>mo - ǿ�ƴ�ShowMarks���
"<leader>mh - �����ǰ�еı��
"<leader>ma - �����ǰ�����������еı��
"<leader>mm - �ڵ�ǰ�д�һ����ǣ�ʹ����һ�����õı����

let showmarks_enable = 0
" Show which marks
let showmarks_include = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ"
" Ignore help, quickfix, non-modifiable buffers
let showmarks_ignore_type = "hqm"
" Hilight lower & upper marks
let showmarks_hlline_lower = 1
let showmarks_hlline_upper = 1

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" ���ܲ�ȫ OMNI
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"�ر�cpp���ܲ�ȫ
let OmniCpp_MayCompleteDot = 0
let OmniCpp_MayCompleteArrow = 0
let OmniCpp_MayCompleteScope = 0

" ʹ��pumvisible()���ж������˵��Ƿ���ʾ
inoremap <expr> <CR> pumvisible()?"\<C-Y>":"\<CR>"
"��������˵��������س�ӳ��Ϊ���ܵ�ǰ��ѡ��Ŀ��������ӳ��Ϊ�س�
inoremap <expr> <C-J> pumvisible()?"\<PageDown>\<C-N>\<C-P>":"\<C-X><C-O>"
"��������˵�������CTRL-Jӳ��Ϊ�������˵������·�ҳ������ӳ��ΪCTRL-X CTRL-O
"inoremap <expr> <C-K> pumvisible()?"\<PageUp>\<C-P>\<C-N>":"\<C-K>"
"��������˵�������CTRL-Kӳ��Ϊ�������˵������Ϸ�ҳ��������ӳ��ΪCTRL-K
"inoremap <expr> <C-U> pumvisible()?"\<C-E>":"\<C-U>"
"��������˵�������CTRL-Uӳ��ΪCTRL-E����ֹͣ��ȫ��������ӳ��ΪCTRL-U

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" �Զ���ȫ OMNI
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"���в�ȫ			CTRL-X CTRL-L
"���ݵ�ǰ�ļ���ؼ��ֲ�ȫ	CTRL-X CTRL-N
"�����ֵ䲹ȫ			CTRL-X CTRL-K
"����ͬ����ֵ䲹ȫ		CTRL-X CTRL-T
"����ͷ�ļ��ڹؼ��ֲ�ȫ		CTRL-X CTRL-I
"���ݱ�ǩ��ȫ			CTRL-X CTRL-]
"��ȫ�ļ���			CTRL-X CTRL-F
"��ȫ�궨��			CTRL-X CTRL-D
"��ȫvim����			CTRL-X CTRL-V
"�û��Զ��岹ȫ��ʽ		CTRL-X CTRL-U
"ƴд����			CTRL-X CTRL-S

"inoremap <C-]> <C-X><C-]>
inoremap <C-F> <C-X><C-F>
"inoremap <C-D> <C-X><C-D>
inoremap <C-L> <C-X><C-L>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" QUICKFIX
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

nmap <leader>cn :cn<cr>
nmap <leader>cp :cp<cr>
nmap <leader>cw :botright cw 10<cr><c-w><c-w>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" cscope setting
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
if MySys() == 'linux'
	if has("cscope") && filereadable("/usr/local/bin/cscope")
		set csprg=/usr/local/bin/cscope
		set csto=1
		set cst
		set nocsverb
		" add any database in current directory
		if filereadable("cscope.out")
			cs add cscope.out
		" else add database pointed to by environment
		elseif $CSCOPE_DB != ""
			cs add $CSCOPE_DB
		endif
		set csverb
	endif

	nmap <silent> <leader>ac :cs add cscope.out<cr>

	nmap <C-c>s :cs find s <C-R>=expand("<cword>")<CR><CR>
	nmap <C-c>g :cs find g <C-R>=expand("<cword>")<CR><CR>
	nmap <C-c>d :cs find d <C-R>=expand("<cword>")<CR><CR>
	nmap <C-c>c :cs find c <C-R>=expand("<cword>")<CR><CR>
	nmap <C-c>t :cs find t<space>
	nmap <C-c>e :cs find e<space>
	nmap <C-c>f :cs find f<space>
	"nmap <C-c>t :cs find t <C-R>=expand("<cword>")<CR><CR>
	"nmap <C-c>e :cs find e <C-R>=expand("<cword>")<CR><CR>
	"nmap <C-c>f :cs find f <C-R>=expand("<cfile>")<CR><CR>
	nmap <C-c>i :cs find i ^<C-R>=expand("<cfile>")<CR>$<CR>

	nmap <C-c>h :echo " s: ����C���Է��ţ������Һ��������ꡢö��ֵ�ȳ��ֵĵط�\n g: ���Һ������ꡢö�ٵȶ����λ�ã�����ctags���ṩ�Ĺ���\n d: ���ұ��������õĺ���\n c: ���ҵ��ñ������ĺ���\n t: ����ָ�����ַ���\n e: ����egrepģʽ���൱��egrep���ܣ��������ٶȿ����\n f: ���Ҳ����ļ�������vim��find����\n i: ���Ұ������ļ����ļ�"<cr>

endif
" s: ����C���Է��ţ������Һ��������ꡢö��ֵ�ȳ��ֵĵط�
" g: ���Һ������ꡢö�ٵȶ����λ�ã�����ctags���ṩ�Ĺ���
" d: ���ұ��������õĺ���
" c: ���ҵ��ñ������ĺ���
" t: ����ָ�����ַ���
" e: ����egrepģʽ���൱��egrep���ܣ��������ٶȿ����
" f: ���Ҳ����ļ�������vim��find����
" i: ���Ұ������ļ����ļ�

""""""""""""""""""""""""""""""
" Tag list (ctags)
""""""""""""""""""""""""""""""
if MySys() == "windows"
	let Tlist_Ctags_Cmd = 'ctags'
elseif MySys() == "linux"
	let Tlist_Ctags_Cmd = '/usr/bin/ctags' "�趨linuxϵͳ��ctags�����λ��
endif

let Tlist_Show_One_File = 1 "��ͬʱ��ʾ����ļ���tag��ֻ��ʾ��ǰ�ļ���
let Tlist_Exit_OnlyWindow = 1 "���taglist���������һ�����ڣ����˳�vim
let Tlist_Use_Right_Window = 1 "���Ҳര������ʾtaglist����
let Tlist_Use_SingleClick = 1 "�����򿪱�ǩ
""""""""""""""""""""""""""""""
" Ctags
""""""""""""""""""""""""""""""
set tags=tags;

""""""""""""""""""""""""""""""
" netrw setting
""""""""""""""""""""""""""""""
nmap <silent> <leader>fe :Sexplore!<cr>
let g:netrw_winsize = 30

""""""""""""""""""""""""""""""
" BufExplorer
""""""""""""""""""""""""""""""
let g:bufExplorerDefaultHelp=0
let g:bufExplorerShowRelativePath=1
let g:bufExplorerSortBy='mru'
let g:bufExplorerSplitRight=0
let g:bufExplorerSplitVertical=1
let g:bufExplorerSplitVertSize=30
let g:bufExplorerUseCurrentWindow=1
autocmd BufWinEnter \[Buf\ List\] setl

"""""""""""""""""""""""""""""""
" winManager setting
""""""""""""""""""""""""""""""
if MySys() == "linux"
	"let g:winManagerWindowLayout = "BufExplorer,FileExplorer|TagList"
	let g:winManagerWindowLayout = "FileExplorer|TagList"
	let g:winManagerWidth = 30
	let g:defaultExplorer = 0
	nmap <C-W><C-F> :FirstExplorerWindow<cr>
	nmap <C-W><C-B> :BottomExplorerWindow<cr>
endif


""""""""""""""""""""""""""""""
" lookupfile setting
""""""""""""""""""""""""""""""
" let g:LookupFile_MinPatLength = 2               "��������2���ַ��ſ�ʼ����
" let g:LookupFile_PreserveLastPattern = 0        "�������ϴβ��ҵ��ַ���
" let g:LookupFile_PreservePatternHistory = 1     "���������ʷ
" let g:LookupFile_AlwaysAcceptFirst = 1          "�س��򿪵�һ��ƥ����Ŀ
" let g:LookupFile_AllowNewFiles = 0              "���������������ڵ��ļ�
" let g:LookupFile_ableDefaultMap = 0 			"�ر�Ĭ��ӳ��
" if filereadable("./filenametags")                "����tag�ļ�������
" 	let g:LookupFile_TagExpr = '"./filenametags"'
" endif
" "ӳ��LookupFileΪ,lk
" "nmap <silent> <leader>lk <Plug>LookupFile<cr>
" "ӳ��LUBufsΪ,ll
" nmap <silent> <leader>ll :LUBufs<cr>
" "ӳ��LUWalkΪ,lw
" nmap <silent> <leader>lw :LUWalk<cr>
" nmap <silent> <leader>lk :LUWalk<cr>

""""""""""""""""""""""""""""""""""""""""""
"LAMMPS
""""""""""""""""""""""""""""""""""""""""""
if MySys() == "linux"
	au  BufNewFile,BufReadPost *.lmp so ~/.vim/all_file/lammps.vim
	autocmd FileType lmp so ~/.vim/all_file/lammps.vim
	nmap <silent> <leader>lm :set ft=lmp<cr>
endif

""""""""""""""""""""""""""""""""""""""""""
" CSUPPORT
""""""""""""""""""""""""""""""""""""""""""
"�������Զ���ע���ַ�
" let g:C_TemplateOverwrittenMsg = 'no'
" let g:C_Ctrl_j = 'off'
" let g:C_TemplateOverwrittenMsg= 'yes'
" \ss ����switch�ṹ 	\im ����main����
" \ntr �ض�ģ�� 		\hp �鿴����
" ����Note�ṹswitch
"noremap  <buffer>  <silent>  <LocalLeader>sn        :call C_InsertTemplate("statements.switch-note")<CR>

""""""""""""""""""""""""""""""""""""""""""
" MARK
""""""""""""""""""""""""""""""""""""""""""
nmap <silent> <leader>mn <Plug>MarkSet
nmap <silent> <leader>nm <Plug>MarkClear
nmap <silent> <leader>rm :source ~/.vim/plugin/mark.vim<cr>

""""""""""""""""""""""""""""""""""""""""""
" Session manageer
""""""""""""""""""""""""""""""""""""""""""
" list sessions to open
nmap <silent> <leader>ls :SessionList<cr>
" make session
nmap <leader>ms :SessionSave<cr>

""""""""""""""""""""""""""""""""""""""""""
" CCtree
""""""""""""""""""""""""""""""""""""""""""
"let g:CCTreeCscopeDb = "cscope.out"
"let g:CCTreeOrientation = "topleft"
"nmap <silent> <leader>st :CCTreeWindowToggle<cr>

""""""""""""""""""""""""""""""""""""""""""
" VIM GDB
""""""""""""""""""""""""""""""""""""""""""
let g:vimgdb_debug_file = ""
"run macros/gdb_mappings_modified.vim
"run macros/gdb_mappings.vim
nmap <silent> <leader>vg :bel 30vsplit gdb-variables<cr>
nmap <silent> <leader>gdb :run macros/gdb_mappings.vim<cr>
nmap <leader>hg :echo "\n \tSpace launch the interactive gdb input-line window\n \tCTRL-Z  send an interrupt to GDB and the program it is running\n \tB\tinfo breakpoints\n \tL\tinfo locals\n \tA\tinfo args\n \tS\tstep\n \tI\tstepi\n \tCTRL-N\tnext: next source line, skipping all function calls\n \tX\tnexti\n \tF\tfinish\n \tR\trun\n \tQ\tquit\n \tC\tcontinue\n \tW\twhere\n \tCTRL-U\tup: go up one frame\n \tCTRL-D\tdown: go down one frame\n \tCTRL-B\tset a breakpoint on the line where the cursor is located\n \tCTRL-E\tclear all breakpoints on the line where the cursor is located\n \tCTRL-P\tNormal mode: print value of word under cursor\n \t\tVisual mode: GDB command createvar selected expression, see\n \t\tgdb-variables\n \tCTRL-X\tprint value of data referenced by word under cursor\n \n CTRL-B and CTRL-E operate both on source code and on disassembled code in\n assembly buffers.\n"<cr>

""""""""""""""""""""""""""""""""""""""""""
" Tex
""""""""""""""""""""""""""""""""""""""""""
" IMPORTANT: win32 users will need to have 'shellslash' set so that latex
" can be called correctly.
"set shellslash

" IMPORTANT: grep will sometimes skip displaying the file name if you
" search in a singe file. This will confuse Latex-Suite. Set your grep
" program to always generate a file-name.
"set grepprg=grep\ -nH\ $*

" OPTIONAL: Starting with Vim 7, the filetype of empty .tex files defaults to
" 'plaintex' instead of 'tex', which results in vim-latex not being loaded.
" The following changes the default filetype back to 'tex':
"let g:tex_flavor='latex'
""""""""""""""""""""""""""""""""""""""""""
" FuzzyFinder
""""""""""""""""""""""""""""""""""""""""""
" nmap <silent> <F5> :FufFile<cr>
nmap <silent> <F5> :FufLine<cr>
nmap <silent> <leader>lk :FufFile<cr>
nmap <silent> <leader>ff :FufFile<cr>
nmap <silent> <leader>fq :FufQuickfix<cr>
nmap <silent> <leader>fu :FufRenewCache<cr>
nmap <silent> <leader>ft :FufTag<cr>
nmap <silent> <leader>fl :FufLine<cr>
" nmap <silent> <leader>fj :FufJumpList<cr>
" nmap <silent> <leader>fc :FufChangeList<cr>

""""""""""""""""""""""""""""""""""""""""""
" MRU
""""""""""""""""""""""""""""""""""""""""""
" if MySys() == 'windows'
" 	let MRU_File = $VIMRUNTIME.'/_vim_mru_files' " which file to save mru entries
" elseif MySys() == "linux"
" 	let MRU_File = '/Users/lixl/.vim/.vim_mru_files' " which file to save mru entries
" endif
" let MRU_Max_Entries = 20 " max mru entries in _vim_mru_files
" nmap <silent> <leader>mr :MRU<cr>
" nmap <silent> <leader>mu :MRU<cr>

""""""""""""""""""""""""""""""""""""""""""
" FencView
""""""""""""""""""""""""""""""""""""""""""
nmap <silent> <leader>fc :FencView<cr>
let g:fencview_autodetect = 0

"""""""""""""""""""""""""""""""""""""""""""""""}}}
""" SETTING		{{{

"Fast edit vimrc
if MySys() == 'linux'
	"Fast reloading of the .vimrc
	map <silent> <leader>ss :source ~/.vimrc<cr>
	"Fast editing of .vimrc
	map <silent> <leader>ee :call SwitchToBuf("~/.vimrc")<cr>
	"When .vimrc is edited, reload it
	autocmd! bufwritepost .vimrc source ~/.vimrc
elseif MySys() == 'windows'
	" Set helplang
	"set helplang=cn
	"Fast reloading of the _vimrc
	nmap <silent> <leader>ss :source $VIM/_vimrc<cr>
	"Fast editing of _vimrc
	nmap <silent> <leader>ee :call SwitchToBuf("$VIM/_vimrc")<cr>
	"When _vimrc is edited, reload it
	autocmd! bufwritepost _vimrc source $VIM/_vimrc
endif

if has("gui_running")
	source $VIMRUNTIME/menu.vim
	set wildmenu
	set cpo-=<
	set wcm=<C-Z>
endif

if has("gui_running")
    "���ֹͣ��˸
    set guicursor+=n-v-i-c-r:block-cursor-blinkon0
    "�򻯽���
    set guioptions-=m
    set guioptions-=T
    set guioptions-=L
    set guioptions-=l
    set guioptions-=r
    set guioptions-=R

    "������С ����ɫ
    if MySys() == "linux"
        "winpos 0 30
        " set lines=50 columns=90
		" set gfn=Monospace
		"colo mine-darkblue2
		colo molokai_term
    elseif MySys() == "windows"
		"set gfn=YaHei\ Consolas\ Hybrid:h10.5
		set gfn=Yahei\ Mono:h10.5
		"colorscheme darkblue
		"colorscheme molokai
		"colorscheme solarized
		colorscheme molokai_term
    endif


else
    if MySys() == "linux"
    	"colo mine-desert256
    	"colo gardener-mine
		" colo mine-elflord
    	"colo jammy
		colo marklar
    elseif MySys() == "windows"
		"colo mine-bluegreen
		colo molokai
    endif
endif

"��ǰ����һ����б��ʱ����Щ�ַ���������ĺ��塣�������г���
set magic

"����ʱ���ѱ��ֵ�������
set linebreak

"""""""""""""""""""""""""""""""""""""TEXT FILE
"if &filetype==""
"	colo mine-matrix
"endif

"һ����ĵ���matrix��ɫ����������
if has("gui_running")
	"au BufNewFile,BufRead *.txt	colo mine-matrix
endif
"au BufNewFile,BufRead *.txt	map <buffer> <up> <c-y>
"au BufNewFile,BufRead *.txt	map <buffer> <down> <c-e>

"""""""""""""""""""""""""""""""""""""C SETTING

autocmd FileType c,cpp call CppSetting()

"""""""""""""""""""""""""""""""""""""C SETTING
autocmd FileType objc,objcpp call ObjcSetting()

"""""""""""""""""""""""""""""""""""""""""" PHP setting

function! PhpSetting()
	set autoindent 		" �̳�ǰһ�е�������ʽ���ر������ڶ���ע��
	set smartindent 	" ΪC�����ṩ�Զ�����
	set encoding=utf8
	set tabstop=4
	set shiftwidth=4 	" ��������Ϊ4
	set nu
	set nowrap
	set hid
	set ff=dos
    " set expandtab

    " source ~/.vim/phpfolding.vim
	setlocal foldmethod=manual
	" DisablePHPFolds
	setl foldlevel=7
	" nmap <silent> <leader>po <Esc>:EnablePHPFolds<Cr>
	" nmap <silent> <leader>pc <Esc>:DisablePHPFolds<Cr>
endfunction
autocmd FileType php call PhpSetting()
autocmd FileType javascript call PhpSetting()

"""""""""""""""""""""""""""""""""""""""""" Java setting

function! JavaSetting()
	"Take care of indents for Java.
    set nocursorline
	set autoindent
	set si
    set nu
    set nowrap
	set tabstop=4
	set shiftwidth=4
	"Java anonymous classes. Sometimes, you have to use them.
	set cinoptions+=j1
	let java_comment_strings=1
	let java_highlight_java_lang_ids=1
	let java_mark_braces_in_parens_as_errors=1
	let java_highlight_all=1
	let java_highlight_debug=1
	let java_ignore_javadoc=1
	let java_highlight_java_lang_ids=1
	let java_highlight_functions="style"
	let java_minlines = 150
endfunction
autocmd FileType java call JavaSetting()

"""""""""""""""""""""""""""""""""""""""""" SUPERTAB
let g:m_disable_supertab = 1
function! ToggleSuperTab()
	if g:m_disable_supertab == 1
		let b:SuperTabDisabled = 1
		let g:m_disable_supertab = 0
		echo "Disable SUPERTAB"
	else
		let b:SuperTabDisabled = 0
		let g:m_disable_supertab = 1
		echo "Enable SUPERTAB"
	endif
endfunction
let g:SuperTabCrMapping = 0
"let g:SuperTabRetainCompletionType = 2
"let g:SuperTabDefaultCompletionType = "<C-X><C-P>"
let g:SuperTabDefaultCompletionType = "<C-P>"
let g:SuperTabMappingTabLiteral = "<S-Tab>"
inoremap <c-k> <tab>
"��c-g����tab
" autocmd FileType c,cpp inoremap <c-k> <tab>
" ֻ��ȫ��ǰ�ļ��еĴ���
set complete=.,w,b,u,t
" set complete=.,w,b,u,t,i

""""""""""""""""""""""""""""""""""""""""""
" NeoComplCache
""""""""""""""""""""""""""""""""""""""""""
" let g:NeoComplCache_DisableAutoComplete = 1
" "let g:SuperTabDefaultCompletionType = '<C-X><C-U>'
" """"""""""""""""""""
"
" " Disable AutoComplPop.
" let g:acp_enableAtStartup = 0
" " Use neocomplcache.
" let g:neocomplcache_enable_at_startup = 1
" " Use smartcase.
" let g:neocomplcache_enable_smart_case = 1
" " Use camel case completion.
" let g:neocomplcache_enable_camel_case_completion = 1
" " Use underbar completion.
" let g:neocomplcache_enable_underbar_completion = 1
" " Set minimum syntax keyword length.
" let g:neocomplcache_min_syntax_length = 3
" let g:neocomplcache_lock_buffer_name_pattern = '\*ku\*'
"
" " Define dictionary.
" let g:neocomplcache_dictionary_filetype_lists = {
"     \ 'default' : '',
"     \ 'vimshell' : $HOME.'/.vimshell_hist',
"     \ 'scheme' : $HOME.'/.gosh_completions'
" 	\ }
"
" " Define keyword.
" if !exists('g:neocomplcache_keyword_patterns')
"     let g:neocomplcache_keyword_patterns = {}
" endif
" let g:neocomplcache_keyword_patterns['default'] = '\h\w*'
"
" " Plugin key-mappings.
" imap <C-k>     <Plug>(neocomplcache_snippets_expand)
" smap <C-k>     <Plug>(neocomplcache_snippets_expand)
" inoremap <expr><C-g>     neocomplcache#undo_completion()
" inoremap <expr><C-l>     neocomplcache#complete_common_string()
"
" " SuperTab like snippets behavior.
" "imap <expr><TAB> neocomplcache#sources#snippets_complete#expandable() ? "\<Plug>(neocomplcache_snippets_expand)" : pumvisible() ? "\<C-n>" : "\<TAB>"
"
" " Recommended key-mappings.
" " <CR>: close popup and save indent.
" inoremap <expr><CR>  neocomplcache#smart_close_popup() . (&indentexpr != '' ? "\<C-f>\<CR>X\<BS>":"\<CR>")
" " <TAB>: completion.
" inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
" " <C-h>, <BS>: close popup and delete backword char.
" inoremap <expr><C-h> neocomplcache#smart_close_popup()."\<C-h>"
" inoremap <expr><BS> neocomplcache#smart_close_popup()."\<C-h>"
" inoremap <expr><C-y>  neocomplcache#close_popup()
" inoremap <expr><C-e>  neocomplcache#cancel_popup()
"
" " AutoComplPop like behavior.
" "let g:neocomplcache_enable_auto_select = 1
"
" " Enable omni completion.
" autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
" autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
" autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
" autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
" autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags
"
" " Enable heavy omni completion.
" if !exists('g:neocomplcache_omni_patterns')
" 	let g:neocomplcache_omni_patterns = {}
" endif
" let g:neocomplcache_omni_patterns.ruby = '[^. *\t]\.\w*\|\h\w*::'
"autocmd FileType ruby setlocal omnifunc=rubycomplete#Complete

""""""""""""""""""""""""""""""""""""""""""HELP READING
"autocmd FileType help nmap <buffer> j <c-e>
"autocmd FileType help nmap <buffer> k <c-y>
"autocmd FileType help noremap <buffer> J <down>
"autocmd FileType help noremap <buffer> K <up>
"autocmd FileType help nmap <buffer> H <left>
"autocmd FileType help nmap <buffer> L <right>
"autocmd FileType help nmap <buffer> q <c-w>c:set virtualedit=""<cr>:file<cr>
"autocmd FileType help setl so=0
"autocmd FileType help setl virtualedit=all
""""""""""""""""""""""""""""""""""""""""""HELP END

"Super paste
if MySys() == "linux"
	inoremap <c-v> <esc>:set paste<cr>mui<C-R>+<esc>mv'uV'v=:set nopaste<cr>
endif

"Always hide the statusline
set laststatus=2

function! CurDir()
   let curdir = substitute(getcwd(), 'c:/Documents and Settings/����Ұ��/', "~/", "g")
   return curdir
endfunction

"Format the statusline
"set statusline=\ %F%m%r%h\ %w\ \ CWD:\ %r%{CurDir()}%h\ \ \ Line:\ %l/%L:%c\ [%{(&fenc==\"\")?&enc:&fenc}%{(&bomb?\",BOM\":\"\")}]
"set statusline=\ %F%m%r%h\ %w\ \ Line:\ %l/%L:%c\ [%{(&fenc==\"\")?&enc:&fenc}%{(&bomb?\",BOM\":\"\")}]\ %{strftime(\"%d/%m/%y\ -\ %H:%M\")}
"set statusline=%t[%{strlen(&fenc)?&fenc:'none'},%{&ff}]%h%m%r%y%=%c,%l/%L\ %P
"set statusline=%F%m%r%h%w\ [FORMAT=%{&ff}]\ [TYPE=%Y]\ [POS=%l,%v][%p%%]\ %{strftime(\"%d/%m/%y\ -\ %H:%M\")}
" jamessan's
"set statusline=   " clear the statusline for when vimrc is reloaded
""set statusline+=%-3.3n\                      " buffer number
"set statusline+=%F\                          " file name
"set statusline+=%h%m%r%w                     " flags
"set statusline+=[%{strlen(&ft)?&ft:'none'},  " filetype
"set statusline+=%{strlen(&fenc)?&fenc:&enc}, " encoding
"set statusline+=%{&fileformat}]              " file format
"set statusline+=%=                           " right align
""set statusline+=%{synIDattr(synID(line('.'),col('.'),1),'name')}\  " highlight
"set statusline+=%b,0x%-8B\                   " current char
"set statusline+=%-14.(%l,%c%V%)\ %<%P        " offset

"Set to auto read when a file is changed from the outside
set autoread

"set expandtab	"��tab����չ�ɿո�

set cmdheight=1

"Ĭ��ΪӢ�İ���
"set helplang=en

"��vim�в鿴Man
runtime ftplugin/man.vim

"ȥ��ÿ�п�ͷ��ʾ��"@"
set dy=lastline

"Enable filetype plugin
filetype plugin on
"filetype indent on

set incsearch
set ignorecase smartcase
"set hls
set showcmd

if MySys() == "linux"
	set directory=/tmp,.,~/tmp,/var/tmp
elseif MySys() == "windows"
	set directory=$HOME,.,d:\temp
endif

set wildmenu "��ʾ�����ѡѡ��

"No sound on errors.
set noerrorbells
set novisualbell
set t_vb=

"��vi�Զ�ʶ�����
" set fencs=gb18030,gbk,gb2312,big5,euc-jp,euc-kr,latin1,cp936,utf-8,ucs-bom
set fileencodings=utf-8,gbk,ucs-bom

"����Ŀ¼Ϊ��ǰĿ¼
set autochdir

" ������ʱ����ʾ�Ǹ�Ԯ���������ͯ����ʾ
set shortmess=atI

"ʹ�����
set mouse=""

set bs=2		" allow backspacing over everything in insert mode
set nobackup
"set backup		" keep a backup file
"set viminfo='20,\"50	" read/write a .viminfo file, don't store more
			" than 50 lines of registers
set history=50		" keep 50 lines of command line history
"set ruler		" show the cursor position all the time

" Only do this part when compiled with support for autocommands
if has("autocmd")
  " In text files, always limit the width of text to 78 characters
  "autocmd BufRead *.txt set tw=78
  " When editing a file, always jump to the last cursor position
  autocmd BufReadPost *
  \ if line("'\"") > 0 && line ("'\"") <= line("$") |
  \   exe "normal! g'\"" |
  \ endif
endif


if &term=="xterm"
     set t_Co=8
     set t_Sb=[4%dm
     set t_Sf=[3%dm
endif

"hi MatchParen ctermbg=Yellow

"��ֹ���İ��ɾ
set ambiwidth=double

"""""""""""""""""""""""""""""""""""""""""""""""""}}}
""" MAP SET
" ��������� {{{

" �鿴�ϴ����鿴�İ����ĵ�
nmap <c-f1> :h <up><cr>

if has("gui_running")
    "�������ò˵�
    nmap <silent> <m-F2> :if &guioptions =~# 'T' <Bar>
    	   \set guioptions-=T <Bar>
    	   \set guioptions-=m <Bar>
	   \set guioptions-=r <Bar>
       \else <Bar>
    	   \set guioptions+=T <Bar>
    	   \set guioptions+=m <Bar>
	   \set guioptions+=r <Bar>
       \endif<CR>
endif

nmap <f2> <Plug>MarkSet
nmap <c-f2> <Plug>MarkClear

"if has("gui_running")
"    nmap <F4> :emenu <C-Z>
"endif

"<F4>�л�taglist�򿪻�ر�
nmap <F4> :TlistToggle<cr>
imap <F4> <C-O>:TlistToggle<CR>


"autocmd FileType c,cpp map <f5> :w<cr>:make<cr>:!./%<.out<cr>
" autocmd FileType cpp map <f6> :!ctags -R --c++-kinds=+p --fields=+iaS --extra=+q .<cr>
" autocmd FileType c map <f6> :!ctags -R .<cr>

"nmap <f7> :call ChangeFdm()<cr>:set fdm<cr>
"nmap <f7> <Plug>LookupFile<cr>
"nmap <F7> :LUWalk<cr>

"set screensaver Matrix
nmap <F8> :Matrix<cr>

if MySys() == 'windows' && has("gui_running")
	nmap <silent> <f11> :call IfMaxMize()<cr>
	nmap <F12> :simalt ~n<cr>
endif


"""}}}
"��ͨ������ {{{

if has("gui_running") " ӳ������Alt+XX������ֻ��Gui�������ӳ�䣩
	imap <m-h> <left>
	imap <m-l> <right>
	imap <m-j> <down>
	imap <m-k> <up>
endif

"autocmd FileType c,cpp nmap <buffer> f zf%

" ��tab���������۵�
nnoremap <silent> <s-tab> @=((foldclosed(line('.')) < 0) ? 'zc' : 'zo')<cr>
"nnoremap <silent> <s-tab> zv<cr>
"nnoremap <silent> <s-tab> @=((foldclosed(line('.')) < 0) ? 'zv' : 'zx')<cr>

imap <c-u> <cr>
inoremap <c-u><c-u> <c-u>

" ����������
cnoremap <C-A>    <Home>
cnoremap <C-E>    <End>

"�������п���ӳ�䷽���
cnoremap <c-l> <right>
cnoremap <c-h> <left>
cnoremap <c-k> <up>
cnoremap <c-j> <down>

"noremap <c-w>x <c-w>x<c-w><c-w>

"�༭ʱ�����ٽ���ǰ������
inoremap <c-z> <c-o>zz

inoremap <c-a> <home>
inoremap <c-e> <end>

nmap ' `

if MySys() == 'windows' && has("gui_running")
    nmap <m-j> <c-e>
    nmap <m-k> <c-y>
endif

" Key mappings to ease browsing long lines
noremap	 j	gj
noremap	 k	gk
"noremap  <Down>      gj
"noremap  <Up>        gk
"inoremap <Down> <C-O>gj
"inoremap <Up>   <C-O>gk

" ��������
nmap <up> <c-y>
nmap <down> <c-e>
nmap <right> :tabnext<cr>
nmap <left> :tabprevious<cr>
" nmap <c-down> <c-w>j
" nmap <c-up> <c-w>k
" nmap <c-left> <c-w>h
" nmap <c-right> <c-w>l

"change tab
"nmap <tab> :tabnext<cr>
nmap <c-n> :tabnext<cr>
nmap <c-p> :tabprevious<cr>

"Map space to / and c-space to ?
"nmap <space> <c-f> "RS remove
"nmap <bs> <c-b>

"Smart way to move btw. windows
nmap <C-j> <C-W>j
nmap <C-k> <C-W>k
nmap <C-h> <C-W>h
nmap <C-l> <C-W>l

"imap <silent> <c-k> <c-o>:call CorrectFrontWord()<cr>
"""}}}
"�Զ���<leader>ӳ��	{{{

nmap <silent> <leader>st :call ToggleSuperTab()<cr>
nmap <leader>bp i<space><esc>la<space><esc>h

nmap <leader>sh :shell<cr>

"nmap <leader>nd :NERDTreeToggle<cr>
"nmap <leader>ab :Bookmark<space>

""""""""""""""""""""""""""""""""""""""""""
" Program Reading
""""""""""""""""""""""""""""""""""""""""""
" nmap <leader>gr :!grep --color * -e<space>
nmap <leader>gr :!grep -i -n --color *.cpp *.h -e<space>
nmap <leader>gv :grep -i -n --color *.cpp *.h -e<space>
nmap <leader>g2 :!grep -i --color *.cpp *.h -n -B 2 -A 2 -e<space>
nmap <leader>g3 :!grep -i --color *.cpp *.h -n -B 2 -A 2 -e<space>

nmap <silent> <leader>scp :source ~/.vim/all_file/Program/<cr>
nmap <silent> <leader>scom :!ctags -R --c++-kinds=+p --fields=+iaS --extra=+q *.cpp *.h<cr>

nmap <silent> <leader>pp :call CppSetting()<cr>
nmap <silent> <leader>ob :set ft=objc<cr>:call ObjcSetting()<cr>

"nmap <silent> <leader>ma :call IfMouse()<cr>

nmap <silent> <leader>mp :call ChangeMakeprg()<cr>

nmap <silent> <leader>aa :A<cr>
nmap <silent> <leader>av :AV<cr>
nmap <silent> <leader>as :AS<cr>
nmap <silent> <leader>at :AT<cr>

nmap <silent> <leader>ca :CalendarH<cr>

" nmap <silent> <leader>sf :call CorrectFrontWord()<cr>

nmap <silent> <leader>sc 1z=

nmap <silent> <leader>tw :set formatoptions+=t<cr>

" �Ķ�ģʽ
nmap <silent> <leader>re :colo matrix<cr>:call M_HideCursor()<cr>

" ����ctags�ļ�
"nmap <silent> <leader>tg :!ctags -R .<cr>:set tags=tags<cr>

nmap <silent> <leader>M :marks<cr>

" �鿴��ǰ�ļ���
nmap <silent> <leader>e. :e .<cr>

nmap <silent> <leader>E :e!<cr>

" quick new
nmap <silent> <leader>ne :next<cr>

" hide cursor
nmap <silent> <leader>a :call M_HideCursor()<cr>

"����ƴд���
nmap <leader>sl :set spell!<bar>set nospell?<cr>

"�رպͿ���hsl
nmap <leader>x :set hls!<bar>set hls?<cr>

" shutdown syntax
nmap <leader>sf :setl syntax=<cr>
nmap <leader>so :setl syntax=cpp<cr>

nmap <leader>cl :set cursorline!<bar>set cursorline?<cr>

"���ٲ��ҹ���µĵ��ʣ�
nmap <leader>lv :lv /<c-r>=expand("<cword>")<cr>/ %<cr>:lw<cr>

"other mapset
nmap <silent> <leader>tn :tabnew<cr>

" vsplit
nmap <silent> <leader>vs :vsplit<cr>
"nmap <silent> <leader>vp :vsplit<cr>
" vnew
noremap <silent> <leader>vn :vnew<cr>
" new
noremap <silent> <leader>nw :new<cr>
" split
nmap <silent> <leader>sp :split<cr>

nmap <silent> <leader>o :only<cr>

"ɾ��ĩβ�Ķ���ո�
map <silent> <leader>el :call RemoveTrailingSpace()<cr>

"quick exit
nmap <silent> <leader>q :q<cr>
"quick save
nmap <silent> <leader>w :w<cr>
nmap <silent> <leader>W :wa<cr>
"quick save and quit
nmap <silent> <leader>z ZZ<cr>
nmap <silent> <leader>g <c-w>]
nmap <silent> <leader>pr <c-w>}
nmap <silent> <leader>px <c-w>z
"quick quit
nmap <silent> <leader>Q :qa<cr>

if has("gui_running")
	"��gui���ļ�������
	nmap <silent> <leader>ve :browse vsplit<cr>
	nmap <silent> <leader>ew :browse write<cr>
	nmap <silent> <leader>ed :browse edit<cr>
	nmap <silent> <leader>te :browse tabedit<cr>
else
	nmap <leader>ve :vsplit<space>
	nmap <leader>ew :write<space>
	nmap <leader>ed :edit<space>
	nmap <leader>te :tabedit<space>
endif

"����gui���棬�˳��ն˻�����ԭ�л�������
if MySys() == "linux"
	noremap <silent> <leader>G :gui<cr>:source ~/.vimrc<cr>
elseif MySys() == "windows"
	noremap <silent> <leader>G :gui<cr>:source $VIM/_vimrc<cr>
endif


"""}}}
""""""""""""""""""""""""""""""""""""""""""""""""" MAP END
""" ABBREV		{{{
iab 0# ##########################################
iab 0" """"""""""""""""""""""""""""""""""""""""""
iab 0/ //////////////////////////////////////////
" iab 0d <c-r>=strftime("%y/%m/%d")<cr>
iab 0d <c-r>=strftime("%y/%m/%d %H:%M:%S")<cr>
iab 0t <c-r>=strftime("%y%m%d%H%M%S")<cr>
"""""""""""""""""""""""""""""""""""""""""""""""""}}}
""" ENDING		{{{
"�ر��Զ��Ű棬ʡ��������һ�е�ע��֮����Ҫ����ȥ�Զ����ӵ�ע���ַ�
autocmd BufRead *.txt setl formatoptions=""
autocmd FileType vim,zsh,sh,conf setl formatoptions=""
"""""""""""""""""""""""""""""""""""""""""""""""""}}}
""" TODO		 {{{
" ״̬����ɫ
"highlight StatusLine guifg=SlateBlue guibg=Yellow
"highlight StatusLineNC guifg=Gray guibg=White
" ��windows����������
"set clipboard+=unnamed
" �ڱ��ָ�Ĵ��ڼ���ʾ�հף������Ķ�
"set fillchars=vert:\ ,stl:\ ,stlnc:\
" �����ļ�
"nmap <leader>fd :se fileformat=dos<cr>
"nmap <leader>fu :se fileformat=unix<cr>

"Remove the Windows ^M
"noremap <leader>m mmHmt:%s/<C-V><cr>//ge<cr>'tzt'm
"ȷ�� Vim ���������ַ�֮�����ж���Ҫ��ո�Ĵ��ڣ������ڴ󲿷�����¿�����ȷ�ش����������¸�ʽ����
set formatoptions+=mMB

"Favorite filetypes
"set ffs=dos,unix,mac

"autocmd BufWinLeave *.* silent mkview
"autocmd BufWinEnter *.* silent loadview

" To search for visually selected text
vnoremap // y/<C-R>"<CR>

"""""""""""""""""""""""""""""""""""""""""""""""""}}}
set fdm=marker



" RS define

"��ɫ����{{{
if exists('$TMUX')
	set term=screen-256color
endif

" enable 8-color mode
"let &t_Co=8
"let &t_AF="\e[3%dm"
"let &t_AB="\e[4%dm"

let &t_Co=256
"let &t_AF="\e[38;5;%dm"
"let &t_AB="\e[48;5;%dm"
"colorscheme solarized
"colorscheme rs_1
"colorscheme molokai_term
"colorscheme desert_term
colorscheme despacio_term

"}}}

" ����{{{
set number
set cursorline
"set statusline=\ %t%m%r%h\ %w\ [%{WindowNumber()}]\Line:\ %l/%L:%c\ [%{(&fenc==\"\")?&enc:&fenc}%{(&bomb?\",BOM\":\"\")}]\ %{strftime(\"%d/%m/%y\ -\ %H:%M\")}
set statusline=\ %t%m%r%h\ %w\ [%{WindowNumber()}]\Line:\ %l/%L:%c\ [%{(&fenc==\"\")?&enc:&fenc}%{(&bomb?\",BOM\":\"\")}]

"}}}

"�Զ��庯��{{{

"��ĳһ·������ˢ��NERDTree
function! CdAndNERDTreeFresh(path)
	exec "cd /cygdrive/".a:path
	exec "NERDTree ."
endfunction

"ˢ��NERDTree
function! NERDTreeFresh()
	exec "NERDTree ."
endfunction

function! WindowNumber()
    let str=tabpagewinnr(tabpagenr())
    return str
endfunction

"}}}

"��ݼ�ӳ��{{{
"set relativenumber

"�ڱ༭״̬�£���ctrl+u������ո�������Ǹ����ʱ�ɴ�д
inoremap <C-u> <esc>gUiwea

nmap <leader>cc :set cursorcolumn!<bar>set cursorcolumn?<cr>
nmap <leader>nt :NERDTreeToggle<cr>
nmap <leader>nf :call NERDTreeFresh()<cr>
nmap <silent><F2> :NERDTreeToggle<cr>

"Ϊ�˲���������ݼ�������ͻ������ʱ�趨 ִ�к� ��ݼ� :nmap <F4> @s
nmap <F3> @a
imap <F3> <esc>@a

"���ٶ�λ��xx����
nmap <leader>1 :1wincmd w<cr>
nmap <leader>2 :2wincmd w<cr>
nmap <leader>3 :3wincmd w<cr>
nmap <leader>4 :4wincmd w<cr>
nmap <leader>5 :5wincmd w<cr>


"""""""""""""""""}}}

"�Զ�������{{{

"��ĳһ·������ˢ��NERDTree
command! -nargs=+ CD :call CdAndNERDTreeFresh(<f-args>)

"}}}