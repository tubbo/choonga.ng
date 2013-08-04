Choongang.Router.map () ->
  @route 'tag', { path: '/:tag_name' }
  @resource 'links', ->
    @route 'show', { path: ':id' }
    @route 'report', { path: '/links/:id/report' }
  @route 'front_page', { path: '' }
