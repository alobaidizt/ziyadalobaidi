Transitions =  ->
  @transition(
    @toRoute('porfolio'),
    @use('fade'),
  )

  @transition(
    @toRoute('blog'),
    @use('fade'),
  )

  @transition(
    @toRoute((routeName) -> routeName.includes('blog')),
    @use('fade')
  )

  @transition(
    @toRoute('resume'),
    @use('fade'),
  )

  @transition(
    @toRoute('contact'),
    @use('fade'),
  )

`export default Transitions`
