# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$ ->
  $("form.update_subscribed").bind("ajax:success", (event, xhr, settings) ->
    console.log(event)
    console.log(xhr)
    console.log(settings)
    location.reload()
  ).bind("ajax:error", (event, xhr, settings, exceptions) ->
    console.log(event)
    console.log(xhr)
    console.log(settings)
  )
