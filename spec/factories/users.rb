FactoryBot.define do
  factory :user do
    transient do
      person { Gimei.name }
    end
    nickname              { Faker::Name.name }
    email                 { Faker::Internet.free_email }
    password = "a1"+Faker::Internet.password(min_length: 6)
    password              { password }
    password_confirmation { password }
    last_name             {"山田"}
    first_name            {"太郎"}
    last_name_kana        {"ヤマダ"}
    first_name_kana       {"タロウ"}
    birthday              { Faker::Date.birthday(min_age:18, max_age:65) }
  end
end