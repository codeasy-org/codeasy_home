FlowRouter.route '/',
  name: 'main'
  action: ->
    BlazeLayout.render 'layout', main: 'main'