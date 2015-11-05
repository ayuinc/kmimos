class AcceptedBehavior < ActiveRecord::Base
  belongs_to :provider
  belongs_to :behavior
end
