App.room = App.cable.subscriptions.create 'Main::CurrenciesChannel',
  connected: ->
    # Called when the subscription is ready for use on the server

  disconnected: ->
    # Called when the subscription has been terminated by the server

  received: (data) ->
    element = document.getElementById(data['code'])

    $(element).html(data['html'])

  speak: (message) ->
    @perform 'speak', message
