ready = ->
  $('[data-toggle="popover"]').popover()
  return

$(document).ready ready
$(document).on 'turbolinks:load', ready
