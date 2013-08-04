Choongang.Router.map () ->
  @route 'tag', { path: '/:tag_name' }
  @resource 'links', ->
    @route 'report', { path: '/links/:id/report' }
  @route 'link', { path: '/links/:id' }
  @route 'front_page', { path: '' }

Choongang.Router.reopen location: 'history'
