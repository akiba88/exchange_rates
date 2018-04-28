class Currencies::UpdateList
  def run
    data.each do |attributes|
      currency = Currency.find_or_initialize_by(parent_code: attributes['ID'])

      currency.name = attributes['Name']
      currency.eng_name = attributes['EngName']

      currency.save if currency.changes.present?
    end
  end

protected

  def response
    CbrApi::GetterCurrenciesList.run
  end

  def data
    @data ||= Hash.from_xml(response.body.to_s).try(:[], 'Valuta').try(:[], 'Item') || []
  end
end
