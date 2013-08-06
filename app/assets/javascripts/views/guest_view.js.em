class Choongang.GuestView extends Em.View
  templateName: 'guest'
  tagName: 'form'
  name: null
  password: null

  submit: (event, view) ->
    event.preventDefault() and event.stopPropagation()
    Choongang.Auth.signIn
      data:
        name: @name
        password: @password

