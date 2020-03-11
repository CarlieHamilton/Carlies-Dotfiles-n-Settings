# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac

# don't put duplicate lines or lines starting with space in the history.
# See bash(1) for more options
HISTCONTROL=ignoreboth

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=1000
HISTFILESIZE=2000

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# If set, the pattern "**" used in a pathname expansion context will
# match all files and zero or more directories and subdirectories.
#shopt -s globstar

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "${debian_chroot:-}" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
    xterm-color|*-256color) color_prompt=yes;;
esac

# uncomment for a colored prompt, if the terminal has the capability; turned
# off by default to not distract the user: the focus in a terminal window
# should be on the output of commands, not on the prompt
#force_color_prompt=yes

if [ -n "$force_color_prompt" ]; then
    if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
	# We have color support; assume it's compliant with Ecma-48
	# (ISO/IEC-6429). (Lack of such support is extremely rare, and such
	# a case would tend to support setf rather than setaf.)
	color_prompt=yes
    else
	color_prompt=
    fi
fi

if [ "$color_prompt" = yes ]; then
    PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '
else
    PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w\$ '
fi
unset color_prompt force_color_prompt

# If this is an xterm set the title to user@host:dir
case "$TERM" in
xterm*|rxvt*)
    PS1="\[\e]0;${debian_chroot:+($debian_chroot)}\u@\h: \w\a\]$PS1"
    ;;
*)
    ;;
esac

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    #alias dir='dir --color=auto'
    #alias vdir='vdir --color=auto'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

# colored GCC warnings and errors
#export GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'

# some more ls aliases
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'

# Add an "alert" alias for long running commands.  Use like so:
#   sleep 10; alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

# Alias definitions.
# You may want to put all your additions into a separate file like
# ~/.bash_aliases, instead of adding them here directly.
# See /usr/share/doc/bash-doc/examples in the bash-doc package.

if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi

# Setting vi mode on as default
set -o vi

# Push a branch to origin and set upstream tracking.
# Will abort if you're on master. You should be publishing a feature branch.
# Warns you if there are uncommitted changes - but does not abort.
function gitpublish() {
    BRANCH=`git symbolic-ref --short -q HEAD`;
    if [ "$BRANCH" == "master" ]; then
        echo "You're on master. You shouldn't publish this.";
        return 1;
    fi;
    if [[ -n $(git status -s) ]]; then
        echo "WARNING: You have uncommitted changes or a dirty working tree.";
        echo "WARNING: I'm not telling you what to do, but maybe you forgot to commit?"
    fi;
    echo "Publishing an upstream branch for $BRANCH.";
    git push -u origin $BRANCH;
 }

 # "Unwind a branch".
 # Once a branch has been merged to master, run this to make the local repository clean again.
 # First checks that the current branch is not ahead of master. Will abort if it isn't.
 # Prunes remote branches (so, delete your upstream branches once they are merged and finalised.)
 # Switches to master, and deletes the local branch that you were on previously.
 # Fast-forwards master to origin/master.
 function gitunwind() {
     if [[ -n $(git status -s) ]]; then
         echo "You have uncommitted changes or a dirty working tree. Aborting.";
         git status -s;
         return 1;
     fi;

     BRANCH=`git symbolic-ref --short -q HEAD`;
     if [ "$BRANCH" != "master" ]; then
         echo "Pulling remote changes...";
         git fetch --prune origin;
         HEADREV=`git rev-parse HEAD`;
         BASEREV=`git merge-base HEAD origin/master`;
         if [ "$HEADREV" == "$BASEREV" ]; then
             echo "Great; $BRANCH is on master. Unwinding...";
             git checkout master;
             git merge origin/master --ff-only;
             git branch -d $BRANCH;
             echo ""
             echo "Unwind complete. Deleted: $BRANCH."
             echo "Here's what you missed:"
             echo ""
             git log --oneline $HEADREV~1..master
         else
             echo "$BRANCH is ahead of master. Aborting."
         fi;
     else
         echo "You're on master. Nothing to unwind!";
         echo "Will update instead.";
         git pull --prune;
     fi;
 }

# This is my function to create a git repo in github
gitnewrepo() {
	mkdir "$1";
	cd "$1";
	git init;
	echo "# "$1"" >> README.md;
	echo "## "$2"" >> README.md;
	echo "by Carlie Hamilton" >> README.md;
	git add .;
	git commit -m "initial commit";
	curl -u 'BlueCodeThree' https://api.github.com/user/repos -d '{"name":"'"$1"'","description":"'"$2"'"}';
	git remote add origin git@github.com:BlueCodeThree/"$1".git;
	git push -u origin master;
	echo "Your repo has now been created";
}

# create and move into a new directory
cddir() {
	mkdir "$1";
	cd "$1";
}

# adjust screen brightness
# alias created in my ~/bash_aliases file to get the names of the monitors, just type "monitors"
# $1 = monitor name
# $2 = brightness. 0.5 will make it darker, 1 will be the same, 1.5 will make it brighter
brightness() {
	xrandr --output "$1" --brightness "$2";
}
