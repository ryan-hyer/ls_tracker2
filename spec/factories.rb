FactoryGirl.define do
  factory :user do
    sequence(:email) { |n| "person_#{n}@example.com"}
    password "foobarbar"
    password_confirmation "foobarbar"
  end

  factory :client do
  	sequence(:name) { |n| "FakeClient#{n}" }
  	sequence(:listing_number) { |n| "13A0#{n}" }
  end
end