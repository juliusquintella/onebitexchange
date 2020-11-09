# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$(document).ready ->
  $('.convert').change ->
    $.ajax '/convert',
      type: 'GET'
      dataType: 'json'
      data: {
              source_currency: $("#source_currency").val(),
              target_currency: $("#target_currency").val(),
              amount: $("#amount").val()
            }
      error: (jqXHR, textStatus, errorThrown) ->
        alert textStatus
      success: (data, text, jqXHR) ->
        $('#result').val(data.currency[0].value * $("#amount").val())
        $('#cotacao').text("Cotação atual da moelda em: " + new Date(data.currency[0].date).toLocaleDateString('pt-br') + " " + data.currency[0].date.substring(11) + 
        " => "  + data.currency[0].value)
    return false;
  
  $('#invert').click ->
    target = $("#source_currency").val()
    $("#source_currency").val($("#target_currency").val())
    $("#target_currency").val(target)
    $('.convert').change()