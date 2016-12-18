`import Ember from 'ember'`

WelcomeController = Ember.Controller.extend

  init: ->
    Ember.run.later(this, '_transition', 8000)
    @_super(arguments...)

  _transition: ->
    @transitionToRoute('porfolio')


`export default WelcomeController`
