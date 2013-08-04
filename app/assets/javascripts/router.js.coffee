Choongang.Router.map () ->
  @route 'tag', { path: '/:tag' }
  @route 'link', { path: '/:tag/:name' }
  @route 'link.report', { path: '/:tag/:name/report' }
  @route 'front_page', { path: '' }
