# https://github.com/joelwallis/dotfiles

ZSH=$HOME/.oh-my-zsh
ZSH_THEME='avit'
UPDATE_ZSH_DAYS=1
COMPLETION_WAITING_DOTS=true
plugins=(git ruby rails tmux)

# Misc
alias e="echo"
alias v="vim"
alias :q="exit"
alias cask='brew cask'
alias dog='cat'
alias https='http --default-scheme=https'
# Temporary hard-coded till PR is merged. https://github.com/robbyrussell/oh-my-zsh/pull/5591
alias gsh='git show'
alias lg='git lg'
alias mongod.mac='mongod --config /usr/local/etc/mongod.conf'
alias mux='tmuxinator'
alias services='brew services'
alias px="ps aux"
alias vim="nvim"

export ATOM_REPOS_HOME="$HOME/Projetos/Open-Source"
export EDITOR='nvim'
export GOPATH="$HOME/.go"
export HISTCONTROL="ignorespace"
export REACT_EDITOR='atom'

export NVM_DIR="$HOME/.nvm"
export NVM_DIR_HOMEBREW="/usr/local/opt/nvm"
[ -s "$NVM_DIR_HOMEBREW/nvm.sh" ] && . "$NVM_DIR_HOMEBREW/nvm.sh"
[ -s "$NVM_DIR_HOMEBREW/etc/bash_completion" ] && . "$NVM_DIR_HOMEBREW/etc/bash_completion"

[ -s "$NVM_DIR_HOMEBREW/etc/bash_completion" ] && . "$NVM_DIR_HOMEBREW/etc/bash_completion"

#export NVM_DIR="$HOME/.nvm"
#[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
#[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"
if [ -s "$NVM_DIR/nvm.sh" ]; then
  # https://github.com/creationix/nvm#zsh
  autoload -U add-zsh-hook
  load-nvmrc() {
    local node_version="$(nvm version)"
    local nvmrc_path="$(nvm_find_nvmrc)"

    if [ -n "$nvmrc_path" ]; then
      local nvmrc_node_version=$(nvm version "$(cat "${nvmrc_path}")")

      if [ "$nvmrc_node_version" = "N/A" ]; then
        nvm install
      elif [ "$nvmrc_node_version" != "$node_version" ]; then
        nvm use
      fi
    elif [ "$node_version" != "$(nvm version default)" ]; then
      echo "Reverting to nvm default version"
      nvm use default
    fi
  }
  add-zsh-hook chpwd load-nvmrc
  load-nvmrc
fi

nvm use default 2>&1

# PATH customizations
export PATH="/usr/local/sbin:/usr/local/bin:$PATH" # Homebrew
export PATH="usr/local/opt/openssl/bin:$PATH" # Homebrew powered OpenSSL
export PATH="/usr/local/opt/ruby/bin:$PATH" # Homebrew powered Ruby
export PATH="$HOME/.rvm/bin:$PATH" # RVM
export PATH="$PATH:$HOME/.composer/vendor/bin" # Composer
export PATH="$PATH:/usr/local/opt/go/libexec/bin" # Go

export ANDROID_HOME="$HOME/Library/Android/sdk"
export PATH="$PATH:$ANDROID_HOME/tools"
export PATH="$PATH:$ANDROID_HOME/platform-tools"

# Google Cloud SDK
for prefix in path completion; do
  if [ -x "/usr/local/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/${prefix}.zsh.inc" ]; then
    source "/usr/local/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/${prefix}.zsh.inc"
  fi
done

# Homebrew GitHub API token
[ -x "${HOME}/.ssh/set-homebrew-github-api-token.sh" ] && \.  "${HOME}/.ssh/set-homebrew-github-api-token.sh"


GCP_SDK_PREFIX="/usr/local/Caskroom/google-cloud-sdk"
[ -d "${GCP_SDK_PREFIX}" ] && . "${GCP_SDK_PREFIX}/latest/google-cloud-sdk/path.zsh.inc"

function c {
  echo -n $1 \
    | wc -m \
    | xargs # easy way to trim a string
}

function beep {
  echo -e "\a"
}

function number-only {
  echo -n $1 \
    | xargs \
    | sed -E "s/[^0-9]+//g"
}
alias nonly=number-only

source $ZSH/oh-my-zsh.sh
