ready = ->
  $(document).unbind('click')

  lastClicked = null

  $(document).on 'click', '.upvote-link', (event) ->
    if lastClicked != $(this) && $(this).hasClass('novote')
      lastClicked = $(this)
      $(this).removeClass('novote')
      $(this).addClass('upvote')
      $(this).closest('.vote-link-wrapper').find('a').last().find('i').removeClass('downvote')
      $(this).closest('.vote-link-wrapper').find('a').last().find('i').addClass('novote')
      counter = $(this).closest('.vote-link-wrapper').find('.vote-counter')
      $.ajax
        url: $(this).closest('.vote-link-wrapper').find('a').first().attr('href')
        type: 'POST'
        dataType: 'json'
        error: (jqXHR, textStatus, errorThrown) ->
        success: (data, textStatus, jqXHR) ->
          counter.text(data.voteCount)
      return false
    return false

  $(document).on 'click', '.downvote-link', (event) ->
    if lastClicked != $(this) && $(this).hasClass('novote')
      lastClicked = $(this)
      $(this).removeClass('novote')
      $(this).addClass('downvote')
      $(this).closest('.vote-link-wrapper').find('a').first().find('i').removeClass('upvote')
      $(this).closest('.vote-link-wrapper').find('a').first().find('i').addClass('novote')
      counter = $(this).closest('.vote-link-wrapper').find('.vote-counter')
      $.ajax
        url: $(this).closest('.vote-link-wrapper').find('a').last().attr('href')
        type: 'POST'
        dataType: 'json'
        error: (jqXHR, textStatus, errorThrown) ->
        success: (data, textStatus, jqXHR) ->
          counter.text(data.voteCount)
      return false
    return false

$(document).ready ready
$(document).on 'turbolinks:load', ready
