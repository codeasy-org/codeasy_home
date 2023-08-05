FlowRouter.route '/terms',
  name: 'terms'
  action: ->
    BlazeLayout.render 'layout', main: 'terms'
