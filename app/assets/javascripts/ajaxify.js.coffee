$(document).on 'submit', 'form.ajax', (e)->
  console.log 'in handler'
  e.preventDefault()
  $form = $(this)
  $.ajax
    method: $form.attr('method'),
    url: $form.attr('action'),
    data: $form.serialize(),
    success: (data)->
      form_handler[$form.attr("id")].success(data, $form)