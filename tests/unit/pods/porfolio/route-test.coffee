`import { moduleFor, test } from 'ember-qunit'`

moduleFor 'route:porfolio', 'Unit | Route | porfolio', {
  # Specify the other units that are required for this test.
  # needs: ['controller:foo']
}

test 'it exists', (assert) ->
  route = @subject()
  assert.ok route
