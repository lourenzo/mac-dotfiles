# Mongodb server control
function mongoclt () {
  case $1 in
    start )
      launchctl load /usr/local/opt/mongodb/homebrew.mxcl.mongodb.plist 
      ;;
    stop )
      launchctl unload /usr/local/opt/mongodb/homebrew.mxcl.mongodb.plist 
      ;;
    restart )
      launchctl unload /usr/local/opt/mongodb/homebrew.mxcl.mongodb.plist 
      launchctl load /usr/local/opt/mongodb/homebrew.mxcl.mongodb.plist 
      ;;
    * )
      echo "Mongo Server loader / unloader"
      echo "Usage: mongoctl [start|stop|restart]"
      ;;
  esac
}
