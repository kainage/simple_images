#= require jquery
#= require jquery_ujs
#= require jquery.fileupload

simpleImagesForm = ->
  $(".simple_image_btn").click ->
    input = $(this).next().find("input")
    input.click()

  $('.new_simple_image, .edit_simple_image').fileupload
    dataType: 'script'

jQuery ->
  simpleImagesForm()
