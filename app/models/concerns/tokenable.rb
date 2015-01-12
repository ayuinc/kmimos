module Tokenable
  extend ActiveSupport::Concern

  included do
    before_create :generate_token
  end

  protected

  def generate_token
    self.code_value = SecureRandom.hex(3).upcase
  end
end
