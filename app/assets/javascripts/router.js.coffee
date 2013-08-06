Choongang.Router.map () ->
  @resource 'tag', { path: '/tags/:name' }
  @resource 'comments', { path: '/comments' }
  @resource 'user', { path: '/users/:name' }
  @resource 'links', { path: '/links' }, ->
    @route 'submit', path: 'new'
    @resource 'link', { path: ':id' }, ->
      @route 'comments', { path: 'comments' }

  # root path
  @route 'links', { path: '' }

Choongang.Router.reopen location: 'history'
