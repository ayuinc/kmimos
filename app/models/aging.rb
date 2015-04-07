class Aging < ActiveRecord::Base
  belongs_to :provider
  belongs_to :age
end
