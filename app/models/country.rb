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
#  phone      :string(255)
#  facebook   :string(255)
#  twitter    :string(255)
#  flag       :string(255)
#  domain     :string(255)
#  dni_length :integer
#

class Country < ActiveRecord::Base
    validates_presence_of :name
    has_many :states
end
