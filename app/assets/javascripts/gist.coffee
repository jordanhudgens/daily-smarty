$ ->
  loadGists()
  $(document).on 'page:load', loadGists

loadGists = ->
  $('.gist').each ->
    loadGist $(this)

loadGist = ($gist) ->
  callbackName = 'c' + Math.random().toString(36).substring(7)

  window[callbackName] = (gistData) ->
    delete window[callbackName]
    html = '<link rel="stylesheet" href="' + encodeURI(gistData.stylesheet) + '"></link>'
    html += gistData.div
    $gist.html html
    script.parentNode.removeChild script

  script = document.createElement 'script'
  script.setAttribute 'src', [
    $gist.data('src'), 
    $.param(
      callback: callbackName
      file: $gist.data('file') || ''
    )
  ].join '?'
  document.body.appendChild script
