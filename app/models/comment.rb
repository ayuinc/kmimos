class Comment < ActiveRecord::Base
  belongs_to :provider
  belongs_to :user
  has_many :comment_valuations
end
