ready = ->
  $('#postTabList a:first').tab 'show'
  return

$(document).ready ready
$(document).on 'turbolinks:load', ready
