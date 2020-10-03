FactoryBot.define do
  factory :customer_destination do
    # number            { 4242424242424242 }
    # cvc               { 123 }
    # exp_month         { 3 }
    # exp_year          { 23 }
    token             { 'card_token' }
    postal_code       { '111-1111' }
    prefecture_id     { '2' }
    city              { '長崎市' }
    house_number      { '式見' }
    building_name     { 'スターサイドビル' }
    telephone_number  {Faker::Number.number(digits: 11)}
  end
end
