# some aliases were taken from http://hayne.net/MacDev/Bash/aliases.bash

# reload bash to get new settings to work
alias reloadbash='source ~/.bash_profile'

# showa: to remind yourself of an alias (given some part of it)
showa() { grep -i -a1 $@ ~/.bash_aliases | grep -v '^\s*$' ; }
# show frequently used commands
alias cmdprofile="history | awk '{print \$2}' | awk 'BEGIN{FS=\"|\"}{print \$1}' | sort | uniq -c | sort -n | tail -n 20 | sort -nr"

# Convenience {{{
alias cls="clear"
if [[ $OS == "linux" ]]
then
	alias ls="ls --color=auto"
else
	alias ls="ls -hGF"
fi
alias ll="ls -lhF"
alias la="ls -a"
alias lla="ls -la"
alias ps?="ps waux |grep"
alias gi="grep -Ri"
alias tgz="tar zxpf"
alias e="vim"
alias se="sudo vim"
alias ..="cd .."
alias ...="cd .. ; cd .."
alias ....="cd ..; cd ..; cd .."
alias rrf="rm -rf"
alias cpr="cp -r"
# git aliases
alias gs="git status"
alias ga="git add "
alias gb="git branch "
alias gc="git commit"
alias gd="git diff"
alias go="git checkout "
# svn aliases
alias sup="svn up"
alias sad="svn add"
alias ss="svn status"
alias sc="svn commit"
alias sd="svn diff"
# auto-sudo for some commands
alias port="sudo port"
alias pecl="sudo pecl"
alias pear="sudo pear"
alias cpan="sudo cpan"
alias apt-get="sudo apt-get"
# rm_ds: removes all .DS_Store file from the current dir and below
alias rm_ds='find . -name .DS_Store -exec rm {} \;'
#}}}

# OS X aliases {{{
if [[ $OS == "darwin" ]]
then
	# Clean firefox profile
	alias cleanfirefox="find ~/Library/Application\ Support/Firefox/Profiles -name '*.sqlite' -exec sqlite3 {} VACUUM \;}"

	# Search for a file using Spotlight's metadata
	function locatemd { mdfind "kMDItemDisplayName == '$@'wc" ; }

	# clean_open_with: clean "open with" menu in OS X 10.5+
	function clean_open_with {
		rm ~/Library/Preferences/com.apple.LaunchServices.* ;
		/System/Library/Frameworks/CoreServices.framework/Versions/A/Frameworks/LaunchServices.framework/Versions/A/Support/lsregister -kill -r -domain local -domain system -domain user ;
	}

	function clean_asl { sudo rm -f /private/var/log/asl/*.asl ; }

	# dict: lookup a word with Dictionary.app
	dict () { open dict:///"$@" ; }
fi
#}}}

# Development aliases {{{

# count connections by ip
alias ccip="netstat -ntu | awk '{print $5}' | cut -d: -f1 | sort | uniq -c | sort -n"

# Compare remote file with local file, $1 is user@host, $2 is remote file, $3 - local
# file
rdiff () { ssh $1 cat $2 | diff $3 - ; }

# }}}

# Search {{{

# ff:  to find a file under the current directory
ff () { /usr/bin/find . -name "$@" ; }
# ffs: to find a file whose name starts with a given string
ffs () { /usr/bin/find . -name "$@"'*' ; }
# ffe: to find a file whose name ends with a given string
ffe () { /usr/bin/find . -name '*'"$@" ; }
# fh: to find a record in history
fh() { grep "$@" ~/.bash_history ; }

# }}}

#  vim: set ts=4 sw=4 noexpandtab ft=sh fdm=marker: #
