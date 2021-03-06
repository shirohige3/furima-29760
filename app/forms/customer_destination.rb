class CustomerDestination
  include ActiveModel::Model
  attr_accessor :postal_code, :prefecture_id, :city, :house_number, :building_name, :telephone_number, :item_customer_id, :item_id, :user_id, :token

  with_options presence: true do
    validates :postal_code, format: { with: /\A\d{3}[-]\d{4}\z/}
    validates :prefecture_id, numericality: { other_than: 1 }
    validates :city
    validates :house_number
    validates :telephone_number, format: { with: /\A[0-9]{,11}\z/}
    validates :token
  end

  def save
    itemcustomer = ItemCustomer.create(item_id: item_id, user_id: user_id)
    SendingDestination.create(postal_code: postal_code, prefecture_id: prefecture_id, city: city, house_number: house_number, building_name: building_name, telephone_number: telephone_number, item_customer_id: itemcustomer.id)
  end
end
