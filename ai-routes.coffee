postOrder = ->
  console.log('ai webhook request')

  requestBody = this.request.query
  console.log 'result', requestBody.result

  this.body = yield Promise.resolve({
    speech:      'success'
    displayText: 'success'
    source:      'ishtar-post-order'
  })

module.exports =
  postOrder: postOrder
