require 'json'

MIN_WAIT_TIME=10
MAX_WAIT_TIME=30

redis = Redis.new(host: 'redis', port: 6379, db: 0)
while true do
  msg = redis.lpop("takeoff.queue")
  if msg
    message = JSON.parse(msg)
    puts "received: #{message}"
    id = message['id']
    wait_time = rand(MIN_WAIT_TIME..MAX_WAIT_TIME)
    puts "taking off in #{wait_time}s"
    sleep(wait_time)
    redis.publish("takeoff", JSON.dump(message))
    puts "published #{message} to 'takeoff'"
  else
    puts "nothing to do, sleep..."
    sleep 1
  end
end
