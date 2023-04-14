FactoryBot.define do
  factory :question do
    language { "Ruby" }
    framework { "Ruby on Rails" }
    hobby { "Programming" }
    desired_engineer { "Backend Engineer" }
    association :user
  end
end
