`import Ember from 'ember'`
`import moment from 'moment'`

BlogRoute = Ember.Route.extend
  ajax: Ember.inject.service()
  backendServiceString: window.webService.backendService

  model: ->
    @get('ajax').request(@get('backendServiceString'))

  setupController: (controller, model) ->
    posts = model.map (post) ->
      title = post.filename.replace('.md', '')
      name = title.replace(/-|_/ig, ' ')

      name: name
      path: "/blog/#{title}"
      uploaded: moment(post.uploadDate).format('YYYY MM DD')

    controller.set('posts', posts)

`export default BlogRoute`
