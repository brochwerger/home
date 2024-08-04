# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

parse_git_branch() {
     git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
}

# User specific environment
#export PS1='\[\e[1;32m\]\u@\h \W \[\e[91m\]\[\e[0m\] 👉 '  # Bold Green
export PS1="\[\e[32m\][\u@\h:\W\[\e[1;91m\]\$(parse_git_branch)\[\e[32m\]]\[\e[00m\]\$ "
#export PS1="\[\e[32m\][\u@\h:\W\$(parse_git_branch)]\[\e[00m\]\$ "
export PROMPT_DIRTRIM=3

if ! [[ "$PATH" =~ "$HOME/.local/bin:$HOME/bin:" ]]
then
    PATH=".:$HOME/.local/bin:$HOME/bin:$PATH"
fi
export PATH

# Setup GO
export GOROOT=/opt/go
export GOPATH=$HOME/repos
PATH="$GOPATH/bin:$GOROOT/bin:$PATH"

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


## Autostart tmux
## [ -z "$TMUX" ] && [ "$TERM" == "xterm-256color" ] && { tmux attach || exec tmux new-session && exit;}
#[ -z "$TMUX" ] && [ "$TERM" == "xterm-256color" ] && { exec tmux new-session && exit;}
