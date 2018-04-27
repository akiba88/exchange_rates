class Admin::Currencies::ForcedController < Admin::BaseController
  helper_method :forced_currency_form

  def update
    if forced_currency_form.validate(params[:currency]) && forced_currency_form.save
      ActionCable.server.broadcast 'Main::CurrenciesChannel', sending_data

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

  def currency_options
    @currency_options ||= CurrenciesRepresenter.element(forced_currency_form.model)
  end

  def sending_data
    {
      code: currency_options[:code],
      html: render_to_string(
        partial: 'home/shared/element',
        locals: {
          name: currency_options[:name],
          value: currency_options[:current_value]
        },
        laylout: false
      )
    }
  end
end
