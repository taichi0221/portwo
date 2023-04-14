FactoryBot.define do
  factory :user do
    nickname              {'test'}
    email                 {'test@exampl'}
    password              {'user11'}
    password_confirmation {password}
  end
end