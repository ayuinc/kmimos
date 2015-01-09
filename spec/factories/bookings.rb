FactoryGirl.define do
  factory :booking do
    sequence(:user_first_name)     { |n| "First-name#{n}" } 
    sequence(:user_last_name)      { |n| "Last-name#{n}" } 
    sequence(:user_email)          { |n| "user#{n}@example.com" }
    user_phone            "2141212421"
    ref_code                    "XCZ07"
    user_message                  "lo que quiero"
  end  
end

