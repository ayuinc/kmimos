module ResetTokenable
  extend ActiveSupport::Concern

  protected

  def generate_reset_token(column)
    begin
      self[column] = SecureRandom.urlsafe_base64.downcase
    end while self.class.exists?(column => self[column])
  end

end