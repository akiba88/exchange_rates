class SendDataToCurrenciesChannel
  attr_reader :currency

  def initialize(currency)
    @currency = currency
  end

  def run
    ActionCable.server.broadcast 'Main::CurrenciesChannel', data
  end

protected

  def currency_options
    @currency_options ||= CurrenciesRepresenter.element(currency.decorate)
  end

  def data
    {
      code: currency_options[:code],
      html: ApplicationController.new.render_to_string(
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
