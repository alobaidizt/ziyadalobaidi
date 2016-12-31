mongo  = require('mongodb')
streamToPromise  = require('stream-to-promise')

list = ->
  posts = yield this.mongo.db('blog').collection('fs.files').find().sort( { uploadDate: -1 } ).toArray()
  this.body = posts

show = ->
  title = this.request.query.title
  fileName = "#{title}.md"
  db = this.mongo.db('blog')
  gridFs = Grid(db, mongo)


  console.log('ai webhook request')

  requestBody = req.body
  console.log 'result', requestBody.result

  this.body =
    speech:      'success'
    displayText: 'success'
    source:      'ishtar-post-order'

module.exports =
  postOrder: postOrder
