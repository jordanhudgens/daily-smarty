ready = ->
  inputs = document.querySelectorAll('.inputfile')
  Array::forEach.call inputs, (input) ->
    label = input.nextElementSibling
    labelVal = label.innerHTML
    input.addEventListener 'change', (e) ->
      fileName = ''
      if @files and @files.length > 1
        fileName = (@getAttribute('data-multiple-caption') or '').replace('{count}', @files.length)
      else
        fileName = e.target.value.split('\\').pop()
      if fileName
        label.querySelector('span').innerHTML = fileName
      else
        label.innerHTML = labelVal
      return
    return

$(document).ready ready
$(document).on 'turbolinks:load', ready
