class Currencies::ForcedForm < Reform::Form
  property :currency_id, virtual: true

  property :forced_value
  property :forced_expiriation_at

  validate :currency_id_should_be_exists

  validates :forced_value, presence: true, numericality: { greater_than: 0, less_than_or_equal_to: 1000 }
  validates :forced_expiriation_at, presence: true
  validate :forced_expiriation_time_should_be_greater_than_current_time, if: -> { forced_expiriation_at.present? }

  def forced_expiriation_at
    value = super

    value.present? ? value.strftime(format_time) : value
  end

  def forced_expiriation_at=(value)
    super Time.strptime(value, format_time) if value.present?
  end

  def forced_value=(value)
    super value.to_s.tr(',', '.')
  end

protected

  def currency_id_should_be_exists
    errors.add(:currency_id, :invalid) unless Currency.exists?(currency_id)
  end

  def forced_expiriation_time_greater_than_current_time?
    Time.strptime(forced_expiriation_at, format_time) > Time.current
  end

  def forced_expiriation_time_should_be_greater_than_current_time
    errors.add(:forced_expiriation_at, :invalid) unless forced_expiriation_time_greater_than_current_time?
  end

  def format_time
    BaseConstants.format_datetimepicker
  end
end
