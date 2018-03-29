" Module's Vimrc
""" INITIATE		{{{
set nocompatible	" 不兼容模式，放在第一行才能保证所有选项可用
"filetype plugin on

"Vundle 插件安装管理器 {{{
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

"受管理的插件

"缩进线指示器
Plugin 'Yggdroot/indentLine'
"自动补全括号
Plugin 'jiangmiao/auto-pairs'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line

"}}}

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

" lookup file with ignore case 忽略大小小查询文件
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

" 删除末尾的多余空格
function! RemoveTrailingSpace()
	normal m`
	"silent! :%s/\s\+$//e
	silent! :%s/\s\+$//e
	"silent! :noh<cr>
	normal ``
endfunction

" 最大最小化设置
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
	set autoindent 		" 继承前一行的缩进方式，特别适用于多行注释
	set smartindent 	" 为C程序提供自动缩进
	set cindent 		" 使用C样式的缩进
	set tabstop=4
	set shiftwidth=4 	" 缩进宽度为4
	"set softtabstop=4 	" 设置软制表符
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

" 最大最小化设置
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
	set autoindent 		" 继承前一行的缩进方式，特别适用于多行注释
	set smartindent 	" 为C程序提供自动缩进
	set tabstop=4
    set nowrap
    set ignorecase smartcase
	set shiftwidth=4 	" 缩进宽度为4
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
"ShowMarks插件中已经定义了一些快捷键：
"<leader>mt - 打开/关闭ShowMarks插件
"<leader>mo - 强制打开ShowMarks插件
"<leader>mh - 清除当前行的标记
"<leader>ma - 清除当前缓冲区中所有的标记
"<leader>mm - 在当前行打一个标记，使用下一个可用的标记名

let showmarks_enable = 0
" Show which marks
let showmarks_include = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ"
" Ignore help, quickfix, non-modifiable buffers
let showmarks_ignore_type = "hqm"
" Hilight lower & upper marks
let showmarks_hlline_lower = 1
let showmarks_hlline_upper = 1

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 智能补全 OMNI
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"关闭cpp智能补全
let OmniCpp_MayCompleteDot = 0
let OmniCpp_MayCompleteArrow = 0
let OmniCpp_MayCompleteScope = 0

" 使用pumvisible()来判断下拉菜单是否显示
inoremap <expr> <CR> pumvisible()?"\<C-Y>":"\<CR>"
"如果下拉菜单弹出，回车映射为接受当前所选项目，否则，仍映射为回车
inoremap <expr> <C-J> pumvisible()?"\<PageDown>\<C-N>\<C-P>":"\<C-X><C-O>"
"如果下拉菜单弹出，CTRL-J映射为在下拉菜单中向下翻页。否则映射为CTRL-X CTRL-O
"inoremap <expr> <C-K> pumvisible()?"\<PageUp>\<C-P>\<C-N>":"\<C-K>"
"如果下拉菜单弹出，CTRL-K映射为在下拉菜单中向上翻页，否则仍映射为CTRL-K
"inoremap <expr> <C-U> pumvisible()?"\<C-E>":"\<C-U>"
"如果下拉菜单弹出，CTRL-U映射为CTRL-E，即停止补全，否则，仍映射为CTRL-U

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 自动补全 OMNI
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"整行补全			CTRL-X CTRL-L
"根据当前文件里关键字补全	CTRL-X CTRL-N
"根据字典补全			CTRL-X CTRL-K
"根据同义词字典补全		CTRL-X CTRL-T
"根据头文件内关键字补全		CTRL-X CTRL-I
"根据标签补全			CTRL-X CTRL-]
"补全文件名			CTRL-X CTRL-F
"补全宏定义			CTRL-X CTRL-D
"补全vim命令			CTRL-X CTRL-V
"用户自定义补全方式		CTRL-X CTRL-U
"拼写建议			CTRL-X CTRL-S

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

	nmap <C-c>h :echo " s: 查找C语言符号，即查找函数名、宏、枚举值等出现的地方\n g: 查找函数、宏、枚举等定义的位置，类似ctags所提供的功能\n d: 查找本函数调用的函数\n c: 查找调用本函数的函数\n t: 查找指定的字符串\n e: 查找egrep模式，相当于egrep功能，但查找速度快多了\n f: 查找并打开文件，类似vim的find功能\n i: 查找包含本文件的文件"<cr>

endif
" s: 查找C语言符号，即查找函数名、宏、枚举值等出现的地方
" g: 查找函数、宏、枚举等定义的位置，类似ctags所提供的功能
" d: 查找本函数调用的函数
" c: 查找调用本函数的函数
" t: 查找指定的字符串
" e: 查找egrep模式，相当于egrep功能，但查找速度快多了
" f: 查找并打开文件，类似vim的find功能
" i: 查找包含本文件的文件

""""""""""""""""""""""""""""""
" Tag list (ctags)
""""""""""""""""""""""""""""""
if MySys() == "windows"
	let Tlist_Ctags_Cmd = 'ctags'
elseif MySys() == "linux"
	let Tlist_Ctags_Cmd = '/usr/bin/ctags' "设定linux系统中ctags程序的位置
endif

let Tlist_Show_One_File = 1 "不同时显示多个文件的tag，只显示当前文件的
let Tlist_Exit_OnlyWindow = 1 "如果taglist窗口是最后一个窗口，则退出vim
let Tlist_Use_Right_Window = 1 "在右侧窗口中显示taglist窗口
let Tlist_Use_SingleClick = 1 "单击打开标签
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
" let g:LookupFile_MinPatLength = 2               "最少输入2个字符才开始查找
" let g:LookupFile_PreserveLastPattern = 0        "不保存上次查找的字符串
" let g:LookupFile_PreservePatternHistory = 1     "保存查找历史
" let g:LookupFile_AlwaysAcceptFirst = 1          "回车打开第一个匹配项目
" let g:LookupFile_AllowNewFiles = 0              "不允许创建不存在的文件
" let g:LookupFile_ableDefaultMap = 0 			"关闭默认映射
" if filereadable("./filenametags")                "设置tag文件的名字
" 	let g:LookupFile_TagExpr = '"./filenametags"'
" endif
" "映射LookupFile为,lk
" "nmap <silent> <leader>lk <Plug>LookupFile<cr>
" "映射LUBufs为,ll
" nmap <silent> <leader>ll :LUBufs<cr>
" "映射LUWalk为,lw
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
"不输入自动的注释字符
" let g:C_TemplateOverwrittenMsg = 'no'
" let g:C_Ctrl_j = 'off'
" let g:C_TemplateOverwrittenMsg= 'yes'
" \ss 插入switch结构 	\im 插入main函数
" \ntr 重读模版 		\hp 查看帮助
" 插入Note结构switch
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
    "光标停止闪烁
    set guicursor+=n-v-i-c-r:block-cursor-blinkon0
    "简化界面
    set guioptions-=m
    set guioptions-=T
    set guioptions-=L
    set guioptions-=l
    set guioptions-=r
    set guioptions-=R

    "启动大小 及配色
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

"当前面有一个反斜杠时，这些字符具有特殊的含义。在搜索中常用
set magic

"换行时，把保持单词完整
set linebreak

"""""""""""""""""""""""""""""""""""""TEXT FILE
"if &filetype==""
"	colo mine-matrix
"endif

"一般的文档用matrix配色，保护视力
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
	set autoindent 		" 继承前一行的缩进方式，特别适用于多行注释
	set smartindent 	" 为C程序提供自动缩进
	set encoding=utf8
	set tabstop=4
	set shiftwidth=4 	" 缩进宽度为4
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
"用c-g输入tab
" autocmd FileType c,cpp inoremap <c-k> <tab>
" 只补全当前文件中的词语
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
   let curdir = substitute(getcwd(), 'c:/Documents and Settings/南阳野人/', "~/", "g")
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

"set expandtab	"将tab键扩展成空格

set cmdheight=1

"默认为英文帮助
"set helplang=en

"在vim中查看Man
runtime ftplugin/man.vim

"去掉每行开头显示个"@"
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

set wildmenu "显示命令候选选项

"No sound on errors.
set noerrorbells
set novisualbell
set t_vb=

"让vi自动识别编码
" set fencs=gb18030,gbk,gb2312,big5,euc-jp,euc-kr,latin1,cp936,utf-8,ucs-bom
set fileencodings=utf-8,gbk,ucs-bom

"工作目录为当前目录
set autochdir

" 启动的时候不显示那个援助索马里儿童的提示
set shortmess=atI

"使用鼠标
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

"防止中文半个删
set ambiwidth=double

"""""""""""""""""""""""""""""""""""""""""""""""""}}}
""" MAP SET
" 特殊键设置 {{{

