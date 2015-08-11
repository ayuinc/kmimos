# == Schema Information
#
# Table name: meetings
#
#  id              :integer          not null, primary key
#  provider_id     :integer
#  user_first_name :string(255)
#  user_last_name  :string(255)
#  user_phone      :string(255)
#  user_email      :string(255)
#  token           :string(255)
#

class Meeting < ActiveRecord::Base
	include Tokenable
	include ResetTokenable
  belongs_to :provider
  validates_presence_of :user_email, :user_first_name, :user_last_name, :provider_id, :user_phone
  validates_format_of :user_email, with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i

  def to_param
    token
  end

end
