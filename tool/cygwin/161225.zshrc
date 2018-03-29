#This is useful, if you want to remove systemwide aliases from your config:
# Clean up unwanted system aliases and start from scratch.
unhash -am '*'

##########################################
# .bashrc
##########################################
#{{{命令别名
## zsh special
alias -g ...=../../
alias -g ....=../../../
alias -g .....=../../../../

alias -g NL="> /dev/null 2>&1"
##########################################
alias lp='ls *.cpp *.h *.c'
#alias gp='g++ -Wall'
##########################################
alias dt="date '+%y%m%d-%H%M%S'"
alias atl='autotitle'
alias wf="wordsfilter ~/c_apply/wordsfilter_settings/origin "
alias wd="wordsfilter ~/c_apply/wordsfilter_settings/default "
alias wlist='vi /d/Project/c_free/soft/doc/WishList.txt'
alias snote='vi /d/Project/project_bak/project_module/VersionNotes.txt'
alias gd="get_sdcv_words"
alias backsrc='vi -oR `cat bak_list `'
alias datebak="cd ~now/ && tar czf ~sbak/date.tar.gz --exclude=SoftTryClr/cache --exclude=SoftTryClr/dict --exclude=SoftTryClr/funclib --exclude=SoftTryClr/methods --exclude=SoftTryClr/notebooks --exclude=SoftTryClr/recitemode --exclude=SoftTryClr/wordlist --exclude=ProjectNote --exclude=SoftTryClr/Debug --exclude=SoftTryClr/Release *"
alias paubak="cd ~now/ && tar czf ~sbak/pause.tar.gz --exclude=SoftTryClr/cache --exclude=SoftTryClr/dict --exclude=SoftTryClr/funclib --exclude=SoftTryClr/methods --exclude=SoftTryClr/notebooks --exclude=SoftTryClr/recitemode --exclude=SoftTryClr/wordlist --exclude=ProjectNote --exclude=SoftTryClr/Debug --exclude=SoftTryClr/Release *"
alias apt-cyg="apt-cyg -m "http://mirrors.163.com/cygwin/" -u "

alias gcf='grep $HOME/c_apply/c_fun/*.txt -e'
alias cp='cp -i'
alias mv='mv -i'
alias rm='rm -i'

alias pn='vim /d/Project/visual_stdio/SoftTryClr/ProjectNote/ProjectNote.txt'
alias n='vim /d/文档/noting.txt'

alias vi='vim -X'
alias vim='vim -X'
alias vimdiff='vimdiff -X'
alias p1='put outside '
alias p99='put l99 '
alias p103='put l103 '
alias p102='put l102 '
alias g1='get l1 '
alias gout='get outside '
alias gp='ps -W | grep --color'
alias lout='lftp outside'
alias l99='lftp l99'
alias l102='lftp l102'
alias l103='lftp l103'
alias vdf="vimdiff"
alias wb="w3m -B"
alias ls='ls --color=tty --show-control-chars'
alias rd='rmdir'
alias md='mkdir'
alias cvc='cd ; clear'
alias cl='clear ;ls -lh'
alias ll='ls -l'
alias lt="ls *.txt"
alias l='ls -lh'
alias la='ls -a'
alias s='cd .. ; ls '
alias x='cd "$OLDPWD" ; ls '
alias c='clear'
alias df='df -h'
alias du='du -sh'
alias m='more'
#alias g='grep --color'
alias grep='grep -n --color'
alias wl='wc -l'
alias wh='which'
alias jb='jobs'
alias cx='chmod u+x'
#alias gvim="gvim -display 127.0.0.1:0.0"
#alias date="date '+%y%m%d-%H%M%S-'"
alias vp="vi /cygdrive/d/temp/enlearing/GRE-learn/pick-note.txt"
alias s30="ssh module@192.168.1.30"
alias s28="ssh module@192.168.1.28"
alias s99="ssh lixl@192.168.1.99"
alias sr102="ssh root@192.168.1.102"
alias s102="ssh lxl@192.168.1.102"
alias s103="ssh lixl@192.168.1.103"
alias sout="ssh pubuser@210.45.126.225"
alias sp102="ssh pubuser@192.168.1.102"
alias sil="ssh syxiao@210.73.16.3"
alias us="unsee"
alias sshdl='echo "key: 83585"; ssh 26887@ssh8.xiaod.in -D localhost:7070'

