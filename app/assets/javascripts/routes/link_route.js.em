class Choongang.LinkRoute extends Ember.Route
  model: (params) -> Choongang.Link.find params.id
