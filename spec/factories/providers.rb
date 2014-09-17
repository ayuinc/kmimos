FactoryGirl.define do
  factory :provider do
    sequence(:name)     { |n| "First-name#{n}" } 
    sequence(:last_name_1)     { |n| "Last-name#{n}" } 
    sequence(:last_name_2)     { |n| "Last-name#{n}" } 
    sequence(:email)         { |n| "provider#{n}@example.com" }
    dni                    "45818351"
    phone                    "5342352"
    price                    30.5
    password                 "foobarbaz"
    password_confirmation    "foobarbaz"
    category
    locations          {|t| [t.association(:location)] }
  end  
end

