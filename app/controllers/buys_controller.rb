class BuysController < ApplicationController
  before_action :item_params, only: [:index, :create]



  def index
    @buyaddress = BuyAddress.new
  end

  def create
    @buyaddress = BuyAddress.new(buy_params)
    if @buyaddress.valid?
       @buyaddress.save
      redirect_to root_path
    else
      render :index
    end
  end

  private

  def buy_params
    params.require(:buy_address).permit(:postal_code, :state_id, :city, :street, :building_name, :phone).merge(user_id: current_user.id, item_id: params[:item_id],token: params[:token])
  end

  def item_params
    @item = Item.find(params[:item_id])
  end

 

end
