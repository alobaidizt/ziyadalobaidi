# route definitions
Grid = require("gridfs-stream")
Fs = require("fs")
mongo  = require('mongodb')
streamToPromise  = require('stream-to-promise')

#/**
 #* Post listing.
 #*/

list = ->
  posts = yield this.mongo.db('blog').collection('fs.files').find().sort( { uploadDate: -1 } ).toArray()
  this.body = posts

#/**
 #* Show post :id.
 #*/

show = ->
  title = this.request.query.title
  fileName = "#{title}.md"
  db = this.mongo.db('blog')
  gridFs = Grid(db, mongo)

  try
    readStream = gridFs.createReadStream(filename: fileName)
    buffer = yield streamToPromise(readStream)
    post = buffer.toString('ascii')

    if (!post?)
      return this.throw(404, 'invalid post title')

    this.body = { post: post }

  catch err
    console.log err
    return this.throw(404, 'readStream error')

#/**
 #* Create a post.
 #*/

create = ->
  post = yield parse(this)
  id = posts.push(post) - 1
  post.created_at = new Date()
  post.id = id

module.exports =
  list:   list
  show:   show
  create: create
