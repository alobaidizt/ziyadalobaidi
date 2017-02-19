{ getIOServer } = require('./websocket')
{ sendText }    = require('./twilio-agent')

webhookHandler = ->
  body    = this.request.body
  result  = body.result
  context = result.contexts[result.contexts.length - 1]
  params  = context.parameters

  action  = result.action
  speech  = result.fulfillment.speech ? ''

  console.log action
  switch action
    when 'call.customer-support' then yield initiateCustomerSupport(params, speech, this)
    when 'input.order' then yield postOrder(body, result, params, speech, this)

initiateCustomerSupport = (params, speech, self) ->
  # figure out agent to call the customer
  record =
    timestamp:     Date.now()
    customerPhone: params.twilio_sender_id
    handledBy:     'ziyad'
  yield self.mongo.db('ishtar').collection('CustomerSupport').insert(record)

  # notify the agent and call log data
  sendText("2486324864", "Customer #{params.twilio_sender_id} needs assistance")


  # get back to the customer with the name of the agent name
  speech = "Of couese! Cheezy Ziyad will give you a call within 10 min"
  self.body = yield Promise.resolve({
    speech:      speech
    displayText: speech
    source:      'ishtar-post-order'
  })

postOrder = (body, result, params, speech, self) ->
  recordLogs = []
  recordLogs.push({ status: 'pending', updatedAt: Date.now() })
  record =
    timestamp:          body.timestamp
    uniqueId:           body.id
    intentId:           result.metadata.intentId
    sessionId:          body.sessionId
    twilioSenderId:     params.twilio_sender_id
    address:            params.address
    sandwichType:       params.englishType
    bread:              params.bread
    meat:               params.meat
    quantity:           params.number
    dieteryPreferences: params.englishDieteryPreferences
    log:                recordLogs
    status:             'pending'

  # update db with order
  yield self.mongo.db('ishtar').collection('LiveOrders').insert(record)
  # update orders dashboard
  io = getIOServer()
  io.emit 'addOrder', record

  console.log speech
  self.body = yield Promise.resolve({
    speech:      speech
    displayText: speech
    source:      'ishtar-post-order'
  })

module.exports =
  webhookHandler: webhookHandler
