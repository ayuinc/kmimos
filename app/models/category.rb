# == Schema Information
#
# Table name: categories
#
#  id   :integer          not null, primary key
#  name :string(255)
#

class Category < ActiveRecord::Base
  has_many :providers
end
