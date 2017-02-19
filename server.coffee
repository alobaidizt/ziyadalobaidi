logger     = require('koa-logger')
route      = require('koa-route')
parse      = require('co-body')
koa        = require('koa')
cors       = require('koa-cors')
bodyParser = require('koa-bodyparser')
mongo      = require('koa-mongo')
routes     = require('./blog-routes')
aiRoutes   = require('./ai-routes')
Grid       = require('gridfs-stream')
{ setupWebsocket } = require('./websocket')
{ setupTwilioClient }    = require('./twilio-agent')

app = new koa()

app.use(cors())
app.use(bodyParser())
app.use(logger())
app.use(mongo
  uri: 'mongodb://localhost:27017/blog'
  max: 101
  min: 1
)

setupWebsocket()
setupTwilioClient()

# route middleware
app.use(route.get('/', routes.list))
app.use(route.get('/posts', routes.show))
app.use(route.post('/posts', routes.create))
app.use(route.post('/ishtar-webhook', aiRoutes.webhookHandler))

if (!module.parent)
  console.log 'started listing'
  app.listen(3000)

module.exports = app
