$(document).ready ->
  $.each $('table[data-visualize]'), ->
    data = []
    $.each $(this).find('tr.data'), ->
      data.push
        value: parseInt($(this).find('.value').html())
        color: $(this).find('.color').html()
    console.log(data)
    $element = $(document.createElement('canvas')).addClass('chart').insertAfter($(this)).attr('height', '240').attr('width', '240').get(0).getContext('2d')
    new Chart($element).Pie(data);
    $(this).remove()
