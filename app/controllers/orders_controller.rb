class OrdersController < ApplicationController
  before_action :set_item, only: [:index, :create]

  def index
    @user_purchase = UserPurchase.new
  end

  def create
    @user_purchase = UserPurchase.new(user_purchase_params)
    if @user_purchase.valid?
      @user_purchase.save
      redirect_to root_path
    else
      render :index
    end
  end

  private

  def user_purchase_params
    params.require(:user_purchase).permit(:postal_code, :address_id, :city, :house_number, :building_name, :tell_number).merge(user_id: current_user.id, item_id: @item.id) 
  end

  def set_item
    @item = Item.find(params[:item_id])
  end

end
