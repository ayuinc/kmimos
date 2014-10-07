FactoryGirl.define do
  factory :provider do
    sequence(:name)     { |n| "First-name#{n}" } 
    sequence(:last_name_1)     { |n| "Last-name#{n}" } 
    sequence(:last_name_2)     { |n| "Last-name#{n}" } 
    sequence(:email)         { |n| "provider#{n}@example.com" }
    dni                    "0123456789123"
    phone                    "5342352"
    description                  "lo que hago"
    password                 "foobarbaz"
    password_confirmation    "foobarbaz"
    category
    locations          {|t| [t.association(:location)] }
  end  
end

