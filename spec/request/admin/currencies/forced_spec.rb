require 'rails_helper'

describe 'PATCH /admin/currencies/forced', type: :request do
  let!(:currency) { FactoryGirl.create(:currency) }

  let(:options) do
    {
      currency: {
        currency_id: currency.id,
        forced_value: 1000.0,
        forced_expiriation_at: 10.minutes.since.strftime(format_time)
      }
    }
  end

  context 'valid' do
    before do
      patch admin_currencies_forced_path(options), headers: headers_with_basic_auth

      currency.reload
    end

    it { expect(response).to have_http_status(302) }

    it { expect(currency.current_value).to eq(options[:currency][:forced_value]) }
  end

  def format_time
    BaseConstants.format_datetimepicker
  end
end
