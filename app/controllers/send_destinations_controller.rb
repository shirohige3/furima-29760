class SendDestinationsController < ApplicationController
  def index
   if user_signed_in? && current_user.id != @item.user_id
     render :new
   elsif current_user.id == @item.user_id
     redirecto_to root_path
   else
     redirect_to new_user_session_path
   end
  end
  
  def create
    @senddestination = CustomerDestination.new(senddestination_params)
    @senddestination.save
  end

  private
  def senddestination_params
    params.require(customer_destination).permit(:postal_code, :prefecture_id, :city, :house_number, :building_name, :telephone_number).merge(:item_customer_id)
  end


end
