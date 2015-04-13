FactoryGirl.define do
  factory :user do
    email 'test@example.com'
    password '123123123'
    username 'test@example.com'
    confirmed_at Date.today
  end
end
