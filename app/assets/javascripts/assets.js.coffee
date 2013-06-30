$(document).ready ->
  $('#assets_list tr .btn').click (e)->
    window.location = $(this).attr('href')
    return false

  $('#assets_list tr').click ->
    window.location = $(this).data('url')
    return