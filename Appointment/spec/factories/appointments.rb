FactoryBot.define do
  factory :appointment do
    date { "MyString" }
    from { "MyString" }
    to { "MyString" }
    user { nil }
    doctor { nil }
  end
end
