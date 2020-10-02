class SendDestinationsController < ApplicationController
  before_action :set_action
  before_action :move_to_routes, only: [:index, :create]

  def index
    @senddestinations = CustomerDestination.new
  end
  
  def new
    @senddestination = CustomerDestination.new
  end
  def create
    binding.pry
    @senddestination = CustomerDestination.new(senddestination_params)
    if @senddestination.valid?
      pay_item
    @senddestination.save
     redirect_to root_path
    else
      render 'index'
    end
  end

  private
  def senddestination_params
    params.permit(:postal_code, :prefecture_id, :city, :house_number, :building_name, :telephone_number, :item_id, :item_customer_id, :token)
  end

  def move_to_routes
    # if user_signed_in? && current_user.id != @item.user_id
    #   redirect_to action: :index
    # elsif user_signed_in? && current_user.id == @item.user_id
    #    redirect_to root_path
    #  else
    #    redirect_to new_user_session_path
    #  end
    end

      def set_action
        @item = Item.find(params[:item_id])
      end

      def pay_item
        Payjp.api_key = ENV["PAYJP_SECRET_KEY"] 
        Payjp::Charge.create(
          amount: @item.price,
          card: senddestination_params[:token],
          currency:'jpy'
        )
        end

end
