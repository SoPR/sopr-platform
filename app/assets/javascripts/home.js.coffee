# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$("[data-toggle=tab]").click ->
  $($(this).attr("href")).toggleClass "active"  if $(this).parent().hasClass("active")

$ ->
  $('select').change (e) ->
    oldClass = $('.profile-image').attr('class').split(' ').pop()
    $('.profile-image').removeClass(oldClass).addClass e.target.value

