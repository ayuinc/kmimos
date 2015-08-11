# == Schema Information
#
# Table name: countries
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  locale     :string(255)
#  currency   :string(255)
#  created_at :datetime
#  updated_at :datetime
#

class Country < ActiveRecord::Base
    validates_presence_of :name
    has_many :states
end
