#= require jquery
#= require jquery_ujs
#= require jquery.fileupload

simpleImagesForm = ->
  $(".simple_image_btn").click ->
    input = $(this).next().find("input")
    input.click()

  $('.new_simple_image, .edit_simple_image').fileupload
    dataType: 'script'
    add: (e, data) ->
      $('#' + data.form.context.id).children('.simple_image_btn').hide()
      $('.' + data.form.context.id).show()
      data.submit()
    done: (e, data) ->
      $('#' + data.form.context.id).children('.simple_image_btn').show()
      $('.' + data.form.context.id).hide()

jQuery ->
  simpleImagesForm()
