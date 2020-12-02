class ItemsController < ApplicationController
  before_action :set_item, only: [:show, :edit, :destroy]
  before_action :move_to_rogin, :move_to_top, only: :edit

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
    @item = Item.find(params[:id])
    if @item.update(item_params)
      redirect_to action: :show
    else
      render :edit
    end
  end

  def destroy
    if current_user.id == @item.user_id
      @item.destroy
      redirect_to root_path
    end
  end

  private

  def item_params
    params.require(:item).permit(:name, :explanatory_text, :price, :status_id, :delivery_fee_id, :address_id, :delivery_date_id, :genre_id, :image).merge(user_id: current_user.id)
  end

  def set_item
    @item = Item.find(params[:id])
  end

  def move_to_rogin
    redirect_to new_user_session_path unless user_signed_in?
  end

  def move_to_top
    redirect_to root_path unless current_user.id == @item.user_id
  end
end
