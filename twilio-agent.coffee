TWILIO_NUMBER      = "+12485957238"
TWILIO_ACCOUNT_SID = "ACa15992f05e036faec2814063db1f986a"
TWILIO_AUTH_TOKEN  = "414c96f7db0f41259bdde2ba782fa8d7"

setupTwilioClient = =>
  @client = require('twilio')(TWILIO_ACCOUNT_SID, TWILIO_AUTH_TOKEN)

sendText = (recipient, message) =>
  @client.sendSms({
    to:   recipient
    from: TWILIO_NUMBER
    body: message
  }, (error, message) ->
    if (!error)
      console.log('Success! The SID for this SMS message is:')
      console.log(message.sid)
      console.log('Message sent on:')
      console.log(message.dateCreated)
    else
      console.log('Oops! There was an error.')
      console.log error
  )

module.exports =
  setupTwilioClient: setupTwilioClient
  sendText:    sendText
