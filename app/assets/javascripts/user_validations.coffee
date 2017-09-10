ready = ->
  $('#invalid-username').hide()
  $('#valid-username').hide()

  $('#user_username').on 'keyup', (event) ->
    $.ajax
      url: '/username_validator/' + $('#user_username').val()
      type: 'GET'
      dataType: 'json'
      error: (jqXHR, textStatus, errorThrown) ->
      success: (data, textStatus, jqXHR) ->
        if data.valid is true
          $('#invalid-username').hide()
          $('#valid-username').show()
        else if data.valid is false
          $('#valid-username').hide()
          $('#invalid-username').show()
    event.stopImmediatePropagation();
    return false
  return false

$(document).ready ready
$(document).on 'turbolinks:load', ready
