class SendingDestination < ApplicationRecord
  belongs_to :item_customer

  validates :postal_code, presence: true, format: { with: /\A\d{3}[-]\d{4}\z/}

  validates :prefecture, presence: true, numericality: { other_than: 1}

  validates :city,  presence: true

  validates :house_number, presence: true

  validates :telephone_number, presence: true, format: { with: /\A[0-9]{,11}\z/}

end
