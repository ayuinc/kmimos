class Booking < ActiveRecord::Base
	include Tokenable
	include ResetTokenable
  belongs_to :provider
  validates_presence_of :user_email, :user_first_name, :user_last_name, :provider_id, :user_phone, :raza, :edad
  validates_format_of :user_email, with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i

  def to_param
    token
  end
end