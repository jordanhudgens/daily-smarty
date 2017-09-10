ready = ->
  $('#invalid-username').hide()
  $('#valid-username').hide()

  $('#user_username').on 'blur', (event) ->
    $.ajax
      url: '/username_uniqueness/' + $('#user_username').val()
      type: 'GET'
      dataType: 'json'
      error: (jqXHR, textStatus, errorThrown) ->
      success: (data, textStatus, jqXHR) ->
        if data.uniquness is true
          $('#invalid-username').hide()
          $('#valid-username').show()
          console.log('valid')
        else if data.uniquness is false
          $('#valid-username').hide()
          $('#invalid-username').show()
          console.log('invalid')
    event.stopImmediatePropagation();
    return false
  return false

$(document).ready ready
$(document).on 'turbolinks:load', ready
