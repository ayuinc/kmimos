FactoryGirl.define do
  factory :category do
    sequence(:name)  { |n| "Categoria_#{n}" } 
  end
end
