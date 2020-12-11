class OrdersController < ApplicationController
  before_action :set_item, only: [:index, :create]
  before_action :move_to_login, :move_to_top, :other_move_to_top, only: :index
  
  def index
    @user_purchase = UserPurchase.new
  end

  def create
    @user_purchase = UserPurchase.new(user_purchase_params)
    if @user_purchase.valid?
      pay_item
      @user_purchase.save
      redirect_to root_path
    else
      render :index
    end
  end

  private

  def user_purchase_params
    params.require(:user_purchase).permit(:postal_code, :address_id, :city, :house_number, :building_name, :tell_number).merge(user_id: current_user.id, item_id: @item.id, token: params[:token])
  end

  def set_item
    @item = Item.find(params[:item_id])
  end

  def pay_item
    Payjp.api_key = ENV['PAYJP_SECRET_KEY']
    Payjp::Charge.create(
      amount: @item.price,
      card: user_purchase_params[:token],
      currency: 'jpy'
    )
  end

  def move_to_login
    redirect_to new_user_session_path unless user_signed_in?
  end

  def move_to_top
    redirect_to root_path if current_user.id == @item.user_id
  end

  def other_move_to_top
    redirect_to root_path unless @item.purchase_record.nil?
  end
end
