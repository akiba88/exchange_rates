class HomeController < ApplicationController
  helper_method :currencies_collection

  def index
  end

protected

  def currencies_collection
    @currencies_collection ||= Currency.where(parent_code: BaseConstants.available_currencies_codes).decorate
  end
end
