ready = ->
  $('#user_username').on 'blur', (event) ->
    $.ajax
      url: '/username_uniqueness/' + $('#user_username').val()
      type: 'GET'
      dataType: 'json'
      error: (jqXHR, textStatus, errorThrown) ->
      success: (data, textStatus, jqXHR) ->
        if data.uniquness is true
          $('#user_username').addClass('valid-username')
          console.log('valid')
        else if data.uniquness is false
          $('#user_username').addClass('invalid-username')
          console.log('invalid')
    event.stopImmediatePropagation();
    return false
  return false

$(document).ready ready
$(document).on 'turbolinks:load', ready
