FactoryGirl.define do
  factory :location do
  	sequence(:name)     { |n| "Distrito#{n}" } 
  end
end
