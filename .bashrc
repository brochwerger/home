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

export PS1='\[\e[0;32m\]\u@\h \W\[\e[0m\]$ '  # Green
#export PS1='\[\e[1;32m\]\u@\h \W\[\e[0m\]$ '  # Bold Green

export PATH=.:$HOME/bin:$PATH

#eval $(crc oc-env)
#alias k=kubectl

