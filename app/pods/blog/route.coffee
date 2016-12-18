`import Ember from 'ember'`
`import moment from 'moment'`

BlogRoute = Ember.Route.extend
  ajax: Ember.inject.service()

  model: ->
    @get('ajax').request("http://localhost:3000/")

  setupController: (controller, model) ->
    posts = model.map (post) ->
      title = post.filename.replace('.md', '')
      name = title.replace('-', ' ')
      name: name
      path: "blog/#{title}"
      uploaded: moment(post.uploadDate).format('YYYY MM DD')

    controller.set('posts', posts)

    #items = []
    #for i in [0..2]
      #items.push(
        #name: "Item sdmndsflknvkjsd ndskjfskjdf jksdfg lskjdfbg ksjfbg jksdfbg ksjfdg" + i
        #time: moment().format('YYYY MM DD')
      #)
    #items

`export default BlogRoute`
