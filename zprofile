# https://github.com/neovim/neovim/issues/1415#issuecomment-63947728
prefixes_dir="$HOME/.user-prefixes"
if [[ -d $prefixes_dir(#qN) ]]; then
    for dir in "$prefixes_dir"/*; do
        dir=${dir:A}
        if [[ -d "$dir/bin" ]]; then
            PATH="$dir/bin:$PATH"
        fi
        if [[ -d "$dir/share/man" ]]; then
            MANPATH="$dir/share/man:$MANPATH"
        fi
        if [[ -d "$dir/lib" ]]; then
            LD_LIBRARY_PATH="$LD_LIBRARY_PATH:$dir/lib"
        fi
        if [[ -d "$dir/lib/pkgconfig" ]]; then
            PKG_CONFIG_PATH="$dir/lib/pkgconfig:$PKG_CONFIG_PATH"
        fi
    done
fi
unset dir prefixes_dir
export PATH MANPATH LD_LIBRARY_PATH PKG_CONFIG_PATH
