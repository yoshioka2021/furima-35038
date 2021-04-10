class ItemsController < ApplicationController
  before_action :authenticate_user!, only: new

  def index
  end

  def new
    if user_signed_in?
      @item = Item.new
    else
      redirect_to new_user_session_path
    end
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
    params.require(:item).permit(:name, :description, :category_id, :state_id, :delivery_fee_id, :area_id, :delivery_time_id, :price,
                                 :image).merge(user_id: current_user.id)
  end
end
