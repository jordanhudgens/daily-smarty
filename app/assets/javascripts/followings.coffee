ready = ->
  $(document).on 'click', '.follow-link', (event) ->
    $(this).text("Unfollow")
    $(this).removeClass('follow btn-primary')
    $(this).addClass('following btn-danger')
    return false

  $(document).on 'click', '.unfollow-link', (event) ->
    $(this).text("Follow")
    $(this).removeClass('following btn-danger')
    $(this).addClass('follow btn-primary')
    return false

$(document).ready ready
$(document).on 'turbolinks:load', ready
