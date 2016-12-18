`import DS from 'ember-data'`

Post = DS.Model.extend
  title:   DS.attr('string')
  content: DS.attr('string')

`export default Post`
