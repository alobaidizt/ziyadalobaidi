`import Ember from 'ember'`

PostRoute = Ember.Route.extend
  ajax: Ember.inject.service()

  model: (params) ->
    @get('ajax').request("http://localhost:3000/posts?title=#{params.title}")

`export default PostRoute`
