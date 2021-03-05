class BuysController < ApplicationController

  def index
    @item = Item.find(params[:item_id])
  end

  def new
    @buy = BuyForm.new
  end

  def create
    @buy = BuyForm.new(set_params)
    if @buy.valid?
      @buy.save
    end
  end

  private

  def buy_item_params
    params.require(:item).permit(:title, :price, :postage_id)
  end

  def set_params
    params.permit(:telephone, :postcode, :prefecture_id, :city, :block, :building, :buy, :user, :item)
  end

end
