# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

# User specific environment
if ! [[ "$PATH" =~ "$HOME/.local/bin:$HOME/bin:" ]]
then
    PATH="$HOME/.local/bin:$HOME/bin:$PATH"
fi
export PATH

# Uncomment the following line if you don't like systemctl's auto-paging feature:
# export SYSTEMD_PAGER=

# User specific aliases and functions
if [ -d ~/.bashrc.d ]; then
	for rc in ~/.bashrc.d/*; do
		if [ -f "$rc" ]; then
			. "$rc"
		fi
	done
fi

unset rc

# My additions 

shopt -s histverify

export EDITOR=vi

#export PS1='\[\e[1;32m\][\W]$\[\e[0m\] '  # Green
#export PS1='\[\e[0;32m\]\u@\h \W\[\e[0m\]$ '  # Green
export PS1='\[\e[1;32m\]\u@\h \W\[\e[0m\] 👉 '  # Bold Green
export PROMPT_DIRTRIM=3
export PS0="\e[0m"

# inspired by kali defaul prompt
#export PS1="\[\e]0;\u@\h: \w\a\]\[\033[;94m\]┌──${debian_chroot:+($debian_chroot)──}${VIRTUAL_ENV:+(\[\033[0;1m\]$(basename $VIRTUAL_ENV)\[\033[;94m\])}(\[\033[1;31m\]\u㉿\h\[\033[;94m\])-[\[\033[0;1m\]\w\[\033[;94m\]]\n\[\033[;94m\]└─\[\033[1;31m\]\$\[\033[0m\] "
#export PS1="\[\033[;94m\]┌──(\[\033[1;32m\]\u@\h\[\033[;94m\])-[\[\033[0;1m\]\w\[\033[;94m\]]\n\[\033[;94m\]└─\[\033[1;32m\]\$\[\033[0m\] "

export PATH=.:$HOME/bin:$PATH

#eval $(crc oc-env)
#alias k=kubectl

export USHIFT_IP=192.168.122.133

alias k=kubectl
complete -o default -F __start_kubectl k
