`import WebsocketMixin from 'ziyad-website/mixins/websocket'`

OrdersDashboardController = Ember.Controller.extend WebsocketMixin,
  liveOrders: []

  updateData: (data) ->
    console.log 'here'
    @get('liveOrders').pushObject(data)

  actions:
    updateStatus: (order) ->
      _.forEach @get('liveOrders'), (liveOrder) ->
        if Em.isEqual(liveOrder.uniqueId, order.uniqueId)
          switch liveOrder.status
            when 'pending'
              Em.set(liveOrder, 'status', 'cooking')
            when 'cooking'
              Em.set(liveOrder, 'status', 'waiting-for-delivery')
            when 'waiting-for-delivery'
              Em.set(liveOrder, 'status', 'out-for-delivery')
            when 'out-for-delivery'
              Em.set(liveOrder, 'status', 'delivered')

`export default OrdersDashboardController`
