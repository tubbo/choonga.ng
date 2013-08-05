class Choongang.Link extends DS.Model
  title: DS.attr 'string'
  name: DS.attr 'string'
  url: DS.attr 'string'
  service: DS.belongsTo 'Choongang.Service'
  tag: DS.belongsTo 'Choongang.Tag'
  votes: DS.attr 'number'
