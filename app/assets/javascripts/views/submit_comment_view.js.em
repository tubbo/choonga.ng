class Choongang.SubmitCommentView extends Ember.View
  tagName: 'form'
  classNames: ['submit-comment']
  attributeBindings: ['method', 'action']
  method: 'POST'
