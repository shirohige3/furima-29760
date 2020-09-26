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

  validates :price,             numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999, message: 'is out of setting range' }

  validates :category, presence: true

  with_options numericality: { other_than: 1 } do
    validates :category_id
    validates :condition_id
    validates :shipping_fee_id
    validates :ship_form_id
    validates :shipping_day_id
  end
end
