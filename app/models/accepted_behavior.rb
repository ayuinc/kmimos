class AcceptedBehavior < ActiveRecord::Base
  belongs_to :provider
  belongs_to :behavior
  
  def to_s
    behavior.behavior_name
  end
  
end
