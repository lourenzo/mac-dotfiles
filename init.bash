#!/bin/bash

# Absolute path to this script
SCRIPT="${BASH_SOURCE[0]}"

# Absolute path to the folder this script is in
INC_DIR=`dirname $SCRIPT`

# Infinite History
export HISTSIZE=
export HISTFILESIZE=

# Gnu CoreUtils
source $INC_DIR/gnu-coreutils.bash

# NPM Local modules path
export PATH="./node_modules/.bin:$PATH"

# Nodebrew PATH
if [ -d $HOME/.nodebrew/current/bin ]; then
  export PATH="$HOME/.nodebrew/current/bin:$PATH"
fi

# Rsync alias
alias rsync='rsync -az --info=progress2'

# Wakatime shell integration
source $INC_DIR/wakatime.bash

# Git PS1 (shell colorful branch indicator)
source $INC_DIR/git-ps1.bash

## And, last but not least
# Completion
source $INC_DIR/completion.bash
