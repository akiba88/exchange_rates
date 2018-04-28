class Admin::Currencies::ForcedController < Admin::BaseController
  helper_method :forced_currency_form

  def update
    if forced_currency_form.validate(params[:currency]) && forced_currency_form.save
      SendDataToCurrenciesChannel.new(forced_currency_form.model).run

      forced_currency_form.model.check_completion_of_forcing_async

      redirect_to admin_root_url
    else
      Rails.logger.error forced_currency_form.errors.messages

      render 'admin/dashboard/index'
    end
  end

protected

  def forced_currency_form
    @forced_currency_form ||= ::Currencies::ForcedForm.new(resource_currency)
  end

  def resource_currency
    @resource_currency ||= Currency.find(params[:currency][:currency_id])
  end
end
