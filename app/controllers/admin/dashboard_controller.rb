class Admin::DashboardController < Admin::BaseController
  helper_method :forced_currency_form, :resource_currency

  def index
  end

protected

  def forced_currency_form
    @forced_currency_form ||= ::Currencies::ForcedForm.new(resource_currency)
  end

  def resource_currency
    @resource_currency ||= Currency.first
  end
end
