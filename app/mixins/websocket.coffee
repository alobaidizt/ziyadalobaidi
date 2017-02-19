WebsocketMixin = Ember.Mixin.create
  init: ->
    @_super(arguments...)
    @willRender()

  willRender: ->
    @set 'socket', io(window.webService.websocket)
    @get('socket').on('addOrder', (data) =>
      @updateDataHandler(data))

  updateDataHandler: (data) ->
    @updateData?(data)

`export default WebsocketMixin`
