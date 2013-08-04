Ember.Handlebars.helper 'modal', (args) ->
  options = args.hash
  new Handlebars.SafeString "<a href=\"#{options.href}\" data-reveal-id=\"modal\" data-reveal-ajax=\"true\">#{options.text}</a>"
