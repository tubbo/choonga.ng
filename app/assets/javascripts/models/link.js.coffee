Choongang.Link = DS.Model.extend
  title: DS.attr('string')
  url: DS.attr('string')
  service: DS.attr('references')
  tag: DS.attr('references')
