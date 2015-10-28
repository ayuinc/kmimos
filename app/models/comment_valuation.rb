class CommentValuation < ActiveRecord::Base
  belongs_to :comment
  belongs_to :valuation
  
end