#command set
alias pst="pstree -p"
alias cdcv="sdcv -u 朗道汉英字典5.0"
alias edcv="sdcv -u 朗道英汉字典5.0 -u WordNet"

#screen set
alias sm="screen man"
alias sc="screen"
alias sv="screen vi"
alias sl="screen -list"
alias sr="screen -r"
alias st="screen -t"
alias ss="screen -S share"
alias sx="screen -x "
alias sw="screen -wipe"

####zsh set
alias zs='. ~/.zshrc'
alias vz='vi ~/.zshrc'

#alias xpdf='xpdf -bg black -rv -display 127.0.0.1:0.0 '
alias xpdf='xpdf -bg black -display 127.0.0.1:0.0 '
#alias viml='vimless.sh'
alias cvc='cd ; clear'
alias ctar='tar cvf'
alias etar='tar xvf'

#easy use setup
#alias adnote='echo "~~~~`md`~~~~" >>/cygdrive/d/文档/noting.txt ;cat >>/cygdrive/d/文档/noting.txt'
alias vnote='vi /cygdrive/d/文档/noting.txt'
alias cygnote='cat >>$CYGNOTE'
alias dospath='cygpath --windows'
alias unixpath='cygpath --unix'
alias longshell='ssh -l module 211.86.156.209'
alias cab='cd "`abpath`"'
alias cm='cd ~/zm'
alias c='code2key'
alias d='durl'
# alias np=/d/软件/Notepad++/notepad++.exe
# alias gvdf=/d/软件/small-soft/DiffMerge_3_3_0_18513/DiffMerge.exe
# alias msp2=/d/软件/small-soft/mp3DirectCut/mp3DirectCut.exe

#}}}
##########################################
#{{{ soft to use

# +++SOFT+++
# chemdata chrome daily vagaa calc pptview word excel
# wopti fmail xstart emule oveplay ovemusic maxthon
# firefox photoshop go game origin origin8 chem math
# xunlei ssreader pword draw lingoes seten taskmgr
# notepad grid kmpl kftp pdfread stardict webster longman

#stardict(){
#	nohup "/cygdrive/c/Program Files/StarDict/stardict.exe" >/dev/null 2>&1 &
#}

sitebak(){
	cd /e/Program/wamp/www/htdocs/ && zip site-`date '+%y%m%d-%H%M%S'`.zip -rq NewVoltMemo
}
wpbak(){
	cd /e/Program/wamp/www/htdocs/ && zip wp-`date '+%y%m%d-%H%M%S'`.zip -rq wordpress
}
up(){
	CP ~now/../Debug/SoftTryClr.exe ~bt/
	CP ~now/../Debug/bone32.dll ~bt/
	CP ~now/data/translate.dat ~bt/data/
}

setup(){
	nohup "/usr/lib/Singular/cygwin-setup.exe" >/dev/null 2>&1 &
}

fread(){
	nohup "/cygdrive/c/Program Files/Foxit Software/Foxit Reader/Foxit Reader.exe" "$1" >/dev/null 2>&1 &
}

cmd(){
	/cygdrive/c/WINDOWS/system32/cmd.exe
}

ahkpw(){
	nohup "/c/Program Files/AutoHotkey/AutoHotkey.exe" "`dospath "/d/学习/计算机/应用文件/pword-recite.ahk" `" >/dev/null 2>&1 &
}

webster(){
	nohup "/cygdrive/c/Program Files/Merriam-Webster/merriam-webster.exe" >/dev/null 2>&1 &
}

