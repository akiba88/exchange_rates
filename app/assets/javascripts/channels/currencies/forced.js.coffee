App.room = App.cable.subscriptions.create 'Currencies::ForcedChannel',
  connected: ->
    # Called when the subscription is ready for use on the server

  disconnected: ->
    # Called when the subscription has been terminated by the server

  received: (data) ->
    $('input[data-id=forcedValue]').val(data['forced_value'])
    $('input[data-id=forcedTime]').val(data['forced_expiriation_at'])

  speak: (message) ->
    @perform 'speak', message

$(document).on 'change', '#changeCurrency', ->
  App.room.speak { currency_id: event.target.value }
  event.preventDefault()
