#####################
# Completion
# -------------------

# Brew's Bash Completion
if [ -f $(brew --prefix)/etc/bash_completion ]; then
  source $(brew --prefix)/etc/bash_completion
fi

# Nodebrew Completion
if [ -f $HOME/.nodebrew/completions/bash/nodebrew-completion  ]; then
  source $HOME/.nodebrew/completions/bash/nodebrew-completion
fi

# Heroku Completion
if [ -f $HOME/.heroku/plugins/heroku-bash-completion/heroku-completion.bash ]; then
  source "/Users/lourenzo/.heroku/plugins/heroku-bash-completion/heroku-completion.bash"
fi

# Yo Completion
# Bash completion for Yeoman generators - tested in Ubuntu, OS X and Windows (using Git bash)
function _yo_generator_complete_() {
  # local node_modules if present
  local local_modules=$(if [ -d node_modules ]; then echo "node_modules:"; fi)
  # node_modules in /usr/local/lib if present
  local usr_local_modules=$(if [ -d /usr/local/lib/node_modules ]; then echo "/usr/local/lib/node_modules:"; fi)
  # node_modules in user's Roaming/npm (Windows) if present
  local win_roam_modules=$(if [ -d $(which yo)/../node_modules ]; then echo "$(which yo)/../node_modules:"; fi)
  # also, node_modules in nodebrew current
  local nodebrew_modules=$(if [ -d ${HOME}/.nodebrew/current/lib/node_modules ]; then echo "${HOME}/.nodebrew/current/lib/node_modules:"; fi)
  # concat and also add $NODE_PATH
  local node_dirs="${local_modules}${usr_local_modules}${win_roam_modules}${nodebrew_modules}${NODE_PATH}"
  # split $node_dirs and return anything starting with 'generator-', minus that prefix
  local generators_all=$(for dir in $(echo $node_dirs | tr ":" "\n"); do command ls -1 $dir | grep ^generator- | cut -c11-; done)
  # get the word fragment
  local word=${COMP_WORDS[COMP_CWORD]}
  # don't attempt to filter w/`grep` if `$word` is empty
  local generators_filtered=$(if [ -z "$word" ]; then echo "$generators_all"; else echo "$generators_all" | grep $word; fi)
  COMPREPLY=($generators_filtered)
}
complete -F _yo_generator_complete_ yo


# Gulp completion
# TODO: add message when gulp is not available
#if [ -x `which gulp`]; then
#  eval "$(gulp --completion=bash)"
#fi
function _gulp_completions() {
  # The currently-being-completed word.
  local cur="${COMP_WORDS[COMP_CWORD]}"
  #Grab tasks
  local compls=$(gulp --tasks-simple)
  # Tell complete what stuff to show.
  COMPREPLY=($(compgen -W "$compls" -- "$cur"))
}
complete -o default -F _gulp_completions gulp

###-begin-npm-completion-###
#
# npm command completion script
#
# Installation: npm completion >> ~/.bashrc  (or ~/.zshrc)
# Or, maybe: npm completion > /usr/local/etc/bash_completion.d/npm
#
_npm_completion () {
  local words cword
  if type _get_comp_words_by_ref &>/dev/null; then
    _get_comp_words_by_ref -n = -n @ -w words -i cword
  else
    cword="$COMP_CWORD"
    words=("${COMP_WORDS[@]}")
  fi

  local si="$IFS"
  IFS=$'\n' COMPREPLY=($(COMP_CWORD="$cword" \
                         COMP_LINE="$COMP_LINE" \
                         COMP_POINT="$COMP_POINT" \
                         npm completion -- "${words[@]}" \
                         2>/dev/null)) || return $?
  IFS="$si"
}
complete -o default -F _npm_completion npm
###-end-npm-completion-###
