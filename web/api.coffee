express  = require("express")
https    = require("https")
radish   = require("../lib/radish").init()

app = express.createServer(
  express.logger()
  express.cookieParser()
  express.bodyParser())

app.get "/", (req, res) ->
  res.redirect("https://github.com/zeke/interlude#readme")

app.get "/set", (req, res) ->

  url = req.query.url
  action = req.query.action or "redirect"

  res.send(400, "'url' query param is required") unless url

  radish.incr "#{action}_#{url}", (err, reply) ->
    if action is "redirect"
      res.redirect(url)
    else
      res.send(200)

app.get "/get", (req, res) ->

  url = req.query.url
  action = req.query.action or "redirect"

  res.send(400, "'url' query param is required") unless url

  radish.get "#{action}_#{url}", (err, count) ->
    res.send
      action: action
      url: url
      count: Number(count)

module.exports = app