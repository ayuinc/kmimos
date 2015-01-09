class Referral < ActiveRecord::Base
	validates_presence_of :referrer_email, :referrer_name
end
