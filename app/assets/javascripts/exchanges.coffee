$(document).ready ->
  $("#selectLang").change ->
    loadLanguage($("#selectLang").value)  
    
  $("#amount").change ->
    currencyExchange()

  $("#source_currency").change ->
    currencyExchange()

  $("#target_currency").change ->
    currencyExchange()

  $("#btn_exchange").click ->
    swap = $('#source_currency').val()
    $('#source_currency').val($('#target_currency').val())
    $('#target_currency').val(swap)
    if $("#amount").val() > 0
      currencyExchange()

currencyExchange = ->
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
      success: (data, text, jqMoedaXHR) ->
        $('#result').val(data.value)
    return false;

loadLanguage = (language) ->
  window.location.href = "http://localhost:3000/en" + language
