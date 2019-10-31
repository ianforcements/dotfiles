# hardcode language
export LANG=en_US.UTF-8
export LC_ALL=en_US.UTF-8

# library path
export LD_LIBRARY_PATH=/usr/local/lib

# set prompt
PROMPT_DIRTRIM=2
PROMPT_COMMAND='PS1="\[\033[33m\]\!|\[\033[35m\]\u@\h\[\033[00m\]|\w\[\033[36m\]$\[\033[00m\] "'

# vi mode
set -o vi

#for ruby to know where to install gems
export GEM_HOME=/Users/vagrant/.gem
export PATH=/usr/local/opt/ruby@2.5/bin:$PATH

# java home
#export JAVA_8_HOME=$(/usr/libexec/java_home -v1.8)
#export JAVA_HOME="$JAVA_8_HOME"
#export PATH="$JAVA_HOME/bin":$PATH

#testing framework
#export PATH="$(brew --prefix)/opt/cmocka/include":$PATH

#for radare2
export PATH="$HOME/.local/share/radare2/prefix/bin/":$PATH
export R2PM_DBDIR="/Users/vagrant/dev/tools/radare2-pm/db/"
export R2PM_BINDIR="/Users/vagrant/.local/share/radare2/prefix/bin"

#for rust cargo
export PATH="$HOME/.cargo/bin/":$PATH

#for coloured output of eg. ls
export CLICOLOR=1
export LS_COLORS="di=35:ln=36:so=32:pi=33:ex=31:bd=34;46:cd=0;45:su=0;41:sg=30;46:tw=36;45:ow=36;45"
alias ll="ls -l --color"
alias ls="ls --color"