longman(){
	nohup "/cygdrive/c/Program Files/Longman/LDOCE5/ldoce5.exe" >/dev/null 2>&1 &
}

chemdata(){
	nohup "/cygdrive/c/Program Files/CrossFire Commander 7.1/XfCm.exe" >/dev/null 2>&1 &
}

chrome(){
	nohup "/cygdrive/c/Documents and Settings/南阳野人/Local Settings/Application Data/Google/Chrome/Application/chrome.exe" "$1" >/dev/null 2>&1 &
}

daily(){
	nohup "/cygdrive/d/软件/EssentialPIM/EssentialPIM.exe" >/dev/null 2>&1 &
}

vagaa(){
	nohup "/d/软件/Vagaa/vagaa.exe" >/dev/null 2>&1 &
}

calc(){
	nohup "/cygdrive/c/WINDOWS/system32/calc.exe" >/dev/null 2>&1 &
}

pptview(){
	nohup "/cygdrive/c/Program Files/Microsoft Office/OFFICE11/POWERPNT.EXE" "$@" >/dev/null 2>&1 &
}

word(){
	nohup "/cygdrive/c/Program Files/Microsoft Office/OFFICE11/WINWORD.EXE" "$@" >/dev/null 2>&1 &
}

excel(){
	nohup "/cygdrive/c/Program Files/Microsoft Office/OFFICE11/EXCEL.EXE" "$@" >/dev/null 2>&1 &
}

wopti(){
	nohup "/cygdrive/c/Program Files/Wopti/WoptiUtilities.exe" >/dev/null 2>&1 &
}

fmail(){
	nohup "/cygdrive/c/Program Files/Tencent/Foxmail/Foxmail.exe" >/dev/null 2>&1 &
}

xstart(){
#	nohup "/usr/X11R6/bin/startxwin.bat" >/dev/null 2>&1 &
	nohup "/usr/lib/Singular/startxserver.bat" >/dev/null 2>&1 &
}

emule(){
	nohup "/cygdrive/c/Program Files/eMule/emule.exe" >/dev/null 2>&1 &
}

oveplay(){
	_OVE_PATH="`pwd`"
	cd "/cygdrive/d/学习/电子钢琴/琴谱"
	nohup "/cygdrive/d/学习/电子钢琴/oveplayer/OvePlayer.0.4.exe" >/dev/null 2>&1 &
	cd "$_OVE_PATH"
}

ovemusic(){
	#_OVE_PATH="`pwd`"
	#cd "/cygdrive/d/学习/电子钢琴/琴谱"
	nohup "/c/Program Files/Overture 4.0 中文版/Overture.exe" "$@" >/dev/null 2>&1 &
	#cd "$_OVE_PATH"
}

maxthon(){
	nohup "/cygdrive/c/Program Files/Maxthon2/Maxthon.exe" >/dev/null 2>&1 &
}

firefox(){
	nohup "/cygdrive/c/Program Files/Mozilla Firefox/firefox.exe" "$@" >/dev/null 2>&1 &
}

photoshop(){
	nohup "/cygdrive/c/Program Files/Adobe/Adobe Photoshop CS2/Photoshop.exe" >/dev/null 2>&1 &
}

#go(){
#	nohup "/cygdrive/c/Program Files/思佳围棋/duiyi.exe" >/dev/null 2>&1 &
#}
#
#game(){
#	nohup "/cygdrive/d/软件/nethack/nethack_directx/nethack.exe" >/dev/null 2>&1 &
#}

origin(){
	nohup "/cygdrive/d/软件/Origin75/origin75.exe" >/dev/null 2>&1 &
}

origin8(){
	nohup "/cygdrive/c/Program Files/OriginLab/Origin8/Origin8.exe" >/dev/null 2>&1 &
}

chem(){
	nohup "/cygdrive/c/Program Files/ACDFREE11/CHEMSK.EXE" >/dev/null 2>&1 &
}

