class Choongang.SubmitLinkView extends Ember.View
  templateName: 'submit_link'
  tagName: 'form'
  classNames: ['submit-link']
  attributeBindings: ['method']
  method: 'POST'
  submit: (event) ->
    attributes = _.reduce @$('input[type="text"]'), @_attrsToJSON, {}
    $.ajax
      url: '/links'
      data: { link: attributes }
      dataType: 'json'
      method: 'POST'
      success: -> alert 'Link has been posted!'
      error: -> alert "Error posting link."
    false
  _attrsToJSON: (result, element) ->
    input= $(element)
    name = input.attr('name')
            .split('link[').join('')
            .split(']').join('')
    result[name] = input.val()
    result
