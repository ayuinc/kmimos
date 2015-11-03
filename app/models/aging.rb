# == Schema Information
#
# Table name: agings
#
#  id          :integer          not null, primary key
#  provider_id :integer
#  age_id      :integer
#

class Aging < ActiveRecord::Base
  belongs_to :provider
  belongs_to :age
  
  def to_s
    self.age
  end
  
end
