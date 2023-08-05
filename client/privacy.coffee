FlowRouter.route '/privacy',
  name: 'privacy'
  action: ->
    BlazeLayout.render 'layout', main: 'privacy'
