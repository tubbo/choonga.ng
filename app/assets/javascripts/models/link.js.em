class Choongang.Link extends DS.Model
  title: DS.attr 'string'
  name: DS.attr 'string'
  url: DS.attr 'string'
  votes: DS.attr 'number'
  user: DS.belongsTo 'Choongang.User'
  service: DS.belongsTo 'Choongang.Service'
  tag: DS.belongsTo 'Choongang.Tag'
