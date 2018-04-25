class Currency < ApplicationRecord
  def display_value
    return forced_value if forced_expiriation_at.present? && forced_expiriation_at > Time.current

    value
  end
end
