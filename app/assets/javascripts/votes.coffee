ready = ->
  $(document).unbind('click')

  upvoteClicked = false
  downvoteClicked = false

  $(document).on 'click', '.upvote-link', (event) ->
    if upvoteClicked == false
      upvoteClicked = true
      downvoteClicked = false
      $(this).removeClass('novote')
      $(this).addClass('upvote')
      $(this).closest('.vote-link-wrapper').find('a').last().find('i').removeClass('downvote')
      $(this).closest('.vote-link-wrapper').find('a').last().find('i').addClass('novote')
      updatedCount = parseInt($(this).closest('.vote-link-wrapper').find('.vote-counter').first().text()) + 1
      $(this).closest('.vote-link-wrapper').find('.vote-counter').text(updatedCount)
      $.ajax $(this).closest('.vote-link-wrapper').find('a').first().attr('href'),
        type: 'POST'
        dataType: 'json'
        error: (jqXHR, textStatus, errorThrown) ->
          console.log textStatus
        success: (data, textStatus, jqXHR) ->
      return false
    return false

  $(document).on 'click', '.downvote-link', (event) ->
    if downvoteClicked == false
      downvoteClicked = true
      upvoteClicked = false
      $(this).removeClass('novote')
      $(this).addClass('downvote')
      $(this).closest('.vote-link-wrapper').find('a').first().find('i').removeClass('upvote')
      $(this).closest('.vote-link-wrapper').find('a').first().find('i').addClass('novote')
      updatedCount = parseInt($(this).closest('.vote-link-wrapper').find('.vote-counter').first().text()) - 1
      $(this).closest('.vote-link-wrapper').find('.vote-counter').text(updatedCount)
      $.ajax $(this).closest('.vote-link-wrapper').find('a').last().attr('href'),
        type: 'POST'
        dataType: 'json'
        error: (jqXHR, textStatus, errorThrown) ->
          console.log textStatus
        success: (data, textStatus, jqXHR) ->
      return false
    return false

$(document).ready ready
$(document).on 'turbolinks:load', ready
