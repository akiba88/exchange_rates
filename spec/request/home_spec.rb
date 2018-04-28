require 'rails_helper'

describe 'GET /', type: :request do
  let!(:currency) { FactoryGirl.create(:currency) }

  let(:data) { SendDataToCurrenciesChannel.new(currency).send(:data) }

  context 'valid' do
    before { get root_path }

    it { expect(response).to have_http_status(200) }
    it { expect(response.body).to include(data[:html]) }
  end
end
