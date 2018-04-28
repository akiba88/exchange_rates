class Currencies::UpdateValues
  def run
    data.each do |attributes|
      currency = Currency.find_by(parent_code: attributes['ID'])

      next unless currency.present?

      currency.num_code = attributes['NumCode']
      currency.char_code = attributes['CharCode']
      currency.value = attributes['Value'].to_s.tr(',', '.')

      SendDataToCurrenciesChannel.new(currency).run if currency.save
    end
  end

protected

  def response
    CbrApi::GetterCurrenciesValues.run
  end

  def data
    @data ||= Hash.from_xml(response.body.to_s).try(:[], 'ValCurs').try(:[], 'Valute') || []
  end
end
