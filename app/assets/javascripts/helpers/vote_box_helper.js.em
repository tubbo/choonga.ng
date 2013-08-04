Ember.Handlebars.helper 'vote_box', (args) ->
  options = args.hash
  new Handlebars.SafeString "<span class=\"votes\">#{options.votes}</span>"
