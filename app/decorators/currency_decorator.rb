class CurrencyDecorator < Decorator
  def display_forced_expiriation_at
    forced_expiriation_at.strftime(BaseConstants.format_datetimepicker) if forced_expiriation_at.present?
  end

  def display_value
    return forced_value if forced_expiriation_at.present? && forced_expiriation_at > Time.current

    value
  end
end
