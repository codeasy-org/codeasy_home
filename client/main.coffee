FlowRouter.route '/',
  name: 'main'
  action: ->
    BlazeLayout.render 'layout', main: 'main'


Template.main.events
  'click .idEmail': (evt) ->
    text = $('.idContact').val()
    obj =
      to: 'support@codeasy.org'
      from: text
      replyTo: text
      subject: "[CODEASY_HOME] CONTACT REQUESTED: #{text}"
      text: text
    Meteor.call 'sendEmail', obj, (err, rslt) ->
      if err? then return alert(err)
      alert 'We`ll get in touch with you soon!'
      $('.idContact').val('')
  'click .idSubscribe': (evt) ->
    evt.preventDefault()
    text = $('.idSubsEmail').val()
    obj =
      to: 'support@codeasy.org'
      from: text
      replyTo: text
      subject: "[CODEASY_HOME] SUBSCRIBE REQUESTED: #{text}"
      text: text
    Meteor.call 'sendEmail', obj, (err, rslt) ->
      if err? then return alert(err)
      alert 'Thanks for subscription!'
      $('.idSubsEmail').val('')
