ready = ->
  $(document).keypress (event) ->
    if event.which == 70
      event.preventDefault()
      $('#q').focus()
    if event.which == 78
      event.preventDefault()
      location.href = 'http://' + window.location.host + '/' + 'posts/new'
    return

$(document).ready ready
$(document).on 'turbolinks:load', ready
