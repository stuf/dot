#!/usr/bin/env zsh
set -e

dirname=$(greadlink -f $(dirname "$0"))
echo "dirname: $dirname"
echo "       : ${dirname##*/}"

basename=$(greadlink -f $(basename "$0"))
echo "basename: $basename"

CWD_DIR=$(greadlink -f $(dirname "$0"))
ROOT=$(greadlink -f "$CWD_DIR/..")
VIM_DIR="$ROOT/vim"
SUBM_DIR="$ROOT/submodules"

echo "CWD_DIR: $CWD_DIR"
echo "VIM_DIR: $VIM_DIR"
echo "SUBML_DIR: $SUBM_DIR"

pushd $CWD_DIR

mkdir -p "$DOTDIR/vim/bundles"

bundles=("Vundle.vim")

# Symlink the appropriate submodules
for bundle in ${bundles[@]}; do
  bundle_dir="$SUBM_DIR/$bundle"
  bundle_name=${bundle_dir##*/}
  echo "Symlink bundle: $bundle_name"
  echo "            to: $VIM_DIR/bundles/$bundle_name"
  echo "          from: $bundle_dir"
  
  if [[ ! -h "$VIM_DIR/$bundle_dir" ]]; then
    ln -s "$bundle_dir" "$VIM_DIR/bundles/$bundle_name"
    echo "  Done."
  else
    echo "  Already linked."
  fi
done

exit

# Finally sync the `vim` folder to the home directory
echo "Symlink \`vim\` to \`$HOME/.vim\`"
if ! ln -s "$VIM_DIR" "$HOME/.vim"; then
  echo "Could not symlink this."
else
  echo "Done."
fi

