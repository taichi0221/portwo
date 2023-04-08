FactoryBot.define do
  factory :answer do
    association :user
    association :question
    answer { "Answer" }
  end
end
