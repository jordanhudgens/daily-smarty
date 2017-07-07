ready = ->
  $(document).on 'click', '.follow-link', (event) ->
    $(this).text("Following")
    $(this).removeClass('follow')
    $(this).addClass('following')
    return

$(document).ready ready
$(document).on 'turbolinks:load', ready
