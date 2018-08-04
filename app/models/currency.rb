class Currency < ApplicationRecord
  def check_completion_of_forcing
    SendDataToCurrenciesChannel.new(self).run
  end

  def check_completion_of_forcing_async
    CurrencyWorker.perform_at(forced_expiriation_at, id, :check_completion_of_forcing)
  end

  def current_value
    return forced_value if forced_expiriation_at.present? && forced_expiriation_at > Time.current

    value
  end
end
