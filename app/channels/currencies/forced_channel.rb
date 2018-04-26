class Currencies::ForcedChannel < ApplicationCable::Channel
  def subscribed
    stream_from params['channel']
  end

  def speak(data)
    ActionCable.server.broadcast params['channel'], currency_options(data['currency_id'])
  end

protected

  def currency_options(id)
    CurrenciesRepresenter.element(
      Currency.find(id)
    )
  end
end
