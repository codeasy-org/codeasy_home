
@CollectionComments = new Mongo.Collection 'comments'
@CollectionCommunityUser = new Mongo.Collection 'communityUser'
@CollectionCommunityComment = new Mongo.Collection 'communityComment'
@CollectionCommunity = new Mongo.Collection 'community'
@CollectionPrograms = new Mongo.Collection 'programs'
@CollectionEvents = new Mongo.Collection 'events'
@CollectionEventProduct = new Mongo.Collection 'eventProduct'
@CollectionProducts = new Mongo.Collection 'products'
@CollectionLogs = new Mongo.Collection 'logs'
@CollectionLikes = new Mongo.Collection 'Likes'
@CollectionNotification = new Mongo.Collection 'Notification'
@CollectionPublish = new Mongo.Collection '_publish'    #tmp publish collection for Pub/Sub custom data

if Meteor.isServer
  CollectionComments.allow insert: (-> if Meteor.userId() then true), update: (-> if Meteor.userId() then true), remove: (-> if Meteor.userId() then true)
  CollectionComments._ensureIndex 'createdAt': -1

  CollectionCommunityUser.allow insert: (-> if Meteor.userId() then true), update: (-> if Meteor.userId() then true), remove: (-> if Meteor.userId() then true)
  CollectionCommunityUser._ensureIndex 'createdAt': -1

  CollectionCommunityComment.allow insert: (-> if Meteor.userId() then true), update: (-> if Meteor.userId() then true), remove: (-> if Meteor.userId() then true)
  CollectionCommunityComment._ensureIndex 'createdAt': -1

  CollectionCommunity.allow insert: (-> if Meteor.userId() then true), update: (-> if Meteor.userId() then true), remove: (-> if Meteor.userId() then true)
  CollectionCommunity._ensureIndex 'createdAt': -1

  CollectionPrograms.allow insert: (-> if Meteor.userId() then true), update: (-> if Meteor.userId() then true), remove: (-> if Meteor.userId() then true)
  CollectionPrograms._ensureIndex 'createdAt': -1

  CollectionEvents.allow insert: (-> if Meteor.userId() then true), update: (-> if Meteor.userId() then true), remove: (-> if Meteor.userId() then true)
  CollectionEvents._ensureIndex 'createdAt': -1

  CollectionEventProduct.allow insert: (-> if Meteor.userId() then true), update: (-> if Meteor.userId() then true), remove: (-> if Meteor.userId() then true)
  CollectionEventProduct._ensureIndex 'createdAt': -1

  CollectionProducts.allow insert: (-> if Meteor.userId() then true), update: (-> true), remove: (-> if Meteor.userId() then true)
  CollectionProducts._ensureIndex 'createdAt': -1

  CollectionLogs.allow insert: (-> if Meteor.userId() then true), update: (-> if Meteor.userId() then true), remove: (-> if Meteor.userId() then true)
  CollectionLogs._ensureIndex 'createdAt': -1

  CollectionLikes.allow insert: (-> true), update: (-> true), remove: (-> true)
  CollectionLikes._ensureIndex 'createdAt': -1

  CollectionNotification.allow insert: (-> if Meteor.user().username is "admin" then true), update: (-> if Meteor.user().username is "admin"  then true), remove: (-> if Meteor.user().username is "admin"  then true)
  CollectionNotification._ensureIndex 'createdAt': -1