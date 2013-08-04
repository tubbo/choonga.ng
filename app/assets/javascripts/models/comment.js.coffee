Choongang.Comment = DS.Model.extend
  body: DS.attr('string')
  user: DS.attr('references')
  link: DS.attr('references')
