FactoryBot.define do
  factory :cart do
    user { nil }
    product { nil }
    name { "MyString" }
    items { 1 }
    cost { 1 }
  end
end
