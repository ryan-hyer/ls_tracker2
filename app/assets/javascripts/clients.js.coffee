# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

ToggleMonth = ->
  if $("select#client_invoice_freq").val() is "Annual"
    $("div#inv_month").css "visibility", "visible"
  else
    $("div#inv_month").css "visibility", "hidden"
  return

$(document).ready ->
  ToggleMonth()
  $("select#client_invoice_freq").change ->
  	ToggleMonth()
	return
