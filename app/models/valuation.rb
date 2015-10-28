class Valuation < ActiveRecord::Base
  has_many :comment_valuations
  
  scope :by_comments, ->(cs) { Valuation.all.map{|v| v.get_valuation_results(cs)} }

  def get_valuation_results(comments)
    response = Array.new
    comments.each do |comment|
      valuations = comment.comment_valuations.where(valuation_id: self.id).map{|val| val.value.to_i}
      valuation = valuations.reduce(:+).to_i / valuations.size rescue 0
      response = [self.name, valuation]
    end
    return response 
  end
  
end
