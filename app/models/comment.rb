class Comment < ActiveRecord::Base
  belongs_to :provider
  belongs_to :user
  
  has_many :comment_valuations
  accepts_nested_attributes_for :comment_valuations
  
  has_many :valuations, :through =>  :comment_valuations
  
  
  
end
