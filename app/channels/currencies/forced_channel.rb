class Currencies::ForcedChannel < ApplicationCable::Channel
  def subscribed
    stream_from current_user
  end

  def speak(data)
    ActionCable.server.broadcast current_user, currency_options(data['currency_id'])
  end

protected

  def currency_options(id)
    CurrenciesRepresenter.element(
      Currency.find(id)
    )
  end
end
