ready = ->
  $(document).keypress (event) ->
    if event.which == 70
      event.preventDefault()
      $('#q').focus()
    if event.which == 78
      event.preventDefault()
      location.href = 'posts/new'
    return

$(document).ready ready
$(document).on 'turbolinks:load', ready
