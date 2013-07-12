@notify =
  notice: (message, settings={})->
    element = this.generateElement(message, 'alert-success')
    this.showNotification(element, settings)

  generateElement: (message, type)->
    parentDiv = $(document.createElement('div')).addClass('notification-container')
                                                .appendTo('#notifications')

    alertBox = $(document.createElement('div')).addClass('alert')
                                               .addClass(type)
                                               .html(message)
                                               .appendTo(parentDiv)

    $(document.createElement('button')).addClass('close')
                                       .data('dismiss', 'alert')
                                       .attr('type', 'button')
                                       .html('&times;')
                                       .prependTo(alertBox)

    return parentDiv

  showNotification: (element, options, message)->
    settings = $.extend({}, this.defaults, options)
    element.hide()
           .slideToggle(300)
           .delay(settings.timeout)
           .slideToggle(300)
           .queue ()->
             $(this).remove()

  defaults:
    timeout: 4000