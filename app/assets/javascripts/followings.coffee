ready = ->
  $(document).on 'click', '.follow-link', (event) ->
    $(this).text("Following")
    $(this).removeClass('follow-link btn-default')
    $(this).addClass('unfollow-link btn-unfollow btn-block')
    return false

  $(document).on 'click', '.unfollow-link', (event) ->
    $(this).text("Follow")
    $(this).removeClass('unfollow-link btn-unfollow')
    $(this).addClass('follow-link btn-default btn-block')
    return false

$(document).ready ready
$(document).on 'turbolinks:load', ready
