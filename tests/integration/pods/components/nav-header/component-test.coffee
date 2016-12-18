`import { test, moduleForComponent } from 'ember-qunit'`
`import hbs from 'htmlbars-inline-precompile'`

moduleForComponent 'nav-header', 'Integration | Component | nav header', {
  integration: true
}

test 'it renders', (assert) ->
  assert.expect 2

  # Set any properties with @set 'myProperty', 'value'
  # Handle any actions with @on 'myAction', (val) ->

  @render hbs """{{nav-header}}"""

  assert.equal @$().text().trim(), ''

  # Template block usage:
  @render hbs """
    {{#nav-header}}
      template block text
    {{/nav-header}}
  """

  assert.equal @$().text().trim(), 'template block text'
