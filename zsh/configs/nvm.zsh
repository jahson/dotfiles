# if [[ $(brew ls --versions nvm) ]]
# then
#     export NVM_DIR="$HOME/.nvm"
#     . "$(brew --prefix nvm)/nvm.sh"
# fi

# Lazy load NVM to load shell faster
# See https://www.reddit.com/r/node/comments/4tg5jg/lazy_load_nvm_for_faster_shell_start/d5ib9fs
#
# Put all globally installed packages to NODE_GLOBALS
declare -a NODE_GLOBALS=(`find ~/.nvm/versions/node -maxdepth 3 -type l -wholename '*/bin/*' | xargs -n1 basename | sort | uniq`)
# These needs a special treatment
NODE_GLOBALS+=("node")
NODE_GLOBALS+=("nvm")

# A fn to actually load nvm
load_nvm () {
	export NVM_DIR="$HOME/.nvm"
	[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"
}
# Create temporary fns for each item in NODE_GLOBALS
# Each fn will
#   * delete all the temporary fns via `unset -f ${NODE_GLOBALS}`
#   * load NVM via load_nvm fn
#   * rerun original command
for cmd in "${NODE_GLOBALS[@]}"; do
	eval "${cmd}(){ unset -f ${NODE_GLOBALS}; load_nvm; ${cmd} \$@ }"
done
