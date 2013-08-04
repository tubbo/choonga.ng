Choongang.Router.map () ->
  @route 'tag', { path: '/:tag_name' }
  @route 'link', { path: '/links/:id' }
  @route 'link.report', { path: '/:tag/:name/report' }
  @route 'front_page', { path: '' }
