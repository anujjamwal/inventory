$(document).ready ->
  $('#assets_list tr').click ->
    window.location = $(this).data('url')
    return