`import { moduleFor, test } from 'ember-qunit'`

moduleFor 'route:blog/post', 'Unit | Route | blog/post', {
  # Specify the other units that are required for this test.
  # needs: ['controller:foo']
}

test 'it exists', (assert) ->
  route = @subject()
  assert.ok route
