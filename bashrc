# Executed for every interactive shell.

# Test for an interactive shell.  There is no need to set anything
# past this point for scp and rcp, and it's important to refrain from
# outputting anything in those cases.
if [[ $- != *i* ]]
then
	# Shell is non-interactive.
	return
fi

# Preferred editor
export EDITOR=vim

# mySql prompt tuning
export MYSQL_PS1="(\U) [\d]>\_"

# convert multiline commands to one line
shopt -s cmdhist

# Check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# OS X specific {{{
if [[ $OS == "darwin" ]]
then
	# Java & Tomcat settings
	export CATALINA_HOME=/Users/jahson/sources/apache-tomcat-6.0.18-src/output/build
	export JAVA_HOME=/System/Library/Frameworks/JavaVM.framework/Home
	export CLASSPATH=./
	# PHP stuff to resolve autoconf and autoheader problems
	# export PHP_AUTOCONF='autoconf213'
	# export PHP_AUTOHEADER='autoheader213'
fi
#}}}

# Load completion scripts {{{
complete -o dirnames -d cd

if [ -f /opt/local/etc/bash_completion ]; then
	source /opt/local/etc/bash_completion
fi
if [[ -f ~/dotfiles/git.completion ]]
then
	source ~/dotfiles/git.completion
fi
if [[ -f ~/dotfiles/svn.completion ]]
then
	source ~/dotfiles/svn.completion
fi
#}}}
# Load aliases script {{{
if [[ -f ~/dotfiles/aliases.bash ]]
then
	source ~/dotfiles/aliases.bash
fi
#}}}

# Allow access to history from another window {{{
shopt -s histappend
PROMPT_COMMAND='history -a'
export HISTFILESIZE=4096
export HISTCONTROL=ignoreboth
# do not write following commands in history
export HISTIGNORE="ls:cd:[bf]g:exit:..:...:ll:lla""]"
#}}}

# Colors {{{
export CLICOLOR=1
set TERM xterm-256color; export TERM
# colored grep output
export GREP_OPTIONS='--color=auto' GREP_COLOR='1;32'
# colors for man
man() {
	env \
		LESS_TERMCAP_mb=$(printf "\e[1;37m") \
		LESS_TERMCAP_md=$(printf "\e[1;37m") \
		LESS_TERMCAP_me=$(printf "\e[0m") \
		LESS_TERMCAP_se=$(printf "\e[0m") \
		LESS_TERMCAP_so=$(printf "\e[1;47;30m") \
		LESS_TERMCAP_ue=$(printf "\e[0m") \
		LESS_TERMCAP_us=$(printf "\e[0;36m") \
		man "$@"
}

# Bash prompt tuning {{{
case $(id -u) in
	0)
		# root
		export STARTCOLOR='\[\e[1;31m\]';
		;;
	*)
		# user
		export STARTCOLOR='\[\e[0;32m\]';
		;;
esac
export ENDCOLOR="\[\e[0m\]"

PS1='\[\e[0;36m\][\t] \[\e[0;37m\]\u@\h:'$STARTCOLOR'$PWD'$ENDCOLOR' \[\e[0;35m\]$(vcprompt)\[\e[0m\]\$ ' 
#}}}
# Directory colors {{{
if  [[ $OS == "linux" ]]
then
	export LS_COLORS='di=93:fi=0:ln=31:pi=5:so=5:bd=5:cd=5:or=31:mi=0:ex=91:*.rb=90'
else
	# export LSCOLORS="dxfxcxdxbxegedabagacad"
	export LSCOLORS=gxfxbEaEBxxEhEhBaDaCaD
fi
#}}}
# }}}

[ -f ~/.fzf.bash ] && source ~/.fzf.bash
# vim: set ts=4 sw=4 noexpandtab fdm=marker: #
