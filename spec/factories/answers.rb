FactoryBot.define do
  factory :answer do
    user
    question
    answer { "Answer" }
  end
end
