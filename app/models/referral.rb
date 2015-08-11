# == Schema Information
#
# Table name: referrals
#
#  id             :integer          not null, primary key
#  code_value     :string(255)
#  referrer_name  :string(255)
#  referrer_email :string(255)
#  created_at     :datetime
#  updated_at     :datetime
#

class Referral < ActiveRecord::Base
	validates_presence_of :referrer_email, :referrer_name
	validates_format_of :referrer_email, with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
	validates_uniqueness_of :referrer_email
	include TokenableReferral
end
