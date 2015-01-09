module Tokenable
  extend ActiveSupport::Concern

  included do
    before_create :generate_token
  end

  protected

  def generate_token
    self.code_value = SecureRandom.urlsafe_base64(8, false)
  end
end
