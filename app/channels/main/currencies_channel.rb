class Main::CurrenciesChannel < ApplicationCable::Channel
  def subscribed
    stream_from params['channel']
  end
end
