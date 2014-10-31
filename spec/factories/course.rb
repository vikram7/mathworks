FactoryGirl.define do
  factory :comment do
    sequence :user_id do |n|
      "#{n}"
    end

    text "This is my first comment"

    association :review
    association :user
  end
end
