class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :edit]
  before_action :set_item_id, only: [:show,:edit]
  def index
    @items = Item.all.order(created_at: :desc)
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

  private

  def item_params
    params.require(:item).permit(:name, :description, :category_id, :state_id, :delivery_fee_id, :area_id, :delivery_time_id, :price,
                                 :image).merge(user_id: current_user.id)
  end

  def set_item_id
    @item = Item.find(params[:id])
  end
end
