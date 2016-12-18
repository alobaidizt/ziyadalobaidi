import Ember            from 'ember';
import Resolver         from './resolver';
import loadInitializers from 'ember-load-initializers';
import config           from './config/environment';
import marked           from 'marked';


let App;

Ember.MODEL_FACTORY_INJECTIONS = true;

App = Ember.Application.extend({
  modulePrefix:    config.modulePrefix,
  podModulePrefix: config.podModulePrefix,
  Resolver
});

marked.setOptions({
  renderer: new marked.Renderer(),
  breaks:   true
});

loadInitializers(App, config.modulePrefix);

export default App;
