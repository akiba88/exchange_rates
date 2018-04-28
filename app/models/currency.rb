class Currency < ApplicationRecord
  def display_forced_expiriation_at
    forced_expiriation_at.strftime(BaseConstants.format_datetimepicker) if forced_expiriation_at.present?
  end

  def display_value
    return forced_value if forced_expiriation_at.present? && forced_expiriation_at > Time.current

    value
  end

  def check_completion_of_forcing
    SendDataToCurrenciesChannel.new(self).run
  end

  def check_completion_of_forcing_async
    CurrencyWorker.perform_at(forced_expiriation_at, id, :check_completion_of_forcing)
  end
end
