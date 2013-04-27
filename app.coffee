express = require('express')
compass = require ('node-compass')
http = require('http')
path = require('path')
controller = require('./controllers/base')
mongoose = require('mongoose')

app = express()

app.configure(->
  app.set('port', process.env.PORT || 3000)
  app.set('views', __dirname + '/views')
  app.set('view engine', 'jade')
  app.use(express.favicon())
  app.use(express.logger('dev'))
  app.use(express.bodyParser())
  app.use(express.methodOverride())
  app.use(app.router)
  app.use(compass())
  app.use(express.static(path.join(__dirname, 'public')))
)

app.configure('development', ->
  app.use(express.errorHandler())
)

db = mongoose.connect('mongodb://localhost/myapp')

app.get('/', controller.index)

http.createServer(app).listen(app.get('port'), ->
  console.log("Express server listening on port " + app.get('port'))
)