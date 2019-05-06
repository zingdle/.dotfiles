#!/bin/bash

DOTFILES_ROOT=$(git rev-parse --show-toplevel)
OVERRIDE=true
VERBOSE=true

# must PROG
function must() {
  if !(command -v "$1" >/dev/null 2>&1); then
    echo "$1 not installed, exiting..."
    exit 1
  fi
}


# link SRC_FILE DST_DIR
# link SRC_FILE DST_DIR DST_FILE
function link() {
  SRC_FILE=$1
  SRC_PATH=$SRC_DIR/$SRC_FILE
  DST_DIR=$2
  DST_FILE=$3

  # https://stackoverflow.com/questions/3601515/how-to-check-if-a-variable-is-set-in-bash
  # https://stackoverflow.com/questions/3427872/whats-the-difference-between-and-in-bash
  # https://unix.stackexchange.com/questions/114402/inline-conditionals-for-assignment
  [[ -z ${DST_FILE} ]] && DST_PATH=${DST_DIR}/$SRC_FILE || DST_PATH=${DST_DIR}/${DST_FILE}

  if [[ (-d ${DST_PATH} || -f ${DST_PATH}) && $OVERRIDE = false ]]; then
    [[ $VERBOSE = true ]] && echo ${DST_PATH} exists, skipping...
  else
    [[ $VERBOSE = true ]] && echo linking ${SRC_PATH} "->" ${DST_PATH}
    ln -sf ${SRC_PATH} ${DST_PATH}
  fi
}


echo OVERRIDE: $OVERRIDE
echo VERBOSE: $VERBOSE

must git
if [[ ! -d $HOME/.oh-my-zsh ]]; then
  echo oh-my-zsh not installed, try this first...
  echo 'sh -c "$(wget https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh -O -)"'
  exit
fi

for config in **/config.sh; do
  SRC_DIR=$DOTFILES_ROOT/$(dirname $config)
  [[ $VERBOSE = true ]] && echo running $SRC_DIR
  source ${config}
done
