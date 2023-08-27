FactoryBot.define do
  factory :project do
    user { nil }
    name { "MyString" }
    description { "MyText" }
    status { 1 }
    number_of_tenders { 1 }
  end
end
