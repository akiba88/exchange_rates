require 'rails_helper'

describe 'GET /admin', type: :request do
  let!(:currency) { FactoryGirl.create(:currency) }
  let(:user) { FactoryGirl.create(:user) }

  before { sign_in user }

  context 'valid' do
    before { get admin_root_path }

    it { expect(response).to have_http_status(200) }

    it { expect(response.body).to have_tag('select', with: { id: 'changeCurrency' }) }
    it { expect(response.body).to have_tag('input', with: { 'data-id' => 'forcedValue' }) }
    it { expect(response.body).to have_tag('input', with: { 'data-id' => 'forcedTime' }) }
  end
end
