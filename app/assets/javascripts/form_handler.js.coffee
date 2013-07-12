@form_handler =
  new_office:
    success: (data, $form)->
      notify.notice('Office created successfully')
      $form.parents('.modal').find(".close").click()

  new_company:
      success: (data, $form)->
        notify.notice('Company created successfully')
        $form.parents('.modal').find(".close").click()

  new_warranty:
      success: (data, $form)->
        notify.notice('Warranty created successfully')
        $form.parents('.modal').find(".close").click()

  new_model:
      success: (data, $form)->
        notify.notice('Model created successfully')
        $form.parents('.modal').find(".close").click()

  new_assignment:
      success: (data, $form)->
        notify.notice('Asset assigned successfully')