class Choongang.SubmitLinkView extends Ember.View
  templateName: 'submit_link'
  tagName: 'form'
  classNames: ['submit-link', 'row']
  attributeBindings: ['method']
  method: 'POST'
