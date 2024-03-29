`import Ember from 'ember'`
`import config from './config/environment'`

Router = Ember.Router.extend
  location: config.locationType,
  rootURL:  config.rootURL

Router.map ->
  @route 'welcome', path: "/"
  @route 'porfolio'
  @route 'blog'
  @route 'post', { path: '/blog/:title'}
  @route 'resume'
  @route 'contact'
  @route 'orders-dashboard'

`export default Router`
