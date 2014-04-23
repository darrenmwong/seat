# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

jQuery ->
  $('#calendar').datepicker()
  $("#calendar_icon_datepicker").datepicker()
  $('#calendar_icon_datepicker').attr src: "<%= asset_path('calendar-metro-icon.png') %>"
  buttonImageOnly = true
  changeMonth = true
  changeYear = true
  showOn = "both"


  
