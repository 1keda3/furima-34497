class BuysController < ApplicationController
  before_action :item_find, only: [:index, :create]
  before_action :authenticate_user!, only: [:index, :create]
  before_action :buy_redirect_to, only: [:index, :create]
  def index
    @buy_form = BuyForm.new
  end

  def create
    @buy_form = BuyForm.new(buy_params)
    binding.pry
    if @buy_form.valid?
      pay_item
      @buy_form.save
      redirect_to root_path
    else
      render :index
    end
  end

  private

  def buy_params
    params.require(:buy_form).permit(:telephone, :postcode, :prefecture_id, :city, :block, :building).merge(user: current_user.id, item: params[:item_id], token: params[:token], price: @item.price, user_id: @item.user_id)
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    Payjp::Charge.create(
      amount: buy_params[:price],
      card: buy_params[:token],
      currency: 'jpy'
    )
  end

  def buy_redirect_to
    if current_user.id == @item.user_id
      redirect_to root_path
    end
  end

  def item_find
    @item = Item.find(params[:item_id])
  end

end