" 查看上次所查看的帮助文档
nmap <c-f1> :h <up><cr>

if has("gui_running")
    "快速启用菜单
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

"<F4>切换taglist打开或关闭
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
"普通键设置 {{{

if has("gui_running") " 映射所有Alt+XX键。（只有Gui界面才能映射）
	imap <m-h> <left>
	imap <m-l> <right>
	imap <m-j> <down>
	imap <m-k> <up>
endif

"autocmd FileType c,cpp nmap <buffer> f zf%

" 用tab键来开关折叠
nnoremap <silent> <s-tab> @=((foldclosed(line('.')) < 0) ? 'zc' : 'zo')<cr>
"nnoremap <silent> <s-tab> zv<cr>
"nnoremap <silent> <s-tab> @=((foldclosed(line('.')) < 0) ? 'zv' : 'zx')<cr>

imap <c-u> <cr>
inoremap <c-u><c-u> <c-u>

" 命令行设置
cnoremap <C-A>    <Home>
cnoremap <C-E>    <End>

"命令行中快速映射方向键
cnoremap <c-l> <right>
cnoremap <c-h> <left>
cnoremap <c-k> <up>
cnoremap <c-j> <down>

"noremap <c-w>x <c-w>x<c-w><c-w>

"编辑时，快速将当前行置中
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

