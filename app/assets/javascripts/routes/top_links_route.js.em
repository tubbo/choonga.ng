class Choongang.TopLinksRoute extends Ember.Route
  model: -> Choongang.Link.find()
