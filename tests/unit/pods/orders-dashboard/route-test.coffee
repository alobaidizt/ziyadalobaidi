`import { moduleFor, test } from 'ember-qunit'`

moduleFor 'route:orders-dashboard', 'Unit | Route | orders dashboard', {
  # Specify the other units that are required for this test.
  # needs: ['controller:foo']
}

test 'it exists', (assert) ->
  route = @subject()
  assert.ok route
