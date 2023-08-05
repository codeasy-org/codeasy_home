import {FlowRouter} from 'meteor/ostrio:flow-router-extra'
FlowRouter.triggers.enter([(context, redirect) ->
  window.scrollTo(0, 0)
]);
@FlowRouter = FlowRouter