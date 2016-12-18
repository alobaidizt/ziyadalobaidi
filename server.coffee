logger = require('koa-logger')
route  = require('koa-route')
parse  = require('co-body')
koa    = require('koa')
cors = require('koa-cors')
mongo  = require('koa-mongo')
routes = require('./blog-routes')
Grid = require("gridfs-stream")

app = new koa()

app.use(cors())
app.use(logger())
app.use(mongo
  uri: 'mongodb://localhost:27017/blog'
  max: 100
  min: 1
)


# route middleware
app.use(route.get('/', routes.list))
app.use(route.get('/posts', routes.show))
app.use(route.post('/posts', routes.create))

if (!module.parent)
  console.log 'started listing'
  app.listen(3000)

module.exports = app
