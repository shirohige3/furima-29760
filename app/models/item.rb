class Item < ApplicationRecord
has_one          :item_customer
belongs_to       :user, through: :item_customer
has_one_attached :image
end
