FactoryGirl.define do
  factory :project do
    title 'Build a boat'
    description 'What is boat?'
    difficult_level 'easy'
    cost 2000
    time 20
    privacy 'private'
    tags 'boat'
    can_clone 0
  end
end
