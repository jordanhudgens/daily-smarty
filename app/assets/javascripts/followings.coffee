ready = ->
  $(document).on 'click', '.follow-link', (event) ->
    $(this).text("Following")
    $(this).removeClass('follow-link btn-primary')
    $(this).addClass('unfollow-link btn-danger')
    return false

  $(document).on 'click', '.unfollow-link', (event) ->
    $(this).text("Follow")
    $(this).removeClass('unfollow-link btn-danger')
    $(this).addClass('follow-link btn-primary')
    return false

$(document).ready ready
$(document).on 'turbolinks:load', ready
