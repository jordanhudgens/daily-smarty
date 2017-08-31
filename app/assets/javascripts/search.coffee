ready = ->
  $('.search-box').focus ->
    $('.fa-search').removeClass()
    return

  $('.search-box').blur ->
    $('#search-icon-id').addClass('fa fa-search')
    return

$(document).ready ready
$(document).on 'turbolinks:load', ready
