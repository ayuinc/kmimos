class Valuation < ActiveRecord::Base
  has_many :comment_valuations
  
  #scope :by_comments, ->(cs) { Valuation.all.map{|v| cs.map{|c| c.comment_valuations.where(valuation_id: v.id).average(:value)}} }

  scope :by_comments, ->(provider_id) { 
    CommentValuation.joins(:comment).joins(:valuation)
    .select(['valuations.name as name', 'AVG(value) as value'])
    .where('comments.provider_id = ?', provider_id).group('valuations.name').map{
      |c| [c.name, c.value]
    }
  }
  
  

  #scope :by_comment, ->(c) { c.comment_valuations.select(['valuation_id', 'SUM(value) as value']).group(:valuation_id).map{|cv| [cv.valuation_id, cv.value]}}
  
  
end
