class ItemsController < ApplicationController
  before_action :set_item, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, :move_to_top, :other_move_to_top, only: :edit
  before_action :move_to_top, only: :destroy

  def index
    @items = Item.order('created_at DESC')
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

  def show
  end

  def edit
  end

  def update
    if @item.update(item_params)
      redirect_to action: :show
    else
      render :edit
    end
  end

  def destroy
    @item.destroy
    redirect_to root_path
  end

  private

  def item_params
    params.require(:item).permit(:name, :explanatory_text, :price, :status_id, :delivery_fee_id, :address_id, :delivery_date_id, :genre_id, :image).merge(user_id: current_user.id)
  end

  def set_item
    @item = Item.find(params[:id])
  end

  def move_to_top
    redirect_to root_path unless current_user.id == @item.user_id
  end

  def other_move_to_top
    redirect_to root_path unless @item.purchase_record.nil?
  end
end
