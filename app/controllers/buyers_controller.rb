class BuyersController < ApplicationController
  before_action :authenticate_user!, only: [:index, :create]
  before_action :set_buyer, only: [:index, :create]
  before_action :set_index, only: [:index, :create]

  def index
    @buyer_address = BuyerAddress.new
    if current_user == @item.user
      redirect_to root_path
    end
  end

  def create
    @buyer_address = BuyerAddress.new(buyer_params)
    if @buyer_address.valid?
      pay_item
      @buyer_address.save
      redirect_to root_path
    else
      render action: :index
    end
  end

  private

  def buyer_params
    params.require(:buyer_address).permit(:postcode, :prefecture_id, :city, :block, :building, :phone_number).merge(
      user_id: current_user.id, item_id: params[:item_id], token: params[:token]
    )
  end

  def pay_item
    Payjp.api_key = ENV['PAYJP_SECRET_KEY']
    Payjp::Charge.create(
      amount: @item.price,
      card: buyer_params[:token],
      currency: 'jpy'
    )
  end

  def set_buyer
    @item = Item.find(params[:item_id])
  end

  def set_index
    if @item.buyer.present?
      redirect_to root_path
    end 
  end
end
