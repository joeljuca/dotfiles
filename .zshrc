# https://github.com/joelwallis/dotfiles

ZSH=$HOME/.oh-my-zsh
ZSH_THEME='nicoulaj'
UPDATE_ZSH_DAYS=1
COMPLETION_WAITING_DOTS=true
plugins=(git nyan ruby rails tmux tmuxinator)

# Misc
alias e="echo"
alias v="vim"
alias :q="exit"
alias cask='brew cask'
alias dog='cat'
# Temporary hard-coded till PR is merged. https://github.com/robbyrussell/oh-my-zsh/pull/5591
alias gsh='git show'
alias lg='git lg'
alias mongod.mac='mongod --config /usr/local/etc/mongod.conf'
alias mux='tmuxinator'
alias services='brew services'
alias px="ps aux"
alias vim="nvim"

export ATOM_REPOS_HOME="$HOME/Projetos/Open-Source"
export EDITOR='vim'
export GOPATH="$HOME/.go"
export HISTCONTROL="ignorespace"
export NVM_DIR="$HOME/.nvm"
[ -d "/usr/local/opt/nvm/nvm.sh" ] && . "/usr/local/opt/nvm/nvm.sh"
export REACT_EDITOR='atom'

# PATH customizations
export PATH="/usr/local/sbin:/usr/local/bin:$PATH" # Homebrew
export PATH="usr/local/opt/openssl/bin:$PATH" # Homebrew powered OpenSSL
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
if [ -x ~/.ssh/set-homebrew-github-api-token.sh ]; then
  source  ~/.ssh/set-homebrew-github-api-token.sh
fi

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
