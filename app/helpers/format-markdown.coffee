`import Ember from 'ember'`
`import marked from 'marked'`

FormatMarkdown = Ember.Helper.helper (params) ->
  value = params[0]
  Ember.String.htmlSafe(marked(value))

`export default FormatMarkdown`
