#= require jquery
#= require jquery_ujs

simpleImagesForm = ->
  $(".simple_image_btn").click ->
    input = $(this).next().find("input")
    input.click()

  $(".simple_image_input").change ->
    $(this).closest("form").submit()

jQuery ->
  simpleImagesForm()
