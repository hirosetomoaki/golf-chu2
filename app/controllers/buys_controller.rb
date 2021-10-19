class BuysController < ApplicationController
  before_action :item_params, only: [:index, :create]

  def index
    @buyaddress = BuyAddress.new
  end


  private

  def item_params
    @item = Item.find(params[:item_id])
  end

end
