FactoryBot.define do
  factory :tender do
    company_name { "MyString" }
    cost { 1 }
    status { "MyString" }
    note { "MyString" }
    project { nil }
  end
end
