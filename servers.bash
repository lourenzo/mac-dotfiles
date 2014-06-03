## Server Controls
# @TODO: turn this similar to debian's 'service command'
# 

# Mongodb server control
if [ -f /usr/local/opt/mongodb/homebrew.mxcl.mongodb.plist ]
  then
  function mongo_ctl () {
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
        echo "Usage: mongo_ctl [start|stop|restart]"
        ;;
    esac
  }
fi

if [ -f /usr/local/opt/elasticsearch/homebrew.mxcl.elasticsearch.plist ]
  then
  function elasticsearch_ctl () {
    case $1 in
      start )
        launchctl load /usr/local/opt/elasticsearch/homebrew.mxcl.elasticsearch.plist 
        ;;
      stop )
        launchctl unload /usr/local/opt/elasticsearch/homebrew.mxcl.elasticsearch.plist 
        ;;
      restart )
        launchctl unload /usr/local/opt/elasticsearch/homebrew.mxcl.elasticsearch.plist
        launchctl load /usr/local/opt/elasticsearch/homebrew.mxcl.elasticsearch.plist 
        ;;
      * )
        echo "ElasticSearch Server loader / unloader"
        echo "Usage: elasticsearch_ctl [start|stop|restart]"
        ;;
    esac
  }
fi

if [ -f /usr/local/opt/redis/homebrew.mxcl.redis.plist ]
  then
  function redis_ctl () {
    case $1 in
      start )
        launchctl load /usr/local/opt/redis/homebrew.mxcl.redis.plist
        ;;
      stop )
        launchctl unload /usr/local/opt/redis/homebrew.mxcl.redis.plist 
        ;;
      restart )
        launchctl unload /usr/local/opt/redis/homebrew.mxcl.redis.plist
        launchctl load /usr/local/opt/redis/homebrew.mxcl.redis.plist
        ;;
      * )
        echo "Redis Server loader / unloader"
        echo "Usage: redis_ctl [start|stop|restart]"
        ;;
    esac
  }
fi
