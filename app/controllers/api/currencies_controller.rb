class Api::CurrenciesController < Api::BaseController
  def index
    render json: currencies_collection.as_json(
      only: %i[parent_code char_code],
      methods: :current_value
    )
  end

private

  def currencies_collection
    @currencies_collection ||= Currency.where(parent_code: BaseConstants.available_currencies_codes)
  end
end
