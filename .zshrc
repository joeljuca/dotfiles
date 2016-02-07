# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="evan"

# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

# Set to this to use case-sensitive completion
# CASE_SENSITIVE="true"

# Comment this out to disable bi-weekly auto-update checks
# DISABLE_AUTO_UPDATE="true"

# Uncomment to change how often before auto-updates occur? (in days)
# export UPDATE_ZSH_DAYS=13

# Uncomment following line if you want to disable colors in ls
# DISABLE_LS_COLORS="true"

# Uncomment following line if you want to disable autosetting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment following line if you want to disable command autocorrection
# DISABLE_CORRECTION="true"

# Uncomment following line if you want red dots to be displayed while waiting for completion
# COMPLETION_WAITING_DOTS="true"

# Uncomment following line if you want to disable marking untracked files under
# VCS as dirty. This makes repository status check for large repositories much,
# much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(git git-flow jira nyan sublime urltools vagrant web-search)

source $ZSH/oh-my-zsh.sh

# Personal stuff
export EDITOR='vim'

# Drupal and Drush aliases. https://github.com/nuvoleweb/drush_alias

alias dr='drush'
alias drur='drush upwd $(drush uinf 1 | grep -e "User name" | grep -oe "[a-zA-Z0-9]\+\s\+$" | grep -e "[a-zA-Z0-9]\+") --password="$(date +%Y%m%d)"'
alias drsp='cp sites/default/default.settings.php sites/default/settings.php'
alias drcc='drush cache-clear all'
alias drdb='drush updb && drush cc all'
alias drdu='drush sql-dump --ordered-dump --result-file=dump.sql'
alias dren='drush pm-enable'
alias drdis='drush pm-disable'
alias drun='drush pm-uninstall'
alias drf='drush features'
alias drfd='drush features-diff'
alias drfu='drush -y features-update'
alias drfr='drush -y features-revert'
alias drfra='drush -y features-revert-all'
alias drlu='drush l10n-update'
alias drlur='drush l10n-update-refresh'

# Vagrant shortcuts
alias vg='vagrant'
alias vgup='vagrant up'
alias vgst='vagrant status'
alias vgsh='vagrant ssh'

# Misc
alias :q="exit"
alias dk='docker'
alias dkc='docker-compose'
alias dkm='docker-machine'
alias mongod.mac='mongod --config /usr/local/etc/mongod.conf'
alias px="ps aux"
alias t="trash"
alias v="vim"

# PATH customizations
export PATH="/usr/local/sbin:/usr/local/bin:$PATH" # Homebrew
export PATH="$PATH:$HOME/.composer/vendor/bin" # Composer
export ANDROID_HOME="/usr/local/opt/android-sdk" # Android SQK
export PATH="${PATH}:$ANDROID_HOME/platform-tools" # Android SQK
export PATH="${PATH}:$ANDROID_HOME/tools" # Android SQK

# Add GHC 7.10.2 to the PATH, via https://ghcformacosx.github.io/
export GHC_DOT_APP="/Applications/ghc-7.10.2.app"
if [ -d "$GHC_DOT_APP" ]; then
  export PATH="${PATH}:${HOME}/.local/bin:${HOME}/.cabal/bin:${GHC_DOT_APP}/Contents/bin"
fi

# For environment specific settings, please create a *.sh file at ./zsh-env
#for shell_file ./zsh-env/*.sh; do
#	source $shell_file
#done
