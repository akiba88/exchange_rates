module RequestSpecHelper
  def headers_with_basic_auth
    {
      'HTTP_AUTHORIZATION' => ActionController::HttpAuthentication::Basic.encode_credentials('admin', 'root')
    }
  end

  def parsed_body
    parsed_body = JSON.parse(response.body)

    parsed_body.symbolize_keys if parsed_body.is_a?(Hash)

    parsed_body.map(&:symbolize_keys)
  end
end
