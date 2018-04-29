require 'rails_helper'

describe 'Currencies::ForcedForm' do
  let!(:currency) { FactoryGirl.create(:currency) }

  let(:forced_form) { Currencies::ForcedForm.new(currency) }
  let(:options) do
    {
      currency_id: currency.id,
      forced_value: 1000.0,
      forced_expiriation_at: 10.minutes.since.strftime(format_time)
    }
  end

  context 'valid' do
    before { forced_form.validate(options) }

    it { expect(forced_form.valid?).to eq(true) }
  end

  context 'invalid' do
    before { forced_form.validate({}) }

    it { expect(forced_form.valid?).to eq(false) }

    it { expect(forced_form.errors.messages).to include(:currency_id) }
    it { expect(forced_form.errors.messages).to include(:forced_value) }
    it { expect(forced_form.errors.messages).to include(:forced_expiriation_at) }
  end

  def format_time
    BaseConstants.format_datetimepicker
  end
end
