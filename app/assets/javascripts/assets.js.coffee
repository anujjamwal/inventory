$(document).ready ->
  $('.assets-list tr:not(.no-data) .btn').click (e)->
    window.location = $(this).attr('href')
    return false

  $('.assets-list td.action').click (e)->
    e.preventDefault()
    return false