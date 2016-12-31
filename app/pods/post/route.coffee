`import Ember from 'ember'`

PostRoute = Ember.Route.extend
  ajax: Ember.inject.service()
  backendServiceString: window.webService.backendService

  model: (params) ->
    @get('ajax').request("#{@get('backendServiceString')}posts?title=#{params.title}")

`export default PostRoute`
