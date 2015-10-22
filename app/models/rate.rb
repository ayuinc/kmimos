class Rate < ActiveRecord::Base
  belongs_to :provider
  belongs_to :size
end
