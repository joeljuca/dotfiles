# https://github.com/joelwallis/dotfiles

ZSH=$HOME/.oh-my-zsh
ZSH_THEME='nicoulaj'
UPDATE_ZSH_DAYS=1
COMPLETION_WAITING_DOTS=true
plugins=(git nyan ruby rails tmux tmuxinator)

export EDITOR='vim'
export ATOM_REPOS_HOME="$HOME/Projetos/Open-Source"

# Misc
alias :q="exit"
alias cask='brew cask'
alias dog='cat'
# Temporary hard-coded alias until PR gets merged
# https://github.com/robbyrussell/oh-my-zsh/pull/5591
alias gsh='git show'
alias lg='git lg'
alias mongod.mac='mongod --config /usr/local/etc/mongod.conf'
alias mux='tmuxinator'
alias px="ps aux"

# PATH customizations
PATH="/usr/local/sbin:/usr/local/bin:$PATH" # Homebrew
PATH="usr/local/opt/openssl/bin:$PATH" # Homebrew powered OpenSSL
PATH="$HOME/.rvm/bin:$PATH" # RVM
PATH="$PATH:/usr/local/opt/go/libexec/bin" # Go

export NVM_DIR="$HOME/.nvm"
. "/usr/local/opt/nvm/nvm.sh"

# Homebrew GitHub API token
if [ -x ~/.ssh/set-homebrew-github-api-token.sh ]; then
  source  ~/.ssh/set-homebrew-github-api-token.sh
fi

source $ZSH/oh-my-zsh.sh
