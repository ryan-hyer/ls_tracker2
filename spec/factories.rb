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

  factory :invoice do
  	sequence(:number) { |n| "Invoice#{n}" }
  	description "Test Invoice"
  	amount 3000
  	date_invoiced "2013-12-31"
  	date_paid "2014-05-05"
  end
end