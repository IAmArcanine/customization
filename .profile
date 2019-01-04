PATH=$PATH:~/Bin:./
source ~/.bashrc
#STARTGREEN="\e[0;32m";
#ENDCOLOR="\e[0m"
#export PS1="$STARTCOLOR\u@\h \w> $ENDCOLOR"
# Setting PATH for Python 3.5
# The orginal version is saved in .profile.pysave
PATH="/Library/Frameworks/Python.framework/Versions/3.5/bin:${PATH}"
export PATH
export PATH=$PATH:/usr/local/bin/git
export GOPATH=$HOME/work
export PATH="/usr/local/sbin:$PATH"
export PATH="/usr/include:$PATH"
export
PATH="/usr//local/Cellar/gcc/8.2.0/lib/gcc/8/gcc/x86_64-apple-darwin18.0.0/8.2.0/include/:/usr/local/Cellar/python\@2/2.7.15_1/bin/:$PATH"
#export PATH="$PATH:/usr/pgsql-9.2/bin"
export EDITOR='subl -w'
if [ -f ~/.git-prompt.sh ]; then
  source ~/.git-prompt.sh
  export PS1='RK9[\W]$(__git_ps1 "(%s)"): '
fi
