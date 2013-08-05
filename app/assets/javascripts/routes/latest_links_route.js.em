class Choongang.LatestLinksRoute extends Ember.Route
  model: -> Choongang.Link.find()
