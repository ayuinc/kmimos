# == Schema Information
#
# Table name: sizings
#
#  id          :integer          not null, primary key
#  provider_id :integer
#  size_id     :integer
#

class Sizing < ActiveRecord::Base
  belongs_to :provider
  belongs_to :size
end
