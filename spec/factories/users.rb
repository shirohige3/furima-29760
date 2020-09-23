FactoryBot.define do
  factory :user do
    nickname              {Faker::Name.initials(number: 2)}
    email                 {Faker::Internet.free_email}
    password              { "1234aa"}
    password_confirmation {password}
    first_name            { "隆" }
    family_name           { "加藤" }
    first_name_kana       { "カトウ" }
    family_name_kana      { "タカシ" }
    birth_date            { "1999-2-2"}
  end
end