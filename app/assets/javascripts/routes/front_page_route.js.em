class Choongang.FrontPageRoute extends Ember.Route
  model: -> Choongang.Link.find()
