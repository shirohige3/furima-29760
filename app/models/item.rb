class Item < ApplicationRecord
has_one          :item_customer
belongs_to       :user
has_one_attached :image

validates :image,             presence: true

validates :name,              presence: true, length: { maximum: 40 }

validates :description,       presence: true, length: { maximum: 1000 }

# validates :price,             presence: true, format: { with: /\A30[0-9]|99999999[0-9]+\z/i, message: '半角数字で¥300〜¥9,999,999の間で入力してください'}
validates :price,             numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999, message: "is out of setting range"}

validates :category_id,       presence: true

validates :condition_id,      presence: true

validates :shipping_fee_id,  presence: true

validates :ship_form_id,      presence: true

validates :shipping_day_id,   presence: true
end
