class Age < ActiveRecord::Base
	has_many :agings
	has_many	:providers, :through => :agings
end