class Choongang.LinkMetadataView extends Ember.View
  templateName: 'link_metadata'
  tagName: 'dd'
  classNames: ['metadata']
  upvote: (event) -> alert "Voted up"; false
  downvote: (event) -> alert "Voted down"; false
