module OmniAuth
  def valid_facebook_login_setup
    if Rails.env.test?
      OmniAuth.config.test_mode = true
      OmniAuth.config.mock_auth[:facebook] = OmniAuth::AuthHash.new({
        provider: 'facebook',
        uid: '123545',
        info: {
          first_name: "Andrea",
          last_name:  "Del Rio",
          email:      "test@example.com"
        },
        credentials: {
          token: "123456",
          expires_at: Time.now + 1.week
        },
        extra: {
          raw_info: {
            gender: "female"
          }
        }
      })
    end
  end

  def facebook_login_failure
    OmniAuth.config.mock_auth[:facebook] = :invalid_credentials
  end
end
World(OmniAuth)
