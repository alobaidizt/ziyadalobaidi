Transitions =  ->
  @transition(
    @fromRoute('welcome'),
    @toRoute('porfolio'),
    @use('fade'),
    @reverse('fade')
  )

`export default Transitions`
