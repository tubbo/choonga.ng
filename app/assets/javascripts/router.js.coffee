Choongang.Router.map () ->
  @route 'tag', { path: '/:tag_name' }
  @route 'comments', { path: '/comments' }
  @route 'top_links', { path: '/links' }
  @route 'latest_links', { path: '/links/latest' }
  @route 'submit_link', { path: '/links/new' }
  @resource 'link', { path: '/links/:id' }, ->
    @route 'comments', { path: 'comments' }

  # root path
  @route 'top_links', { path: '' }

Choongang.Router.reopen location: 'history'