math(){
	nohup "/cygdrive/c/Program Files/Wolfram Research/Mathematica/6.0/Mathematica.exe" >/dev/null 2>&1 &
}

xunlei(){
	nohup "/cygdrive/d/软件/Thunder5/Thunder.exe" >/dev/null 2>&1 &
}

ssreader(){
	nohup "/cygdrive/c/Program Files/SSREADER36/SsReader.exe" >/dev/null 2>&1 &
}

kftp(){
	nohup "/cygdrive/d/软件/FlashXP/FlashFXP.exe" >/dev/null 2>&1 &
}

pword(){
	nohup "/cygdrive/d/软件/PWords1.15.118/PWords.exe" >/dev/null 2>&1 &
}

draw(){
	nohup "/cygdrive/c/WINDOWS/system32/mspaint.exe" "$1" >/dev/null 2>&1 &
}

lingoes(){
	nohup "/cygdrive/c/Program Files/Lingoes/Translator2/Lingoes.exe" >/dev/null 2>&1 &
}

seten(){
	nohup "/cygdrive/d/软件/Lingoes/Translator/Lingoes.exe" >/dev/null 2>&1 &
	nohup "/cygdrive/d/软件/PWords1.15.118/PWords.exe" >/dev/null 2>&1 &
	nohup "/c/Program Files/AutoHotkey/AutoHotkey.exe" "`dospath "/d/学习/计算机/应用文件/Command.ahk" `" >/dev/null 2>&1 &
	recite
	#/e/cygwin/putty.bat
	#nohup "/cygdrive/d/软件/EnCerebra2/EnCerebra2.exe" >/dev/null 2>&1 &
}

taskmgr(){
	nohup "/cygdrive/c/WINDOWS/system32/taskmgr.exe"  >/dev/null 2>&1 &
}

notepad(){
	nohup "/cygdrive/c/WINDOWS/system32/notepad.exe" "$@" >/dev/null 2>&1 &
}

grid(){
	nohup "/cygdrive/d/软件/some/DG.exe" >/dev/null 2>&1 &
}

kmpl(){
	nohup "/cygdrive/c/Program Files/KMPlayer/KMPlayer.exe" "$1" >/dev/null 2>&1 &
}

pdfread(){
	nohup "/cygdrive/c/Program Files/Adobe/Acrobat 7.0/Acrobat/Acrobat.exe" "$1" >/dev/null 2>&1 &
}

np(){ nohup "/d/软件/Notepad++/notepad++.exe" "$@" >/dev/null 2>&1 & }
gvdf(){ nohup "/d/软件/small-soft/DiffMerge_3_3_0_18513/DiffMerge.exe" "$@" >/dev/null 2>&1 & }
msp2(){ nohup "/d/软件/small-soft/mp3DirectCut/mp3DirectCut.exe" "$@" >/dev/null 2>&1 & }

gvim(){ nohup "/d/program/Vim/vim80/gvim.exe" "$@" >/dev/null 2>&1 & }

#}}}
##########################################
#{{{ Functions

function 2html() { vim -n -c ':so $VIMRUNTIME/syntax/2html.vim' -c ':wqa' $1 > /dev/null 2> /dev/null }

function precmd {
	if [ $_flag_autotitle -eq 0 ];then
		echo -ne "\033]83;title `basename $PWD`\007"
	fi
}
_flag_autotitle=0
function autotitle(){
	if [ $_flag_autotitle -eq 1 ];then
		_flag_autotitle=0
	else
		_flag_autotitle=1
		echo "Shut down autotitle"
	fi
}

function wcd(){
	ldir=`cygpath -u "$1"`
	cd $ldir
}

gvd(){
	dospath $PWD | sed 's/\\/\//g'
	return 0
}

