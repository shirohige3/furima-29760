class ItemsController < ApplicationController
  before_action :set_action, only: [:edit, :show, :destroy, :update]
  before_action :move_to_index, only: [:edit]
  before_action :buy_to_move, only: [:edit]
  def index
    @items = Item.includes(:user, :item_customer).order('created_at DESC')
  end

  def new
    @item = Item.new(user_id: current_user.id)
  end

  def create
    @item = Item.new(item_params)
    if @item.valid?
      @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  def destroy
    if @item.destroy
      redirect_to root_path
    else
      render :show
    end
  end

  def update
    if @item.update(item_params)
      redirect_to root_path
    else
      render :edit
    end
  end

  private

  def item_params
    params.require(:item).permit(:name, :image, :description, :price, :category_id, :condition_id, :shipping_fee_id, :ship_form_id, :shipping_day_id).merge(user_id: current_user.id)
  end

  def set_action
    @item = Item.find(params[:id])
  end

  def move_to_index
    redirect_to root_path unless user_signed_in?
  end

  def buy_to_move
    redirect_to root_path if @item.user.id != current_user.id || !@item.item_customer.nil?
  end
end
