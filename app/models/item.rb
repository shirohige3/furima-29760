class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :category
  belongs_to_active_hash :condition
  belongs_to_active_hash :shipping_fee
  belongs_to_active_hash :ship_form
  belongs_to_active_hash :shipping_day

has_one          :item_customer
belongs_to       :user
has_one_attached :image

validates :image,             presence: true

validates :name,              presence: true, length: { maximum: 40 }

validates :description,       presence: true, length: { maximum: 1000 }

# validates :price,             presence: true, format: { with: /\A30[0-9]|99999999[0-9]+\z/i, message: '半角数字で¥300〜¥9,999,999の間で入力してください'}
validates :price,             numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999, message: "is out of setting range"}

validates :category, presence: true
validates :category_id,       numericality: { other_than: 1 } 

validates :condition_id,      numericality: { other_than: 1 } 

validates :shipping_fee_id,  numericality: { other_than: 1 } 

validates :ship_form_id,      numericality: { other_than: 1 } 

validates :shipping_day_id,   numericality: { other_than: 1 } 
end
