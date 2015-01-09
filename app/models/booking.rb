class Booking < ActiveRecord::Base
  belongs_to :provider
  validates_presence_of :user_email, :user_first_name, :user_last_name, :provider_id
  validates_format_of :user_email, with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
end
