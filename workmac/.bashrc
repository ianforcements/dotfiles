# hardcode language
export LANG=en_US.UTF-8
export LC_ALL=en_US.UTF-8

# set prompt
PROMPT_DIRTRIM=2
PROMPT_COMMAND='PS1="\[\033[33m\]\!|\[\033[36m\]\u@\h\[\033[00m\]|\w\[\033[35m\]$\[\033[00m\] "'

# vi mode
set -o vi

# security
export HOMEBREW_NO_ANALYTICS=1
export HOMEBREW_NO_INSECURE_REDIRECT=1
export DOTNET_CLI_TELEMETRY_OPTOUT=1

# force check hashes of packages 
export HOMEBREW_CASK_OPTS=--require-sha

#for ruby to know where to install gems
export GEM_HOME=/Users/ianhutchinson/.gem
export PATH=/usr/local/opt/ruby@2.5/bin:$PATH

# android home
export ANDROID_HOME="/Users/ianhutchinson/Library/Android/Sdk"
export ANDROID_NDK_HOME="/Users/ianhutchinson/Library/Android/Sdk/ndk-bundle"
export PATH=$PATH:$ANDROID_HOME/tools:$ANDROID_HOME/platform-tools

# java home
export JAVA_8_HOME=$(/usr/libexec/java_home -v1.8)
export JAVA_HOME="$JAVA_8_HOME"
export PATH="$JAVA_HOME/bin":$PATH

# stop using apple llvm use our preferred ones instead
export PATH="$(brew --prefix)/opt/llvm/bin":$PATH

#testing framework
export PATH="$(brew --prefix)/opt/cmocka/include":$PATH
#tools to connect to devices connected via usb, emulators usw
export PATH="/Users/ianhutchinson/Library/Android/sdk/platform-tools":$PATH

#for radare2
export PATH="$HOME/.local/share/radare2/prefix/bin/":$PATH
export R2PM_DBDIR="/Users/ianhutchinson/dev/tools/radare2-pm/db/"
export R2PM_BINDIR="/Users/ianhutchinson/.local/share/radare2/prefix/bin"

#for cargo
export PATH="$HOME/.cargo/bin/":$PATH

#for coloured output of eg. ls
export CLICOLOR=1
export LSCOLORS=fxgxcxdxbxegxfxbaggfgf
alias ll="ls -l"

#functions for simpler vagrant operation
vagranttakerator () 
{
	vagrantname="$(vagrant global-status | awk -v name=$1 '$2==name { print $1 }')";
	$(vagrant scp $vagrantname:$2 $3);
}
vagranthomedirsenderator () 
{
	vagrantname="$(vagrant global-status | awk -v name=$1 '$2==name { print $1 }')";
	$(vagrant scp $2 $vagrantname:/home/vagrant/);
}
vagrantgiverator ()
{
	vagrantname="$(vagrant global-status | awk -v name=$1 '$2==name { print $1 }')";
	$(vagrant scp $2 $vagrantname:$3);
}
vagrantloginerator () 
{
	vagrantname="$(vagrant global-status | awk -v name=$1 '$2==name { print $1 }')";
	vagrant ssh $vagrantname; 
}
vagrantstarterator ()
{
	vagrantname="$(vagrant global-status | awk -v name=$1 '$2==name { print $1 }')";
	vagrant up $vagrantname; 
}
vagrantantistarterator ()
{
	vagrantname="$(vagrant global-status | awk -v name=$1 '$2==name { print $1 }')";
	vagrant halt $vagrantname; 
}
