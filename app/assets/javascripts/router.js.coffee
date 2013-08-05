Choongang.Router.map () ->
  @route 'comments', { path: '/comments' }
  @route 'tag', { path: '/:tag_name' }
  @resource 'links', ->
    @route 'latest', { path: 'latest' }
  @resource 'link', { path: '/links/:id' }, ->
    @route 'comments', { path: 'comments' }
  @route 'submit_link', { path: '/links/new' }
  @route 'front_page', { path: '' }
  @route 'front_page', { path: '/links' }

Choongang.Router.reopen location: 'history'
