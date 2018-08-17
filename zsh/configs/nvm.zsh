if [[ $(brew ls --versions nvm) ]]
then
    export NVM_DIR="$HOME/.nvm"
    . "$(brew --prefix nvm)/nvm.sh"
fi
