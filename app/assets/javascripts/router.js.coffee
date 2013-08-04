Choongang.Router.map () ->
  @route 'tag', { path: '/:tag_name' }
  @route 'link', { path: '/:tag_name/:link_name' }
  @route 'front_page', { path: '' }
