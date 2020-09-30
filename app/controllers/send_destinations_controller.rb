class SendDestinationsController < ApplicationController
  # before_action :move_to_routes
  # before_action :set_item
  def index
    @senddestinations = CustomerDestination.new
  end
  
  def new
    @senddestination = CustomerDestination.new
  end
  def create
    @senddestination = CustomerDestination.new(senddestination_params)
    @senddestination.save
  end

  private
  def senddestination_params
    params.require(:customer_destination).permit(:postal_code, :prefecture_id, :city, :house_number, :building_name, :telephone_number)
  end

  # def move_to_routes
  #   if user_signed_in? && current_user.id == @item
  #      redirect_to root_path
  #    else
  #      redirect_to new_user_session_path
  #    end
  #   end
    # def set_customer
    #   @item = Item.()
    # end
end
