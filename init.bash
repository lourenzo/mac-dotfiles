#!/bin/bash
# Absolute path to this script. /home/user/bin/foo.sh
SCRIPT="${BASH_SOURCE[0]}"
# Absolute path this script is in. /home/user/bin
INC_DIR=`dirname $SCRIPT`

# Gnu CoreUtils
source $INC_DIR/gnu-coreutils.bash

# Completion
source $INC_DIR/completion.bash

# PS1
source $INC_DIR/git-ps1.bash

# Server aliases
source $INC_DIR/servers.bash
