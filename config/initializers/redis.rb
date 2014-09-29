require 'redis'
if ENV["REDISTOGO_URL"] != nil
    uri = URI.parse(ENV["REDISTOGO_URL"])
    REDIS = Redis.new(:host => uri.host, :port => uri.port, :password => uri.password, driver: :hiredis)
else
    REDIS = Redis.new(host: '127.0.0.1', port: 6379, driver: :hiredis)
end

REDIS.flushall
