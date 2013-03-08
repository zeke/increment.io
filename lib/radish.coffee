url      = require("url")
redis    = require("redis")

exports.init = ->
  redis_url = url.parse(process.env.REDISCLOUD_URL)
  client = redis.createClient(redis_url.port, redis_url.hostname, {no_ready_check: true})

  client.on "error", (err) ->
    console.log "redis error: #{err}"

  client.auth redis_url.auth.split(":")[1], ->
    console.log "redis is ready"

  return client