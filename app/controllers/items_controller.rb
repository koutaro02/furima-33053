class ItemsController < ApplicationController

  #before_action :authenticate_user!, expect: [:new]

  def index
    @items = Item.order("created_at DESC")
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  private

  def item_params
    params.require(:item).permit(:image, :product, :product_explain, :category_id, :condition_id, :burden_id, :prefecture_id, :delivery_time_id, :price).merge(user_id: current_user.id)
  end

end