" 游览设置
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
"自定义<leader>映射	{{{

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

" 阅读模式
nmap <silent> <leader>re :colo matrix<cr>:call M_HideCursor()<cr>

" 建立ctags文件
"nmap <silent> <leader>tg :!ctags -R .<cr>:set tags=tags<cr>

nmap <silent> <leader>M :marks<cr>

" 查看当前文件夹
nmap <silent> <leader>e. :e .<cr>

nmap <silent> <leader>E :e!<cr>

" quick new
nmap <silent> <leader>ne :next<cr>

" hide cursor
nmap <silent> <leader>a :call M_HideCursor()<cr>

"开关拼写检查
nmap <leader>sl :set spell!<bar>set nospell?<cr>

"关闭和开启hsl
nmap <leader>x :set hls!<bar>set hls?<cr>

" shutdown syntax
nmap <leader>sf :setl syntax=<cr>
nmap <leader>so :setl syntax=cpp<cr>

nmap <leader>cl :set cursorline!<bar>set cursorline?<cr>

"快速查找光标下的单词：
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

"删除末尾的多余空格
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
	"打开gui的文件游览器
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

"进入gui界面，退出终端环境，原有环境不变
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
"关闭自动排版，省得老是在一行的注释之后又要再上去自动添加的注释字符
autocmd BufRead *.txt setl formatoptions=""
autocmd FileType vim,zsh,sh,conf setl formatoptions=""
"""""""""""""""""""""""""""""""""""""""""""""""""}}}
""" TODO		 {{{
" 状态行颜色
"highlight StatusLine guifg=SlateBlue guibg=Yellow
"highlight StatusLineNC guifg=Gray guibg=White
" 与windows共享剪贴板
"set clipboard+=unnamed
" 在被分割的窗口间显示空白，便于阅读
"set fillchars=vert:\ ,stl:\ ,stlnc:\
" 调整文件
"nmap <leader>fd :se fileformat=dos<cr>
"nmap <leader>fu :se fileformat=unix<cr>

"Remove the Windows ^M
"noremap <leader>m mmHmt:%s/<C-V><cr>//ge<cr>'tzt'm
"确保 Vim 能在中文字符之间折行而不要求空格的存在，并且在大部分情况下可以正确地处理中文重新格式化。
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

"颜色配置{{{
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

" 设置{{{
set nowrap
set number
"set statusline=\ %t%m%r%h\ %w\ [%{WindowNumber()}]\Line:\ %l/%L:%c\ [%{(&fenc==\"\")?&enc:&fenc}%{(&bomb?\",BOM\":\"\")}]\ %{strftime(\"%d/%m/%y\ -\ %H:%M\")}
set statusline=\ %t%m%r%h\ %w\ [%{WindowNumber()}]\Line:\ %l/%L:%c\ [%{(&fenc==\"\")?&enc:&fenc}%{(&bomb?\",BOM\":\"\")}]
set cursorline
"Increasing or decreasing numbers or alpha
set nrformats+=alpha

set shell=/bin/zsh

"缩进
set shiftwidth=4 "这个量是每行的缩进深度，一般设置成和tabstop一样的宽度"
set tabstop=4 "设置Tab显示的宽度，Python建议设置成4"

"刚才说过Tab和空格是不同的，虽然你可以在自己的代码中全部使用Tab"
"但是如果你将你的代码分享给使用空格的朋友，就会带来很多麻烦"
"那么设置下面这行就可以将Tab自动展开成为空格"
set expandtab
"如果只想在Python文件中将Tab展开成空格，就改换成下面这句"
autocmd FileType python set expandtab


"不过下面还有一些配置是建议同学们根据需要加上的"
set smartindent "智能缩进"
set cindent "C语言风格缩进"
set autoindent "自动缩进"

"}}}

"自定义函数{{{

"打开某一路径并且刷新NERDTree
function! CdAndNERDTreeFresh(path)
	exec "cd /cygdrive/".a:path
	exec "NERDTree ."
endfunction

"刷新NERDTree
function! NERDTreeFresh()
	exec "NERDTree ."
endfunction

function! WindowNumber()
    let str=tabpagewinnr(tabpagenr())
    return str
endfunction

"递归查找某个目录
function! FindPath(dir)
	let path = systemlist('find -name '.a:dir)
	let pathList_len = len(path)
	if pathList_len <= 0
		exec "echo 'no such directory : ".a:dir."'"
	elseif pathList_len == 1
		exec "NERDTree ".get(path,0)
	else
		echo 
	endif
	echo len(path)
endfunction
"}}}

"快捷键映射{{{
"set relativenumber

"在编辑状态下，按ctrl+u，将你刚刚输入的那个单词变成大写
inoremap <C-u> <esc>gUiwea

nmap <leader>cc :set cursorcolumn!<bar>set cursorcolumn?<cr>

"为了不和其他快捷键产生冲突，可临时设定 执行宏 快捷键 :nmap <F4> @s
nmap <F3> @a
imap <F3> <esc>@a

"快速定位到xx窗口
nmap <leader>1 :1wincmd w<cr>
nmap <leader>2 :2wincmd w<cr>
nmap <leader>3 :3wincmd w<cr>
nmap <leader>4 :4wincmd w<cr>
nmap <leader>5 :5wincmd w<cr>

"pax 报文解析工具映射
nmap <silent><leader>np :call Bitmap_split()<cr>

"搜索选中的文本
vnoremap // y/<C-R>"<CR>

"CtrlP
"open CtrlP
let g:ctrlp_map = '<c-\>'

"""""""""""""""""}}}

