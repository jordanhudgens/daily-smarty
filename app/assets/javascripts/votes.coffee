ready = ->
  $(document).on 'click', '.upvote-link', (event) ->
    $(this).removeClass('novote')
    $(this).addClass('upvote')
    $(this).closest('.vote-link-wrapper').find('a').last().find('i').removeClass('downvote')
    $(this).closest('.vote-link-wrapper').find('a').last().find('i').addClass('novote')

  $(document).on 'click', '.downvote-link', (event) ->
    $(this).removeClass('novote')
    $(this).addClass('downvote')
    $(this).closest('.vote-link-wrapper').find('a').first().find('i').removeClass('upvote')
    $(this).closest('.vote-link-wrapper').find('a').first().find('i').addClass('novote')

$(document).ready ready
$(document).on 'turbolinks:load', ready
