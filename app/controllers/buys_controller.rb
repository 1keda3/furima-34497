class BuysController < ApplicationController

  def index
    @item = Item.find(params[:item_id])
  end

  private

  def buy_item_params
    params.require(:item).permit(:title, :price, :postage_id)
  end

end
