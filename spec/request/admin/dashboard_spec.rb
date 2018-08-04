require 'rails_helper'

describe 'GET /admin', type: :request do
  let!(:currency) { FactoryGirl.create(:currency) }

  context 'valid' do
    before { get admin_root_path, headers: headers_with_basic_auth }

    it { expect(response).to have_http_status(200) }

    it { expect(response.body).to have_tag('select', with: { id: 'changeCurrency' }) }
    it { expect(response.body).to have_tag('input', with: { 'data-id' => 'forcedValue' }) }
    it { expect(response.body).to have_tag('input', with: { 'data-id' => 'forcedTime' }) }
  end
end
