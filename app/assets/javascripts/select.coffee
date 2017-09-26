ready = ->
  $('.dropdowns select').select2()
  $('#post_topic_titles').select2(
    tags: true
  )
  $(document).on 'click', '.add-topic', (event) ->
    $(this).parent().find('.dropdowns select').select2
      ajax:
        url: '/topic-autocomplete'
        dataType: 'json'
        delay: 250
        data: (params) ->
          {
            q: params.term
          }
        cache: true
      minimumInputLength: 3
    return
  $(document).on 'click', '.add-custom-topic', (event) ->
    $(this).find('selection').hide()
    $(this).hide()
    return

$(document).ready ready
$(document).on 'turbolinks:load', ready
