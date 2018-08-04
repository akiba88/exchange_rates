module RequestSpecHelper
  def headers_with_basic_auth
    {
      'HTTP_AUTHORIZATION' => ActionController::HttpAuthentication::Basic.encode_credentials('admin', 'root')
    }
  end
end
