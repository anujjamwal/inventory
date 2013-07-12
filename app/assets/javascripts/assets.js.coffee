$(document).ready ->
  $('.flip').on 'click', (e)->
    $(this).siblings('.card').toggleClass('flipped')
    false
  return
