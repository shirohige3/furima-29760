class SendDestinationsController < ApplicationController
  before_action :set_action
  before_action :move_to_routes

  def index
    @senddestinations = CustomerDestination.new
  end
  
  def new
    @senddestination = CustomerDestination.new
  end
  def create
    binding.pry
    @senddestination = CustomerDestination.new(senddestination_params)
    @senddestination.save
  end

  private
  def senddestination_params
    params.require(:customer_destination).permit(:postal_code, :prefecture_id, :city, :house_number, :building_name, :telephone_number)
  end

  def move_to_routes
    if user_signed_in? && current_user.id != @item.user_id
      redirect_to item_send_destinations_path(item_id: @item.id)
    elsif user_signed_in? && current_user.id == @item.user_id
       redirect_to root_path
     else
       redirect_to new_user_session_path
     end
    end

      def set_action
        @item = Item.find(params[:item_id])
      end
end
