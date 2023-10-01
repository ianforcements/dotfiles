# vi mode
set -o vi
export VISUAL=vim
autoload edit-command-line; zle -N edit-command-line
bindkey -M vicmd 'v' edit-command-line

# command aliases
alias ll='ls -al --color=auto'
# alias python=python3 # leave this disabled unless you have a good reason

#style
# maybe set this in .tmux.conf instead?
export TERM=xterm-256color
export GREP_OPTIONS='--color=auto'
export GREP_COLOR="1;35;40"

# security
export HOMEBREW_NO_ANALYTICS=1
export HOMEBREW_NO_INSECURE_REDIRECT=1
export DOTNET_CLI_TELEMETRY_OPTOUT=1

# force check hashes of packages 
export HOMEBREW_CASK_OPTS=--require-sha

# Bazel
export USE_BAZEL_VERSION=4.2.2

# xcode
export XCODE13_0=/Applications/Xcode.app

#Android home
export ANDROID_HOME=/Users/ianhutchinson/Library/Android/sdk
export ANDROID_NDK_HOME=/Users/ianhutchinson/Library/Android/sdk/ndk/20.0.5594570
#Android SDK command line tools
export PATH=$PATH:$ANDROID_HOME/cmdline-tools/latest/bin
export PATH=$PATH:$ANDROID_HOME/platform-tools
export PATH=$PATH:$ANDROID_HOME/build-tools/32.0.0

#more path stuff
export PATH=$PATH:/users/ianhutchinson/bin
export PATH=$PATH:/Users/ianhutchinson/Library/Python/3.8/bin
export PATH=$PATH:/opt/homebrew/opt/binutils/bin

# arch specific stuff
termarch=$(arch)
if [[ $termarch == "arm64" ]]; then
  PROMPT="%n|amd64|%(4~|.../%3~|%~) > "
  export PATH=$PATH:/opt/homebrew/bin/ 
  eval "$(/opt/homebrew/bin/brew shellenv)"
  # not sure if this jvm is actually needed?
  #export JAVA_HOME=$(/usr/libexec/java_home)
  #update: we're removing oracle java if we can help it, so just use temurin
  # update update: use AARCH64 temurin 11 jdk as described in README of pgo-server, to build pgo-server. maybe for other things too but check per project? I guess?
  export JAVA_HOME="/Library/Java/JavaVirtualMachines/temurin-11.jdk/Contents/Home"
  export JDK_11_ROOT="/Library/Java/JavaVirtualMachines/temurin-11.jdk/Contents/Home"
  # connect to specific tmux, allows multiple tmuxes at once.
  # Each pane runs zshrc anew, so wrap this in a conditional to prevent nested sessions
  if [[ $SHLVL < "2" ]]; then
    tmux -L arm64
  fi
elif [[ $termarch == "i386" ]]; then
  PROMPT="%n|i386|%(4~|.../%3~|%~) > "
  export PATH=$PATH:/usr/local/Homebrew/bin
  eval "$(/usr/local/Homebrew/bin/brew shellenv)"
  export JAVA_HOME="/Library/Java/JavaVirtualMachines/temurin-8.jdk/Contents/Home"
  # connect to specific tmux, allows multiple tmuxes at once.
  # Each pane runs zshrc anew, so wrap this in a conditional to prevent nested sessions
  if [[ $SHLVL < "2" ]]; then
    tmux -L i386
  fi
fi

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/ianhutchinson/google-cloud-sdk/path.zsh.inc' ]; then . '/Users/ianhutchinson/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/Users/ianhutchinson/google-cloud-sdk/completion.zsh.inc' ]; then . '/Users/ianhutchinson/google-cloud-sdk/completion.zsh.inc'; fi