getnyyr(){
	echo "修改权限：" $@
	echo -n "确认要改变权限? y/n [n]"
	read _GET
	if [[ "$_GET" == "y" ]]; then
		chown -R 南阳野人 "$@"
		chgrp -R None "$@"
		chmod 755 -R "$@"
		return 0
	fi
	return 1
}

getnyyr-all(){
	chown -R 南阳野人 "$@"
	chgrp -R None "$@"
	chmod 755 -R "$@"
	echo "Done: $@"
}

cv(){
	#echo $@
	cd "$@" ; ls 
}

#md(){ #命名用日期
#	if [ $# != 0 ];then
#		echo "命名用日期"
#		return 1
#	fi
##	date '+%y%m%d%H%M%S'
#	date '+%y%m%d%H'
#	return 0
#}

vf(){ #编辑$PATH中的脚本
	if [ $# != 1 ];then
		echo "Useage:编辑\$PATH中的脚本"
		return 0
	fi
	vi `wh $1`
	return 0
}

zm(){
	cd ~/zm/
	#ls -lh
}

#}}}
##########################################
#{{{ variables

export CYGWIN=nodosfilewarning

export  DISPLAY="127.0.0.1:0.0"
export  LS_COLORS='ow=01;34'
#export	PATH=$HOME/bin:/usr/local/bin:$PATH
export  PATH=$HOME/bin:$PATH
#export  PATH=$HOME/bin:/usr/local/bin:/bin:/usr/bin:/usr/X11R6/bin:/usr/lib/lapack:/d/软件/vs2008/vc/bin
export	ENLEBOOK=$HOME/c_apply/totalen.txt #英语学习的备用本，用以排除生词
export	CYGNOTE=$HOME/program/cygwin/笔记.txt
export	PICKNOTE=/cygdrive/d/temp/enlearing/GRE-learn/pick-note.txt
export	LESSCHARSET=latin1
export	TERM=rxvt
#export	TERM=xterm

#export	LC_CTYPE=zh_CN.gbk
#export	LC_CTYPE=zh_CN.gbk
#export	CHARSET=GBK
#export	XLOCALE=zh_CN.gbk
#export	LC_CTYPE=zh_CN.GBK
#export	LC_MONETARY=zh_CN.GBK
#export	LC_NUMERIC=zh_CN.GBK
#export	LC_MESSAGES=zh_CN.GBK
#export	LC_TIME=zh_CN.GBK
#export	LC_COLLATE=zh_CN.GBK
#export	LC_ALL=zh_CN.GBK

export	CHARSET=UTF-8
export	OUTPUT_CHARSET="UTF-8"
export	LANGUAGE=zh_CN.UTF-8
export	LANG=zh_CN.UTF-8

# export	CHARSET=GBK
# export	OUTPUT_CHARSET="GBK"
# export	LANGUAGE=zh_CN.GB2312:zh_CN.GBK:zh_CN:zh
# export	LANG=zh_CN.GBK

#export	LC_CTYPE=en_US
#export	LC_CTYPE=en_US
#export	CHARSET=en_US
#export	XLOCALE=en_US
#export	LC_CTYPE=en_US
#export	LC_MONETARY=en_US
#export	LC_NUMERIC=en_US
#export	LC_MESSAGES=en_US
#export	LC_TIME=en_US
#export	LC_COLLATE=en_US
#export	LANG=en_US
#export	LC_ALL=en_US
# export	LANGUAGE=en_US
# export	CHARSET=en_US
# export	LANG=en_US
# export	OUTPUT_CHARSET=en_US

#}}}
########################################## .bashrc END

##########################################
# MINE SET
##############################################
setopt autocd #输入文件名即可进入目录
setopt extendedglob #扩展文件名匹配设置
setopt no_case_glob

##############################################
#{{{ 文件关联设置
##############################################

autoload -U zsh-mime-setup #设置文件关联
zsh-mime-setup

#alias -s chm=gnochm
#alias -s jpg=ristretto
#alias -s png=ristretto
#alias -s gif=ristretto
#alias -s pdf=pdfread
alias -s htm=w3m
alias -s html=w3m
alias -s txt=vim
alias -s vim=vim

#}}}
##############################################
compctl -g '*.htm *.html *.mht' + -g '*(-/)' firefox w3m
compctl -g '*(-/) .*(-/)' cd cv
#compctl -g '*.txt *.vim *.c *.cpp *.h *.hpp' + -g '*(-/)' vi
compctl -g '*.txt *.vim *.c *.cpp' gvim

# no binary files for vi
# zstyle ':completion:*:vi:*' ignored-patterns '*.(o|a|so|aux|dvi|log|swp|fig|bbl|blg|bst|idx|ind|out|toc|class|pdf|ps)'
# zstyle ':completion:*:vim:*' ignored-patterns '*.(o|a|so|aux|dvi|log|swp|fig|bbl|blg|bst|idx|ind|out|toc|class|pdf|ps)'
# zstyle ':completion:*:gvim:*' ignored-patterns '*.(o|a|so|aux|dvi|log|swp|fig|bbl|blg|bst|idx|ind|out|toc|class|pdf|ps)'

##########################################
#{{{ 路径别名 ROUTE
##########################################

hash -d vd="/d/软件/Vagaa"
hash -d now="/d/Project/visual_stdio/SoftTryClr/"
hash -d src="/d/Project/visual_stdio/SoftTryClr/SoftTryClr/"
hash -d sbak="/d/Project/project_bak/project_module/"
hash -d bt="/d/Project/VoltMemo/"
hash -d wkn="/cygdrive/d/学习/计算机/windows"
hash -d lp="/d/学习/l计算工作/DPD/lammps_software/lammps-15Jan10"
hash -d m="/c/Program Files/M-Variable"
hash -d lw="/d/学习/l计算工作"
hash -d cpp="/d/学习/cpp-learn/soft-交互性编程"
hash -d tdown="/cygdrive/c/Program Files/Tudou/飞速Tudou/tudou/download"
hash -d down="/cygdrive/d/temp/xic3/"
hash -d lfv="/d/学习/计算机/linux/knowledge/some-to-learn/fvwm-learn/"
hash -d lbak="/cygdrive/h/Data_backup/software/l_soft/"
hash -d vi="/d/学习/计算机/linux/knowledge/vi_advance"
hash -d kn="/d/学习/计算机/linux/knowledge/"
hash -d ukn="/d/学习/计算机/linux/knowledge/ubuntu-file"
hash -d zm="/c/Documents and Settings/南阳野人/桌面"
hash -d wz="/e/Program/wamp/www/htdocs"
hash -d lesson="/d/学习"
hash -d music="/d/娱乐/歌曲"
hash -d piano="/d/学习/电子钢琴"

#}}}
##########################################
#{{{ ANY ZSH

export HISTSIZE=2000
export HISTFILE="$HOME/.zhistory"
#(History won't be saved without the following command)
export SAVEHIST=$HISTSIZE

bindkey -e
# End of lines configured by zsh-newuser-install

#RPROMPT='%/'
#PROMPT='%{[36m%}%n%{[35m%}@%{[34m%}%M %{[33m%}%D %T  %{[32m%}%/
#%{[31m%}>>%{[m%}'

PROMPT='%{[32m%}%D %T @%{[33m%}%~%{[m%}
$ '

#PROMPT='%{[32m%}%D %T @%{[33m%}%~/%{[m%}
#S '

## append command to history file once executed
setopt INC_APPEND_HISTORY

#Disable core dumps
#limit coredumpsize 0

#设置DEL键为向后删除
bindkey "\e[3~" delete-char

#以下字符视为单词的一部分
WORDCHARS='*?_-[]~=&;!#$%^(){}<>'

#自动补全功能
setopt AUTO_LIST
setopt AUTO_MENU
setopt MENU_COMPLETE

autoload -U compinit
compinit

# Completion caching
zstyle ':completion::complete:*' use-cache on
zstyle ':completion::complete:*' cache-path .zcache
#zstyle ':completion:*:cd:*' ignore-parents parent pwd

#Completion Options
zstyle ':completion:*:match:*' original only
zstyle ':completion::prefix-1:*' completer _complete
zstyle ':completion:predict:*' completer _complete
zstyle ':completion:incremental:*' completer _complete _correct
zstyle ':completion:*' completer _complete _prefix _correct _prefix _match _approximate

# Path Expansion
zstyle ':completion:*' expand 'yes'
zstyle ':completion:*' squeeze-shlashes 'yes'
zstyle ':completion::complete:*' '\\'

zstyle ':completion:*:*:*:default' menu yes select
zstyle ':completion:*:*:default' force-list always

# GNU Colors 需要/etc/DIR_COLORS文件 否则自动补全时候选菜单中的选项不能彩色显示
[ -f /etc/DIR_COLORS ] && eval $(dircolors -b /etc/DIR_COLORS)
export ZLSCOLORS="${LS_COLORS}"
zmodload zsh/complist
zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}
zstyle ':completion:*:*:kill:*:processes' list-colors '=(#b) #([0-9]#)*=0=01;31'

