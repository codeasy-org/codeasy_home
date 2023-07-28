Meteor.methods
  'sendEmail': (_obj) ->
    Email.send
      to: _obj.to
      from: _obj.from
      replyTo: _obj.replyTo
      subject: _obj.subject
      text: _obj.text