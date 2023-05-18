# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

parse_git_branch() {
     git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/(\1)/'
}

# User specific environment
#export PS1='\[\e[1;32m\]\u@\h \W \[\e[91m\]\[\e[0m\] 👉 '  # Bold Green
export PS1="\u@\h \[\e[1;32m\]\W \[\e[91m\]\$(parse_git_branch)\[\e[00m\]$ "
export PROMPT_DIRTRIM=3
export GOPATH=$HOME/repos

if ! [[ "$PATH" =~ "$HOME/.local/bin:$HOME/bin:" ]]
then
    PATH=".:$GOPATH/bin:$HOME/.local/bin:$HOME/bin:$PATH"
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

shopt -s histverify
export EDITOR=vi
alias k=kubectl
complete -o default -F __start_kubectl k
