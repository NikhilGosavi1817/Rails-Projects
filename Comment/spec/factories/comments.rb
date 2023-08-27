FactoryBot.define do
  factory :comment do
    user { nil }
    book { nil }
    content { "MyString" }
  end
end