"自定义命令{{{

"打开某一路径并且刷新NERDTree
command! -nargs=+ CD :call CdAndNERDTreeFresh(<f-args>)
"}}}

"NERD tree 共享插件 {{{

" 关闭NERDTree快捷键
map <leader>t :NERDTreeTabsToggle<CR>
nmap <leader>nt :NERDTreeTabsToggle<cr>
nmap <leader>nf :call NERDTreeFresh()<cr>
nmap <silent><F2> :NERDTreeTabsToggle<cr>
" 显示行号
let NERDTreeShowLineNumbers=1
let NERDTreeAutoCenter=0
" 是否显示隐藏文件
let NERDTreeShowHidden=1
" 设置宽度
let NERDTreeWinSize=31
" 在终端启动vim时，开启共享NERDTree
let g:nerdtree_tabs_open_on_console_startup=0
" 忽略一下文件的显示
let NERDTreeIgnore=['\.pyc','\~$','\.swp']
" 显示书签列表
let NERDTreeShowBookmarks=1

""}}}

" TableMode 表格插件 {{{

"Markdown-compatible tables use
let g:table_mode_corner='|'
"}}}

"indentLine 缩进指示线 {{{

let g:indentLine_char='¦'
let g:indentLine_enabled = 0

" Vim
let g:indentLine_color_term = 250

" none X terminal
"let g:indentLine_color_tty_light = 7 " (default: 4)
"let g:indentLine_color_dark = 1 " (default: 2)

" Background (Vim, GVim)
"let g:indentLine_bgcolor_term = 202

"}}}

"python语言配置 {{{

function! PythonSetting()
	"显示缩进指示线
	let g:indentLine_enabled = 1
endfunction
autocmd FileType python call PythonSetting()

"}}}
