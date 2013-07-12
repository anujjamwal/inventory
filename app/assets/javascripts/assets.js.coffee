$('.thumbnail').on 'click', '.card', (e)->
  e.preventDefault()
  $(this).toggleClass('flipped')
  false
