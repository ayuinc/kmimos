class Referral < ActiveRecord::Base
	validates_presence_of :referrer_email, :referrer_name
	validates_format_of :referrer_email, with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
	validates_uniqueness_of :referrer_email
	include TokenableReferral
end
