express  = require("express")
https    = require("https")
cors     = require("cors")
radish   = require("../lib/radish").init()

app = express(
  express.logger()
  express.cookieParser()
  express.bodyParser())

app.get "/", cors(), (req, res) ->

  url = req.query.url
  action = req.query.action or "redirect"

  res.redirect("https://github.com/zeke/increment.io#readme") unless url

  radish.incr "#{action}_#{url}", (err, reply) ->
    if action is "redirect"
      res.redirect(url)
    else
      radish.get "#{action}_#{url}", (err, count) ->
        res.jsonp
          action: action
          url: url
          count: Number(count)

app.get "/get", cors(), (req, res) ->

  # Normalize to array even if single 'url' param
  urls = if req.query.url then [].concat.apply([], [req.query.url]) else []
  action = req.query.action or "redirect"

  if urls.length == 0
    res.send(400, "'url' query param is required") 
  else
    radish.mget ("#{action}_#{url}" for url in urls), (err, counts) ->
      res.jsonp counts.map (count) ->
        action: action
        url: url
        count: Number(count)

module.exports = app