zstyle ':completion:*' completer _complete _match _approximate
zstyle ':completion:*:match:*' original only
zstyle ':completion:*:approximate:*' max-errors 1 numeric

compdef pkill=kill
compdef pkill=killall
zstyle ':completion:*:*:kill:*' menu yes select
zstyle ':completion:*:processes' command 'ps -au$USER'

# Group matches and Describe
zstyle ':completion:*:matches' group 'yes'
zstyle ':completion:*:options' description 'yes'
zstyle ':completion:*:options' auto-description '%d'
zstyle ':completion:*:descriptions' format $'\e[01;33m -- %d --\e[0m'
zstyle ':completion:*:messages' format $'\e[01;35m -- %d --\e[0m'
zstyle ':completion:*:warnings' format $'\e[01;31m -- No Matches Found --\e[0m'

##for Emacs在Emacs终端中使用Zsh的一些设置 不推荐在Emacs中使用它
if [[ "$TERM" == "dumb" ]]; then
    setopt No_zle
    PROMPT='%n@%M %/
    >>'
    alias ls='ls '
fi

setopt nohup                   # and don't kill them, either
#setopt nolisttypes             # show types in completion
#setopt printexitvalue          # alert me if something's failed
setopt share_history           # _all_ zsh sessions share the same history files
setopt appendhistory           # don't overwrite history 

