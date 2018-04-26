class Currencies::ForcedForm < Reform::Form
  property :currency_id, virtual: true

  property :forced_value
  property :forced_expiriation_at

  validate :currency_id_should_be_exists

  validates :forced_value, presence: true, numericality: { greater_than: 0 }
  validates :forced_expiriation_at, presence: true

  def forced_expiriation_at
    super.strftime(format_time)
  end

  def forced_expiriation_at=(value)
    super Time.strptime(value, format_time)
  end

  def forced_value=(value)
    super value.to_s.tr(',', '.')
  end

protected

  def currency_id_should_be_exists
    errors.add(:currency_id, :invalid) unless Currency.exists?(currency_id)
  end

  def format_time
    BaseConstants.format_datetimepicker
  end
end
