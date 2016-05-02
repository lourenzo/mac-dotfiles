#!/bin/bash
# Absolute path to this script. /home/user/bin/foo.sh
SCRIPT="${BASH_SOURCE[0]}"
# Absolute path this script is in. /home/user/bin
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

# Prompt
source $INC_DIR/git-prompt.bash

# PS1
source $INC_DIR/git-ps1.bash

# Server aliases
source $INC_DIR/servers.bash
## And, last but not least
# Completion
source $INC_DIR/completion.bash