#}}}
##########################################


########################################## vim:fdm=marker

################################### RS ################################
function xpl {
     if [ "$1" = "" ]; then
         XPATH=.   # 缺省是当前目录
     else
         XPATH=$1
         XPATH="$(cygpath -C ANSI -w "$XPATH")";
     fi
     explorer $XPATH
}

# 修改 ls 目录的颜色
LS_COLORS='no=00;37:fi=00:di=4;36:ln=04;36:pi=40;33:so=01;35:bd=40;33;01:'
export LS_COLORS
#LS_COLORS=$LS_COLORS:'di=0;04:' ; export LS_COLORS
#修改 completion颜色
zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}

alias zz='cd d:/Project/XZ_CiDao'
alias backup='cd d:/Project/Backup'
alias learn='cd f:/RS_learn'
alias desktop='cd c:/users/xwj01/desktop'

alias sublime='/cygdrive/d/program/Sublime\ Text\ 3/subl.exe'
alias gvim='/cygdrive/d/program/Vim/vim80/gvim.exe'
alias shared_prefs='adb pull /data/data/com.voltmemo.xz_cidao/shared_prefs/com.voltmemo.xz_cidao_preferences.xml xz_cidao_preferences.xml'

export PATH=/cygdrive/d/program/Android/SDK/platform-tools:$PATH
#export TERM=xterm-256color
alias tmux="tmux -2"

