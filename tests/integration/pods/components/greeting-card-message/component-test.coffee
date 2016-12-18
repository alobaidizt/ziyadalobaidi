`import { test, moduleForComponent } from 'ember-qunit'`
`import hbs from 'htmlbars-inline-precompile'`

moduleForComponent 'greeting-card-message', 'Integration | Component | greeting card message', {
  integration: true
}

test 'it renders', (assert) ->
  assert.expect 2

  # Set any properties with @set 'myProperty', 'value'
  # Handle any actions with @on 'myAction', (val) ->

  @render hbs """{{greeting-card-message}}"""

  assert.equal @$().text().trim(), ''

  # Template block usage:
  @render hbs """
    {{#greeting-card-message}}
      template block text
    {{/greeting-card-message}}
  """

  assert.equal @$().text().trim(), 'template block text'
