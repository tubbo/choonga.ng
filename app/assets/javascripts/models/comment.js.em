class Choongang.Comment extends DS.Model
  body: DS.attr 'string'
  html: DS.attr 'string'
  user: DS.belongsTo 'Choongang.User'
  link: DS.belongsTo 'Choongang.Link'
