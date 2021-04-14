class PurchasesController < ApplicationController
  before_action :authenticate_user!, except: :index
  before_action :set_item_id, only: [:index,:create]

  def index
    binding.pry
    if @item.purchase.present? || @item.user_id == current_user.id
      redirect_to root_path
    else
      @purchase_address = PurchaseAddress.new
    end
  end

  def create
    @purchase_address = PurchaseAddress.new(purchase_params)
    if @purchase_address.valid?
      pay_item
      @purchase_address.save
      redirect_to root_path
    else
      render :index
    end
  end

  private
  
  def purchase_params
    params.require(:purchase_address).permit(:postal_code,:area_id,:municipality,:address,:building,:phone_number).merge(user_id: current_user.id, item_id: params[:item_id],token: params[:token])
  end

  def set_item_id
    @item = Item.find(params[:item_id],params[:user_id])
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
      Payjp::Charge.create(
        amount: @item.price,
        card: purchase_params[:token],
        currency: 'jpy'
      )
  end
end