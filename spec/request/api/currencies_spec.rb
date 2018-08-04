require 'rails_helper'

describe 'GET /api/currencies', type: :request do
  let!(:currency) { FactoryGirl.create(:currency) }

  before { get api_currencies_path }

  it { expect(response).to have_http_status(200) }
  it do
    expect(parsed_body).to include(
      parent_code: 'R01235',
      char_code: 'TEST',
      current_value: '60.0'
    )
  end
end
