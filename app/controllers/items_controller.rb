class ItemsController < ApplicationController
  before_action :set_action, only:[:edit, :show, :destroy, :update]
  def index
    @items = Item.includes(:user).order('created_at DESC')
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
end
