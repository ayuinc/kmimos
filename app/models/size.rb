class Size < ActiveRecord::Base
	has_many :sizings
	has_many	:providers, :through => :sizings
end