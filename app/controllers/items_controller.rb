class ItemsController < ApplicationController
  def index
    
  end
  def new
    @item = Item.new(user_id: current_user.id)
  end
  def create
    # binding.pry
    @item = Item.new(item_params)
    if @item.valid? 
      @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  private
  def item_params
    params.require(:item).permit(:name, :image, :description, :price, :category_id, :condition_id, :shipping_fee_id, :ship_form_id,  :shipping_day_id).merge(user_id: current_user.id)
  end
end
