Choongang.Router.map () ->
  @resource 'tags', { path: '/tags' }
  @resource 'comments', { path: '/comments' }
  @resource 'links', { path: '/links' }, ->
    @route 'submit', path: 'new'
    @resource 'link', { path: ':id' }, ->
      @route 'comments', { path: 'comments' }

  # root path
  @route 'links', { path: '' }

Choongang.Router.reopen location: 'history'
