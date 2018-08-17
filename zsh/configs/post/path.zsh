# Homebrew
PATH="$(brew --prefix coreutils)/libexec/gnubin:$(brew --prefix)/bin:$(brew --prefix)/sbin:$PATH"
MANPATH="$(brew --prefix coreutils)/libexec/gnuman:$MANPATH"

# npm & node
NPM_PACKAGES=$HOME/.npm-packages
NODE_PATH="$NPM_PACKAGES/lib/node_modules:$NODE_PATH"
PATH="$NPM_PACKAGES/bin:$PATH"

# Go
export GOPATH=$HOME/golang
PATH=$PATH:$GOPATH/bin

# Composer
PATH=$HOME/.composer/vendor/bin:$PATH

export -U PATH
