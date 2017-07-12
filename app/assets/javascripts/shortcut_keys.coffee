ready = ->
  $(document).keypress (event) ->
    if event.which == 19 # listening for ctrl + s
      event.preventDefault()
      $('#q').focus()
    if event.which == 13 # listening for ctrl + m
      event.preventDefault()
      location.href = 'http://' + window.location.host + '/' + 'posts/new'
    return

$(document).ready ready
$(document).on 'turbolinks:load', ready
