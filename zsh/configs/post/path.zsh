# Homebrew
# NB: Calling the `brew --prefix` is slow
PATH="/usr/local/opt/coreutils/libexec/gnubin:/usr/local/bin:/usr/local/sbin:$PATH"
# Homebrew: Prefer GNU utils
PATH="/usr/local/opt/coreutils/libexec/gnubin:$PATH"
MANPATH="/usr/local/opt/coreutils/libexec/gnuman:$MANPATH"

# npm & node
NPM_PACKAGES=$HOME/.npm-packages
NODE_PATH="$NPM_PACKAGES/lib/node_modules:$NODE_PATH"
PATH="$NPM_PACKAGES/bin:$PATH"

# Go
export GOPATH="${HOME}/work/go"

# Composer
PATH=$HOME/.composer/vendor/bin:$PATH

export -U PATH
