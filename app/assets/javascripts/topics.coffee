ready = ->
  $(document).on 'click', '.topic-follow-link', (event) ->
    $(this).text("Following")
    $(this).removeClass('topic-follow-link btn-default')
    $(this).addClass('topic-unfollow-link btn-unfollow')
    return false

  $(document).on 'click', '.topic-unfollow-link', (event) ->
    $(this).text("Follow")
    $(this).removeClass('topic-unfollow-link btn-unfollow')
    $(this).addClass('topic-follow-link btn-default')
    return false

$(document).ready ready
$(document).on 'turbolinks:load', ready
