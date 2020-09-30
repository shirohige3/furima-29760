class CustomerDestination

  include ActiveModel::Model
  attr_accessor :postal_code, :prefecture_id, :city, :house_number, :building_name, :telephone_number, :item_customer

  # with_options presence: true do
  #   validates :postal_code, format: { with: /\A\d{3}[-]\d{4}\z/}
  #   validates :prefecture,
  #   validates :city
  #   validates :house_number
  #   validates :telephone_number, format: { with: /\A[0-9]{,11}\z/}
  # end
  validates :postal_code, presence: true, format: { with: /\A\d{3}[-]\d{4}\z/}
  validates :prefecture, presence: true, numericality: { other_than: 1}
  validates :city,  presence: true
  validates :house_number, presence: true
  validates :telephone_number, presence: true, format: { with: /\A[0-9]{,11}\z/}
  def save
    # @item = Item.find(params[:id])
    itemcustomer = ItemCustomer.create(user_id: current_user.id, item_id: @item.id)
    SendDestination.create(postal_code: postal_code, prefecture_id: prefecture_id, city: city, house_number: house_number, building_name: building_name, telephone_number: telephone_number,itemcustomer_id: itemcustomer.id)
  end

 
end
