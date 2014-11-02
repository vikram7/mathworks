FactoryGirl.define do
  factory :source do
    sequence :name do |n|
      "source #{n}"
    end
  end
end
