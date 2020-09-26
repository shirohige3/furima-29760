FactoryBot.define do
  factory :item do
    name            {"ダンベル"}
    description     {"美味しい"}
    price           {300}
    category_id     {2}
    condition_id    {2}
    shipping_fee_id {2}
    ship_form_id    {2}
    shipping_day_id {2}
    association :user
    
    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end
